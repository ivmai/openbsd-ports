COMMENT =		Python wrapper for pandoc

MODPY_EGG_VERSION =	1.10

DISTNAME =		pypandoc-${MODPY_EGG_VERSION}
PKGNAME =		py-${DISTNAME}

CATEGORIES =		textproc

HOMEPAGE =		https://github.com/bebraw/pypandoc

# MIT
PERMIT_PACKAGE =	Yes

MODULES =		lang/python

MODPY_PI =		Yes
MODPY_PYBUILD =		poetry-core
MODPY_PYTEST_ARGS =	tests.py

FLAVORS =		python3
FLAVOR =		python3

RUN_DEPENDS =		textproc/pandoc

PORTHOME =		${WRKDIR}

TEST_DEPENDS =		print/texlive/texmf,-main \
			textproc/pandoc

.include <bsd.port.mk>
