COMMENT =	lightweight Qt5 notes manager
DISTNAME =	feathernotes-${GH_TAGNAME:S/^V//}
CATEGORIES =	misc x11
REVISION =	0

GH_ACCOUNT =	tsujan
GH_PROJECT =	FeatherNotes
GH_TAGNAME =	V0.9.0

MAINTAINER =	Brian Callahan <bcallah@openbsd.org>

# GPLv3+
PERMIT_PACKAGE =	Yes

WANTLIB += ${COMPILER_LIBCXX} GL Qt5Core Qt5Gui Qt5PrintSupport
WANTLIB += Qt5Svg Qt5Widgets Qt5X11Extras Qt5Xml X11 c m

MODULES =	devel/qmake \
		x11/qt5

LIB_DEPENDS =	x11/qt5/qtsvg \
		x11/qt5/qtx11extras

RUN_DEPENDS =	devel/desktop-file-utils \
		misc/shared-mime-info \
		x11/gtk+4,-guic

NO_TEST =	Yes

.include <bsd.port.mk>
