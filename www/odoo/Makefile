PORTROACH=		ignore:1

COMMENT=		all-in-one management software

MV=			15.0
SV=			20220427
V=			${MV}.${SV}
REVISION=		5

DISTNAME=		odoo_${V}

PKGNAME=		${DISTNAME:S/_/-/}
CATEGORIES=		www

MAINTAINER=		Robert Nagy <robert@openbsd.org>

HOMEPAGE=		https://www.odoo.com

MASTER_SITES=		https://nightly.odoocdn.com/${MV}/nightly/src/

MODULES=		lang/python
MODPY_PYBUILD =		setuptools

WRKDIST=		${WRKDIR}/odoo-${MV}.post${SV}

RUN_DEPENDS=		converters/py-html2text${MODPY_FLAVOR} \
			converters/py-num2words${MODPY_FLAVOR} \
			databases/postgresql,-main \
			databases/py-psycopg2${MODPY_FLAVOR} \
			devel/py-babel${MODPY_FLAVOR} \
			devel/py-dateutil${MODPY_FLAVOR} \
			devel/py-decorator${MODPY_FLAVOR} \
			devel/py-gevent${MODPY_FLAVOR} \
			devel/py-mock${MODPY_FLAVOR} \
			devel/py-stdnum${MODPY_FLAVOR} \
			devel/py-xlsxwriter${MODPY_FLAVOR} \
			graphics/py-Pillow${MODPY_FLAVOR} \
			graphics/py-dot${MODPY_FLAVOR} \
			graphics/py-qrcode${MODPY_FLAVOR} \
			lang/node \
			print/py-reportlab${MODPY_FLAVOR} \
			security/py-openssl${MODPY_FLAVOR} \
			security/py-passlib${MODPY_FLAVOR} \
			sysutils/py-psutil${MODPY_FLAVOR} \
			telephony/py-phonenumbers${MODPY_FLAVOR} \
			textproc/py-PyPDF2${MODPY_FLAVOR} \
			textproc/py-chardet${MODPY_FLAVOR} \
			textproc/py-docutils${MODPY_FLAVOR} \
			textproc/py-lxml${MODPY_FLAVOR} \
			textproc/py-ofxparse${MODPY_FLAVOR} \
			textproc/py-polib${MODPY_FLAVOR} \
			textproc/py-vobject${MODPY_FLAVOR} \
			textproc/py-xlwt${MODPY_FLAVOR} \
			textproc/py-yaml${MODPY_FLAVOR} \
			textproc/wkhtmltopdf \
			www/py-jinja2${MODPY_FLAVOR} \
			www/py-requests${MODPY_FLAVOR} \
			www/py-requests-futures${MODPY_FLAVOR} \
			www/py-requests-toolbelt${MODPY_FLAVOR} \
			www/py-werkzeug${MODPY_FLAVOR} \
			www/sassc

# LGPL
PERMIT_PACKAGE =	Yes

PKG_ARCH=		*

.include <bsd.port.mk>
