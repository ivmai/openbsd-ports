COMMENT =	framework for generation of reports in multiple formats

VERSION =	3.2.0
DISTNAME =	kreport-${VERSION}
REVISION =	2

CATEGORIES =	devel

HOMEPAGE =	https://kexi-project.org/

MAINTAINER =	Rafael Sadowski <rsadowski@openbsd.org>

SHARED_LIBS +=  KReport3                  1.0 # 3.0

# GPLv2+, LGPLv2+ and GNU FDLv1.2
PERMIT_PACKAGE =	Yes

WANTLIB += ${COMPILER_LIBCXX} KF5ConfigCore KF5ConfigGui KF5CoreAddons
WANTLIB += KF5WidgetsAddons KPropertyCore3 KPropertyWidgets3 Qt5Core
WANTLIB += Qt5Gui Qt5Network Qt5PrintSupport Qt5Qml Qt5WebKit
WANTLIB += Qt5WebKitWidgets Qt5Widgets Qt5Xml m marblewidget-qt5
WANTLIB += Qt5Positioning Qt5QmlModels Qt5Quick Qt5WebChannel
WANTLIB += Qt5WebEngine Qt5WebEngineCore Qt5WebEngineWidgets


MASTER_SITES =	${MASTER_SITE_KDE:=stable/kreport/src/}}
EXTRACT_SUFX =	.tar.xz

MODULES =		devel/kf5 \
			lang/python

MODPY_RUNDEP =		No

BUILD_DEPENDS =		shells/bash \
			devel/kf5/kguiaddons \
			x11/qt5/qttools \
			devel/gettext,-tools

LIB_DEPENDS =		devel/kf5/kconfig \
			devel/kf5/kcoreaddons \
			devel/kf5/kwidgetsaddons \
			devel/kproperty>=3.2.0 \
			x11/kde-applications/marble \
			x11/qt5/qtwebkit

CONFIGURE_ARGS =	-DBUILD_TESTING=Yes \
			-DBUILD_EXAMPLES=Yes

TEST_IS_INTERACTIVE =	X11

.include <bsd.port.mk>
