COMMENT=	identify or delete duplicate files

V=		2.2.1
DISTNAME=	fdupes-$V
CATEGORIES=	sysutils

HOMEPAGE=	https://github.com/adrianlopezroche/fdupes
MASTER_SITES=	https://github.com/adrianlopezroche/fdupes/releases/download/v$V/

MAINTAINER =	Martin Ziemer <horrad@horrad.de>

# MIT
PERMIT_PACKAGE=	Yes

WANTLIB += c curses pcre2-32

CONFIGURE_STYLE= gnu
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" LDFLAGS="-L${LOCALBASE}/lib"

LIB_DEPENDS=	devel/pcre2

.include <bsd.port.mk>
