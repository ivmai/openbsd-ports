COMMENT=	download data from remote data services (such as THREDDS)

MODPY_EGG_VERSION=	0.9
DISTNAME=	siphon-${MODPY_EGG_VERSION}
PKGNAME=	py-${DISTNAME}
CATEGORIES=	net
REVISION=	3

HOMEPAGE=	https://unidata.github.io/siphon/

MAINTAINER=	Martin Reindl <martin@catai.org>

# BSD
PERMIT_PACKAGE=	Yes

MODPY_PYBUILD=	setuptools
MODPY_PI=	Yes

MODULES=	lang/python

FLAVORS=	python3
FLAVOR=		python3

RUN_DEPENDS+=	devel/py-protobuf${MODPY_FLAVOR} \
		math/py-numpy${MODPY_FLAVOR} \
		math/py-pandas${MODPY_FLAVOR} \
		www/py-beautifulsoup4${MODPY_FLAVOR} \
		www/py-requests${MODPY_FLAVOR}

MODPY_PYTEST=	Yes
TEST_DEPENDS=	devel/py-coveralls${MODPY_FLAVOR} \
		devel/py-test-cov${MODPY_FLAVOR} \
		math/py-netcdf4${MODPY_FLAVOR} \
		www/py-vcrpy${MODPY_FLAVOR}

.include <bsd.port.mk>
