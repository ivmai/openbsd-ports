COMMENT =		XRandR GUI
MODPY_EGG_VERSION =	0.1.11
DISTNAME =		arandr-${MODPY_EGG_VERSION}
CATEGORIES =		x11 sysutils
HOMEPAGE =		https://christian.amsuess.com/tools/arandr/

MAINTAINER =		Edd Barrett <edd@openbsd.org>

# GPLv3
PERMIT_PACKAGE =	Yes

MASTER_SITES =		https://christian.amsuess.com/tools/arandr/files/

MODULES =		lang/python

RUN_DEPENDS =		devel/desktop-file-utils \
			devel/py-gobject3${MODPY_FLAVOR}
BUILD_DEPENDS =		devel/gettext,-tools \
			textproc/py-docutils${MODPY_FLAVOR}

NO_TEST =		Yes

.include <bsd.port.mk>
