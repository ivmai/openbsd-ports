COMMENT =		Unicode font for African Arabic script
V =			2.000
DISTNAME =		Alkalami-${V}
PKGNAME =		alkalami-${V}
CATEGORIES =		fonts

HOMEPAGE =		https://software.sil.org/alkalami/
MAINTAINER =		George Rosamond <george@nycbug.org>

# SIL OFL 1.1
PERMIT_PACKAGE =	Yes

MASTER_SITES =		https://software.sil.org/downloads/r/alkalami/
EXTRACT_SUFX =		.zip

MODULES =		font

NO_BUILD =		Yes
NO_TEST =		Yes

FONTDIR =		${PREFIX}/share/fonts/alkalami
DOCDIR =		${PREFIX}/share/doc/alkalami

do-install:
	${INSTALL_DATA_DIR} ${FONTDIR} ${DOCDIR}
	${INSTALL_DATA} ${WRKDIST}/*.ttf ${FONTDIR}
	${INSTALL_DATA} ${WRKDIST}/{FONTLOG.txt,README.txt} ${DOCDIR}

.include <bsd.port.mk>
