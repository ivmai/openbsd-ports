COMMENT=		I18N/L10N tools for Python

MODPY_EGG_VERSION=	2.12.1
DISTNAME=		Babel-${MODPY_EGG_VERSION}
PKGNAME=		py-${DISTNAME:L}
CATEGORIES=		devel

HOMEPAGE=		https://babel.pocoo.org/

# BSD
PERMIT_PACKAGE=		Yes

MODULES=		lang/python

MODPY_PI=		Yes
MODPY_PYBUILD=		setuptools

RUN_DEPENDS=		devel/py-tz${MODPY_FLAVOR}
TEST_DEPENDS=		devel/py-freezegun${MODPY_FLAVOR}

FLAVORS=		python3
FLAVOR=			python3

.include <bsd.port.mk>
