SHARED_LIBS +=  translate                 0.0 # 0.0

COMMENT=	library/CLI tool interfacing to online translation services

DISTNAME=	libtranslate-0.99
REVISION=	8

CATEGORIES=	textproc

HOMEPAGE=	http://www.nongnu.org/libtranslate/

# BSD
PERMIT_PACKAGE=	Yes

WANTLIB =  c ffi gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0 gthread-2.0
WANTLIB += iconv intl lzma m pcre2-8 pthread soup-2.4 sqlite3 xml2 z
WANTLIB += brotlicommon brotlidec idn2 psl unistring

MASTER_SITES=	${MASTER_SITE_SAVANNAH:=libtranslate/}

LIB_DEPENDS=	devel/glib2 \
		devel/libsoup \
		textproc/libxml
BUILD_DEPENDS +=	textproc/p5-XML-Parser

USE_GMAKE=		Yes
CONFIGURE_STYLE=	autoconf
AUTOCONF_VERSION=	2.59

CFLAGS+=	-I${LOCALBASE}/include

.include <bsd.port.mk>
