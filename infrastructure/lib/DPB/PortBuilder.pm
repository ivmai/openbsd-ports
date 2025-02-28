# ex:ts=8 sw=4:
# $OpenBSD: PortBuilder.pm,v 1.94 2023/05/30 05:35:19 espie Exp $
#
# Copyright (c) 2010-2013 Marc Espie <espie@openbsd.org>
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

use v5.36;

# this object is responsible for launching the build of ports
# which mostly includes starting the right jobs
package DPB::PortBuilder;
use File::Path;
use DPB::Util;
use DPB::Job::Port;
use DPB::Serialize;

sub new($class, $state)
{
	if ($state->opt('R')) {
		require DPB::PortBuilder::Rebuild;
		$class = $class->rebuild_class;
	}
	my $self = bless {
	    state => $state,
	    clean => $state->opt('c'),
	    fetch => $state->opt('f'),
	    wantsize => $state->{wantsize},
	    fullrepo => $state->fullrepo,
	    realfullrepo => $state->anchor($state->fullrepo),
	    sizer => $state->sizer,
	    heuristics => $state->heuristics}, $class;
	if ($state->opt('u') || $state->opt('U')) {
		$self->{update} = 1;
	}
	if ($state->opt('U')) {
		$self->{forceupdate} = 1;
	}
	if ($self->{fetch} && $state->defines('NO_CHECKSUM')) {
		$self->{nochecksum} = 1;
	}
	$self->init;
	return $self;
}

sub want_size($self, $v, $core)
{
	if (!$self->{wantsize}) {
		return 0;
	}
	# always show for inmem
	if ($core->{inmem}) {
		return 1;
	}
	# do we already have this stats ? don't run it every time
	if ($self->{sizer}->match_pkgname($v)) {
		return rand(10) < 1;
	} else {
		return 1;
	}
}

sub rebuild_class($)
{ 'DPB::PortBuilder::Rebuild' }

sub ports($self)
{
	return $self->{state}->ports;
}

sub logger($self)
{
	return $self->{state}->logger;
}

sub locker($self)
{
	return $self->{state}->locker;
}

sub dontjunk($self, $v)
{
	$self->{dontjunk}{$v->fullpkgname} = 1;
}

sub should_clean($self, $v)
{
	my $state = $self->{state};
	if ($state->{never_clean}) {
		return 0;
	} else {
		return  !$state->{dontclean}{$v->pkgpath};
	}
}

sub make($self)
{
	return $self->{state}->make;
}

sub make_args($self)
{
	return $self->{state}->make_args;
}

sub init($self)
{
	my $state = $self->{state};
	$state->{build_user}->make_path($self->{realfullrepo});
	$state->{fetch_user}->make_path($state->anchor(
	    join("/", $state->{repo}, $state->arch, "cache")));
	$self->{global} = $self->logger->append("build");
	$self->{lockperf} = 
	    DPB::Util->make_hot($self->logger->append("awaiting-locks"));
	if ($self->{wantsize}) {
		$self->{logsize} = 
		    DPB::Util->make_hot($self->logger->append("size"));
	}
	if ($state->defines("WRAP_MAKE")) {
		$self->{rsslog} = $self->logger->logfile("rss");
		$self->{wrapper} = $state->defines("WRAP_MAKE");
	}
}

sub pkgfile($self, $v)
{
	my $name = $v->fullpkgname;
	return "$self->{realfullrepo}/$name.tgz";
}

sub check($self, $v)
{
	return $self->{state}{build_user}->run_as(
	    sub() { 
	    	return -f $self->pkgfile($v); 
	    });
}

sub end_check	# forwarder
{
	&check;
}

sub checks_rebuild($, $)
{
}

sub register_package($, $)
{
}

sub report($self, $v, $job, $core)
{
	return if $job->{signature_only};
	my $pkgpath = $v->fullpkgpath;
	my $host = $core->fullhostname;
	if ($core->{realjobs}) {
		$host .= '*'.$core->{realjobs};
	}
	my $log = $self->{global};
	my $sz = $self->logger->run_as(
	    sub() { 
		return  (stat $self->logger->log_pkgpath($v))[7]; 
	    });
	if (defined $job->{offset}) {
		$sz -= $job->{offset};
	}
	print $log "$pkgpath $host ", $job->totaltime, " ", $sz, " ",
	    $job->timings;
	if ($job->{failed}) {
		my $fh = $self->logger->open('>>', $job->{log});
		print $fh "Error: job failed with $job->{failed} on ",
		    $core->hostname, " at ", CORE::time(), "\n" if defined $fh;
		print $log  "!\n";
	} else {
		print $log  "\n";
		return unless defined $self->{state}{permanent_log};
		my $fh = $self->logger->open('>>', 
		    $self->{state}{permanent_log});
		return unless defined $fh;
		print $fh DPB::Serialize::Build->write({
		    pkgpath => $pkgpath, 
		    host => $host, 
		    time => $job->totaltime, 
		    size => $sz}), "\n";
	}
}

sub get($self)
{
	return DPB::Core->get;
}

sub end_lock($self, $lock, $core, $job)
{
	my $end = CORE::time();
	$lock->write("status", $core->{status});
	$lock->write("todo", $job->current_task);
	$lock->write("end", "$end (".DPB::Util->time2string($end).")");
	$lock->close;
}

sub build($self, $v, $core, $lock, $final_sub)
{
	my $start = CORE::time();
	my ($log, $fh) = $self->logger->make_logs($v);
	my $memsize = $self->{sizer}->build_in_memory($fh, $core, $v);
	my $meminfo;

	if ($memsize) {
		$lock->write("mem", $memsize);
		$meminfo = " in memory";
		$core->{inmem} = $memsize;
	} else {
		$meminfo = "";
		$core->{inmem} = 0;
	}
	if (defined (my $t = $v->{info}->has_property('tag'))) {
		$lock->write("tag", $t);
	}
	print $fh ">>> Building on ", $core->hostname, $meminfo, " under ";
	$v->quick_dump($fh);

	my $job; # separate decl for closure
	$job = DPB::Job::Port->new(
	    log => $log, logfh => $fh, v => $v, builder => $self, core => $core,
	    lock => $lock,
	    memsize => $memsize,
	    endcode => sub($core) {
		$self->end_lock($lock, $core, $job); 
		$self->report($v, $job, $core); 
		&$final_sub($job->{failed});
	});
	$core->start_job($job);
	# lonesome takes precedence for swallowing everything
	if ($job->{lonesome}) {
		# make it arbitrarily high
		$core->can_swallow(1000);
	} elsif ($job->{parallel}) {
		$core->can_swallow($job->{parallel}-1);
	}
	$lock->write("host", $core->hostname);
	$lock->write("pid", $core->{pid});
	$lock->write("start", "$start (".DPB::Util->time2string($start).")");
}

sub wipe($self, $v, $core, $final_sub)
{
	my ($log, $fh) = $self->logger->make_logs($v);
	print $fh ">>> Wiping on ", $core->hostname, " under ";
	$v->quick_dump($fh);

	my $job; # separate decl for endcode closure
	$job = DPB::Job::Port::Wipe->new(
	    log => $log, logfh => $fh, v => $v, builder => $self, core => $core,
	    endcode => sub($core) {
		$self->report($v, $job, $core); 
		&$final_sub($job->{failed});
	});
	$core->start_job($job);
}

sub force_junk($self, $v, $core, $final_sub)
{
	my $log = $self->logger->log_pkgpath($v);
	my $fh = $self->logger->open('>>', $log);
	print $fh ">>> Force junking on ", $core->hostname;
	my $job; # separate decl for endcode closure
	$job = DPB::Job::Port->new_junk_only(
	    log => $log, logfh => $fh, v => $v, builder => $self, core => $core,
	    endcode => sub($core) {
		&$final_sub($job->{failed});
		$core->mark_ready;
	});
	$core->start_job($job);
}

sub test($self, $v, $core, $lock, $final_sub)
{
	my $start = CORE::time();
	my $log = $self->logger->make_test_logs($v);
	my $memsize = $self->{sizer}->build_in_memory($core, $v);

	open my $fh, ">>", $log or DPB::Util->die_bang("can't open $log");
	if ($memsize) {
		$lock->write("mem", $memsize);
		print $fh ">>> Building in memory under ";
		$core->{inmem} = $memsize;
	} else {
		print $fh ">>> Building under ";
		$core->{inmem} = 0;
	}
	if (defined (my $t = $v->{info}->has_property('tag'))) {
		$lock->write("tag", $t);
	}
	$v->quick_dump($fh);

	my $job; # separate decl for endcode closure
	$job = DPB::Job::Port::Test->new(
	    log => $log, logfh => $fh, v => $v, builder => $self, core => $core,
	    lock => $lock, 
	    memsize => $memsize, 
	    endcode => sub($core) {
		$self->end_lock($lock, $core, $job); 
		$self->report($v, $job, $core); 
		&$final_sub($job->{failed});
	});
	$core->start_job($job);
	$lock->write("host", $core->hostname);
	$lock->write("pid", $core->{pid});
	$lock->write("start", "$start (".DPB::Util->time2string($start).")");
}

sub install($self, $v, $core)
{
	my ($log, $fh) = $self->logger->make_logs($v);
	print $fh ">>> Installing under ";
	$v->quick_dump($fh);
	my $job = DPB::Job::Port::Install->new(
	    log => $log, logfh => $fh, v => $v, builder => $self, core => $core,
	    endcode => sub($core) {
	    	$core->mark_ready; 
	});
	$core->start_job($job);
	return $core;
}


1;
