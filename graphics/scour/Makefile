COMMENT =		SVG scrubber
MODPY_EGG_VERSION =	0.35
REVISION =		7
CATEGORIES =		graphics
HOMEPAGE =		http://www.codedread.com/scour/

PERMIT_PACKAGE =	Yes

GH_ACCOUNT =		codedread
GH_PROJECT =		scour
GH_TAGNAME =		v${MODPY_EGG_VERSION}

MODULES =		lang/python
MODPY_PYBUILD =		setuptools
RUN_DEPENDS =		devel/py-six${MODPY_FLAVOR}

do-test:
	@cd ${WRKDIST} && ${MODPY_BIN} testscour.py
	@cd ${WRKDIST} && ${MODPY_BIN} testcss.py

.include <bsd.port.mk>
