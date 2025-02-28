# qmake picks up gcrypt.h even though it's unused
DPB_PROPERTIES =	nojunk

VER =		4.5.3
DISTNAME =	qbittorrent-${VER}

DIST_SUBDIR =	qbittorrent

CATEGORIES ?=	net

HOMEPAGE ?=	https://www.qbittorrent.org

MAINTAINER =	Klemens Nanni <kn@openbsd.org>

# GPLv2
PERMIT_PACKAGE =	Yes

MASTER_SITES ?=	${MASTER_SITE_SOURCEFORGE:=qbittorrent/}

MODULES +=	devel/cmake \
		x11/qt6

BUILD_DEPENDS +=	devel/boost \
			x11/qt6/qttools

LIB_DEPENDS +=		net/libtorrent-rasterbar>=2

CONFIGURE_STYLE =	cmake
CONFIGURE_ARGS +=	-DQT6=ON
# for automatic stacktraces on crash:  autoconf links it, cmake does not
CONFIGURE_ARGS +=	-DCMAKE_EXE_LINKER_FLAGS='${LDFLAGS} -lexecinfo'

# #error "Boost.Stacktrace requires `_Unwind_Backtrace` function.             \
#    Define `_GNU_SOURCE` macro or `BOOST_STACKTRACE_GNU_SOURCE_NOT_REQUIRED` \
#    if _Unwind_Backtrace is available without `_GNU_SOURCE`."
CXXFLAGS +=		-DBOOST_STACKTRACE_GNU_SOURCE_NOT_REQUIRED
