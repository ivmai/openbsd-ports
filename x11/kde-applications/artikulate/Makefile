COMMENT =	pronunciation trainer
DISTNAME =	artikulate-${VERSION}
CATEGORIES =	education
REVISION =	0

SHARED_LIBS +=  artikulatecore            3.0 # 0.0
SHARED_LIBS +=  artikulatelearnerprofile  2.0 # 0.0
SHARED_LIBS +=  artikulatesound           3.1 # 0.0

WANTLIB += ${COMPILER_LIBCXX} KF5Archive KF5Attica KF5Auth KF5AuthCore
WANTLIB += KF5Codecs KF5ConfigCore KF5ConfigGui KF5ConfigWidgets
WANTLIB += KF5CoreAddons KF5Crash KF5I18n KF5NewStuff KF5NewStuffCore
WANTLIB += KF5Service KF5WidgetsAddons KF5XmlGui Qt5Core Qt5DBus
WANTLIB += Qt5Gui Qt5Multimedia Qt5Network Qt5Qml Qt5QmlModels
WANTLIB += Qt5Quick Qt5Sql Qt5Widgets Qt5Xml Qt5XmlPatterns c
WANTLIB += m

MODKDE5_ICON_CACHE = yes
MODKDE5_TRANSLATIONS = yes
MODKF5_L10N_CONFLICT = yes
MODKDE5_DOCS = yes
MODKDE5_DESKTOP_FILE = yes

BUILD_DEPENDS =	x11/qt5/qtquickcontrols
RUN_DEPENDS =	x11/qt5/qtquickcontrols

LIB_DEPENDS =	devel/kf5/karchive \
		devel/kf5/attica \
		devel/kf5/kauth \
		devel/kf5/kcodecs \
		devel/kf5/kconfig \
		devel/kf5/kconfigwidgets \
		devel/kf5/kcoreaddons \
		devel/kf5/ki18n \
		devel/kf5/knewstuff \
		devel/kf5/kservice \
		devel/kf5/kwidgetsaddons \
		devel/kf5/kxmlgui \
		x11/qt5/qtdeclarative \
		x11/qt5/qtxmlpatterns \
		x11/qt5/qtmultimedia

.include <bsd.port.mk>
