COMMENT =	reversi board game
DISTNAME =	kreversi-${VERSION}
CATEGORIES =	games
REVISION =	0

HOMEPAGE =	https://www.kde.org/applications/games/kreversi

WANTLIB += ${COMPILER_LIBCXX} KF5Auth KF5AuthCore KF5Bookmarks
WANTLIB += KF5Codecs KF5Completion KF5ConfigCore KF5ConfigGui
WANTLIB += KF5ConfigWidgets KF5CoreAddons KF5Crash KF5DBusAddons
WANTLIB += KF5I18n KF5ItemViews KF5JobWidgets KF5KDEGames KF5KIOCore
WANTLIB += KF5KIOFileWidgets KF5KIOGui KF5KIOWidgets KF5Service
WANTLIB += KF5Solid KF5WidgetsAddons KF5WindowSystem KF5XmlGui
WANTLIB += Qt5Concurrent Qt5Core Qt5DBus Qt5Gui Qt5Network Qt5Qml
WANTLIB += Qt5QmlModels Qt5Quick Qt5QuickWidgets Qt5Svg Qt5Widgets
WANTLIB += Qt5Xml X11 c m

MODKDE5_DESKTOP_FILE = yes
MODKDE5_ICON_CACHE = yes
MODKDE5_TRANSLATIONS = yes
MODKF5_L10N_CONFLICT = yes
MODKDE5_DOCS = yes

BUILD_DEPENDS =	x11/qt5/qtquickcontrols
RUN_DEPENDS =	x11/qt5/qtquickcontrols

LIB_DEPENDS =	devel/kf5/kauth \
		devel/kf5/kbookmarks \
		devel/kf5/kcodecs \
		devel/kf5/kcompletion \
		devel/kf5/kconfig \
		devel/kf5/kconfigwidgets \
		devel/kf5/kcoreaddons \
		devel/kf5/kcrash \
		devel/kf5/kdbusaddons \
		devel/kf5/kdeclarative \
		devel/kf5/ki18n \
		devel/kf5/kio \
		devel/kf5/kjobwidgets \
		devel/kf5/kservice \
		devel/kf5/kwidgetsaddons \
		devel/kf5/kxmlgui \
		devel/kf5/solid \
		x11/kde-applications/libkdegames \
		x11/qt5/qtdeclarative \
		x11/qt5/qtsvg

.include <bsd.port.mk>
