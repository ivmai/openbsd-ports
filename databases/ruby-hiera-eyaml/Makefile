COMMENT =	Hiera backend for decrypting encrypted yaml properties

DISTNAME =	hiera-eyaml-3.3.0
CATEGORIES =	databases

MAINTAINER =	Sebastian Reitenbach <sebastia@openbsd.org>

# MIT
PERMIT_PACKAGE =	Yes

MODULES =		lang/ruby

CONFIGURE_STYLE =	ruby gem

BUILD_DEPENDS =		${RUN_DEPENDS}
RUN_DEPENDS =		databases/ruby-hiera3,${MODRUBY_FLAVOR} \
			devel/ruby-highline,${MODRUBY_FLAVOR} \
			devel/ruby-optimist,${MODRUBY_FLAVOR}

.include <bsd.port.mk>
