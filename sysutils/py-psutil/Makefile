COMMENT =		library to retrieve system information and utilisation

MODPY_EGG_VERSION =	5.9.4

GH_ACCOUNT =		giampaolo
GH_PROJECT =		psutil
GH_TAGNAME =		release-${MODPY_EGG_VERSION}
DISTNAME =		psutil-${MODPY_EGG_VERSION}
PKGNAME =		py-psutil-${MODPY_EGG_VERSION}
CATEGORIES =		sysutils

HOMEPAGE =		https://github.com/giampaolo/psutil

# BSD
PERMIT_PACKAGE =	Yes

WANTLIB += kvm pthread ${MODPY_WANTLIB}

MODULES =		lang/python
MODPY_PYBUILD =		setuptools

FLAVORS =		python3
FLAVOR =		python3

MODPY_PYTEST_ARGS =	lib*/psutil/tests
TEST_DEPENDS =		devel/py-mock${MODPY_FLAVOR}

.include <bsd.port.mk>
