COMMENT=	GTK+3 based xmessage(1) clone

DISTNAME=	gxmessage-3.4.3
REVISION=	3

CATEGORIES=	x11

HOMEPAGE=	http://homepages.ihug.co.nz/~trmusson/programs.html\#gxmessage

# GPLv3
PERMIT_PACKAGE=	Yes

MASTER_SITES=	http://homepages.ihug.co.nz/~trmusson/stuff/

WANTLIB =  atk-1.0 c cairo cairo-gobject gdk-3 gdk_pixbuf-2.0 gio-2.0
WANTLIB += glib-2.0 gobject-2.0 gtk-3 harfbuzz intl pango-1.0
WANTLIB += pangocairo-1.0

MODULES=	textproc/intltool

LIB_DEPENDS=	x11/gtk+3

RUN_DEPENDS=	x11/gtk+4,-guic

CONFIGURE_STYLE=gnu
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/gxmessage
	${INSTALL_DATA} ${WRKSRC}/examples/* \
		${PREFIX}/share/examples/gxmessage

.include <bsd.port.mk>
