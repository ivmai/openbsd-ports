COMMENT =	audio player with QML and KDE Plasma integration
DISTNAME =	elisa-${VERSION}
CATEGORIES =	audio
REVISION =	0

HOMEPAGE =	https://elisa.kde.org/

SHARED_LIBS +=  elisaLib                  1.0 # 0.1

WANTLIB += ${COMPILER_LIBCXX} KF5Auth KF5AuthCore KF5Baloo KF5Bookmarks
WANTLIB += KF5Codecs KF5Completion KF5ConfigCore KF5ConfigGui
WANTLIB += KF5ConfigWidgets KF5CoreAddons KF5Crash KF5DBusAddons
WANTLIB += KF5FileMetaData KF5I18n KF5IconThemes KF5ItemViews
WANTLIB += KF5JobWidgets KF5KIOCore KF5KIOFileWidgets KF5KIOGui
WANTLIB += KF5KIOWidgets KF5Service KF5Solid KF5WidgetsAddons
WANTLIB += KF5WindowSystem KF5XmlGui Qt5Concurrent Qt5Core Qt5DBus
WANTLIB += Qt5Gui Qt5Multimedia Qt5Network Qt5Qml Qt5QmlModels
WANTLIB += Qt5Quick Qt5QuickControls2 Qt5Sql Qt5Widgets Qt5Xml
WANTLIB += X11 c m vlc

MODKDE5_DESKTOP_FILE = yes
MODKDE5_ICON_CACHE = yes
MODKDE5_TRANSLATIONS = yes
MODKDE5_DOCS = yes

BUILD_DEPENDS =	devel/kf5/kinit \
		devel/kf5/kirigami2

RUN_DEPENDS =	devel/kf5/kinit \
		devel/kf5/kirigami2

LIB_DEPENDS =	devel/kf5/kauth \
		devel/kf5/kbookmarks \
		devel/kf5/kcodecs \
		devel/kf5/kcompletion \
		devel/kf5/kconfig \
		devel/kf5/kconfigwidgets \
		devel/kf5/kcoreaddons \
		devel/kf5/kcrash \
		devel/kf5/kdbusaddons \
		devel/kf5/kfilemetadata \
		devel/kf5/ki18n \
		devel/kf5/kio \
		devel/kf5/kitemviews \
		devel/kf5/kjobwidgets \
		devel/kf5/kservice \
		devel/kf5/kwidgetsaddons \
		devel/kf5/kwindowsystem \
		devel/kf5/kxmlgui \
		devel/kf5/baloo \
		devel/kf5/solid \
		x11/qt5/qtdeclarative \
		x11/qt5/qtmultimedia \
		x11/qt5/qtquickcontrols2 \
		x11/vlc

.include <bsd.port.mk>
