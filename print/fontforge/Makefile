BROKEN-i386=		hangs at runtime. started after switch to clang

COMMENT=		vector font editor/converter

DISTNAME=		fontforge_full-20120731-b
PKGNAME=		${DISTNAME:S,_full,,:S,-b,,}
EXTRACT_SUFX=		.tar.bz2
SHARED_LIBS=		fontforge	4.0 \
			gdraw		5.1 \
			gioftp		2.1 \
			gunicode	5.1 \
			gutils		2.1
REVISION=		6

CATEGORIES=		print

HOMEPAGE=		https://fontforge.github.io/en-US/

MAINTAINER=		Matthias Kilian <kili@openbsd.org>

# BSD
PERMIT_PACKAGE=	Yes

WANTLIB =  ${COMPILER_LIBCXX} ${MODPY_WANTLIB}
WANTLIB += ICE SM X11 Xext Xft Xi Xrender c cairo expat ffi fontconfig
WANTLIB += freetype fribidi gif gio-2.0 gmodule-2.0 glib-2.0
WANTLIB += gobject-2.0 graphite2 harfbuzz iconv intl jpeg lzma m
WANTLIB += pango-1.0 pangocairo-1.0 pangoft2-1.0 pangoxft-1.0 pcre2-8
WANTLIB += pixman-1 png pthread spiro tiff util xcb xcb-render
WANTLIB += xcb-shm xml2 z zstd

MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=fontforge/}

MODULES=		lang/python
MODPY_VERSION =	${MODPY_DEFAULT_VERSION_2}

BUILD_DEPENDS=		devel/gettext,-tools

LIB_DEPENDS=		${MODPY_LIB_DEPENDS}	\
			graphics/cairo	\
			graphics/jpeg		\
			devel/pango		\
			graphics/libspiro	\
			graphics/png		\
			graphics/tiff		\
			graphics/giflib		\
			textproc/libxml

WRKDIST=		${WRKDIR}/${DISTNAME:S,_full,,}

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV=		CPPFLAGS="-I${LOCALBASE}/include"		\
			LDFLAGS="-L${X11BASE}/lib -L${LOCALBASE}/lib	\
				 -lintl -liconv -lz"
CONFIGURE_ARGS=		--without-freetype-src \
			--with-python=${MODPY_BIN} \
			--with-python-lib="$$(python${MODPY_VERSION}-config --libs)" \
			--with-regular-link
USE_GMAKE=		Yes

NO_TEST=		Yes

.include <bsd.port.mk>
