COMMENT=		library for handling paper characteristics

GH_ACCOUNT=		rrthomas
GH_PROJECT=		libpaper
GH_TAGNAME=		v2.1.0

SHARED_LIBS +=  paper                1.0      # 3.0

CATEGORIES=		print

MAINTAINER=		Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv3 - LGPLv2.1
PERMIT_PACKAGE=		Yes

MASTER_SITES=		https://github.com/rrthomas/libpaper/releases/download/${GH_TAGNAME}/

WANTLIB += c

USE_GMAKE=		Yes

CONFIGURE_STYLE=	gnu

FAKE_FLAGS=		sysconfdir="${PREFIX}/share/examples/libpaper"

post-install:
	echo 'a4' > ${PREFIX}/share/examples/libpaper/papersize

.include <bsd.port.mk>
