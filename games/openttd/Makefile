COMMENT=	open source clone of the game Transport Tycoon Deluxe

V =		13.1
DISTNAME =	openttd-$V-source
PKGNAME =	openttd-$V

CATEGORIES=	games

MAINTAINER =	Florian Viehweger <openbsd@out-of-creativity.de>

HOMEPAGE=	https://www.openttd.org/

# GPLv2 only
PERMIT_PACKAGE=	Yes

WANTLIB += ${COMPILER_LIBCXX}
WANTLIB += X11 Xcursor Xext Xfixes Xi Xrandr Xss c fluidsynth fontconfig
WANTLIB += freetype icudata icui18n icuuc lzma lzo2 m png pthread samplerate
WANTLIB += sndio usbhid z

COMPILER =		base-clang ports-gcc base-gcc

MASTER_SITES =		https://proxy.binaries.openttd.org/openttd-releases/$V/
EXTRACT_SUFX =		.tar.xz

DIST_SUBDIR =		openttd

MODULES =		devel/cmake

LIB_DEPENDS=		archivers/lzo2 \
			audio/fluidsynth \
			audio/libsamplerate \
			graphics/png \
			textproc/icu4c \
			archivers/xz

# statically linked
LIB_DEPENDS +=		devel/sdl2
WANTLIB += SDL2

RUN_DEPENDS =		audio/timidity \
			devel/desktop-file-utils \
			games/openttd-data/opengfx \
			games/openttd-data/openmsx \
			games/openttd-data/opensfx \
			x11/gtk+4,-guic

CONFIGURE_ARGS =	-DCMAKE_INSTALL_BINDIR=bin \
			-DCMAKE_INSTALL_DATADIR=share

# Disable allegro support.
# Ours (4.2.3 at time of writing) is old and seemingly incompatible.
CONFIGURE_ARGS +=	-DCMAKE_DISABLE_FIND_PACKAGE_Allegro=ON

NO_TEST=		Yes

DOCSDIR=		${PREFIX}/share/doc/openttd
EXAMPLESDIR=		${PREFIX}/share/examples/openttd
GAMEDIR=		${PREFIX}/share/openttd

WRKDIST =		${WRKDIR}/openttd-$V

DEBUG_PACKAGES =	${BUILD_PACKAGES}

post-install:
	gunzip ${PREFIX}/man/man6/openttd.6.gz
	${INSTALL_DATA_DIR} ${GAMEDIR}/media
	cd ${WRKSRC}/media/ && umask 022 && pax -rw . ${GAMEDIR}/media
	${INSTALL_DATA_DIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/bin/scripts/* ${EXAMPLESDIR}
	${INSTALL_DATA_DIR} ${DOCSDIR}
	cd ${WRKSRC}/docs/ && umask 022 && pax -rw . ${DOCSDIR}
	rm -rf ${WRKINST}/bundle

.include <bsd.port.mk>
