# !!! do not update blindly: sysutils/awscli requires a specific version

COMMENT=		Amazon S3 transfer manager for Python

MODPY_EGG_VERSION=	0.6.1
DISTNAME=		s3transfer-${MODPY_EGG_VERSION}
PKGNAME=		py-${DISTNAME}

CATEGORIES=		net devel

HOMEPAGE=		https://github.com/boto/s3transfer

MAINTAINER=		Antoine Jacoutot <ajacoutot@openbsd.org>

# Apache 2.0
PERMIT_PACKAGE=		Yes

MODULES=		lang/python

MODPY_PI=		Yes
MODPY_PYBUILD=		setuptools

FLAVORS=		python3
FLAVOR=			python3

RUN_DEPENDS=		net/py-botocore${MODPY_FLAVOR}

.include <bsd.port.mk>
