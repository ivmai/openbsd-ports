COMMENT=		small tiling window manager

GH_ACCOUNT=		conformal
GH_PROJECT=		spectrwm
GH_COMMIT=		06e3733175969c307a6fd47240a7a37b29d60513
DISTNAME=		${GH_PROJECT}-3.4.1.20230507

SHARED_LIBS=		swmhack 1.0

CATEGORIES=		x11

MAINTAINER=		Gonzalo L. R. <gonzalo@openbsd.org>, \
			Bjorn Ketelaars <bket@openbsd.org>

# BSD
PERMIT_PACKAGE=	Yes

# uses pledge()
WANTLIB += X11 X11-xcb Xcursor Xft c util xcb xcb-icccm xcb-keysyms
WANTLIB += xcb-randr xcb-util xcb-xinput xcb-xtest

RUN_DEPENDS=	x11/dmenu>=4.5

MAKE_FLAGS=	BINDIR="${TRUEPREFIX}/bin" \
		MANDIR="${TRUEPREFIX}/man/man" \
		SHLIB_MAJOR=${LIBswmhack_VERSION:R} \
		SHLIB_MINOR=${LIBswmhack_VERSION:E}

DEBUG_PACKAGES=	${BUILD_PACKAGES}

NO_TEST=	Yes

pre-configure:
	@${SUBST_CMD} ${WRKSRC}/spectrwm.{1,c}

post-install:
	ln -s ${TRUEPREFIX}/bin/spectrwm ${PREFIX}/bin/scrotwm
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/spectrwm
	${INSTALL_SCRIPT} ${WRKSRC}/baraction.sh ${PREFIX}/share/examples/spectrwm
	${INSTALL_SCRIPT} ${WRKSRC}/initscreen.sh ${PREFIX}/share/examples/spectrwm
	${INSTALL_SCRIPT} ${WRKSRC}/screenshot.sh ${PREFIX}/share/examples/spectrwm
	${INSTALL_DATA} ${WRKSRC}/spectrwm.conf ${PREFIX}/share/examples/spectrwm

.for i in es cz fr fr_ch se us
	${INSTALL_DATA} ${WRKSRC}/spectrwm_$i.conf ${PREFIX}/share/examples/spectrwm
.endfor

.include <bsd.port.mk>
