COMMENT =	kernel normal form formatter

V =		4.1.1
DISTNAME =	knfmt-${V}

CATEGORIES =	devel

HOMEPAGE =	https://github.com/mptre/knfmt

MAINTAINER =	Anton Lindqvist <anton@openbsd.org>

# ISC
PERMIT_PACKAGE =	Yes

# __builtin_{add,mul}_overflow() not available in base-gcc
COMPILER =	base-clang ports-gcc
COMPILER_LANGS =	c

# uses pledge()
WANTLIB +=	c

MASTER_SITES =	https://github.com/mptre/knfmt/releases/download/v${V}/

CONFIGURE_STYLE =	simple
CONFIGURE_ENV =		CPPFLAGS="-I${LOCALBASE}/include"

.include <bsd.port.mk>
