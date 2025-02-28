COMMENT =	Qt-based MPD client

V =		2.5.0
DISTNAME =	cantata-${V}
HOMEPAGE =	https://github.com/CDrummond/cantata
REVISION =	0

MASTER_SITES =	https://github.com/CDrummond/cantata/releases/download/v${V}/
EXTRACT_SUFX =	.tar.bz2

CATEGORIES =	audio

# GPLv2 only
PERMIT_PACKAGE =	Yes

WANTLIB += ${COMPILER_LIBCXX} Qt5Concurrent Qt5Core Qt5DBus Qt5Gui
WANTLIB += Qt5Multimedia Qt5Network Qt5Sql Qt5Svg Qt5Widgets Qt5Xml
WANTLIB += avahi-client avahi-common avcodec avformat avutil c
WANTLIB += cddb cdio cdio_cdda cdio_paranoia ebur128 iconv m mpg123
WANTLIB += mtp musicbrainz5 tag z

MODULES =	devel/cmake \
		x11/qt5

RUN_DEPENDS +=	devel/desktop-file-utils
RUN_DEPENDS +=	x11/gtk+4,-guic
LIB_DEPENDS +=	audio/mpg123 \
		audio/libcdio \
		audio/libcdio-paranoia \
		audio/libcddb \
		audio/libebur128 \
		audio/libmusicbrainz5 \
		audio/taglib \
		x11/qt5/qtmultimedia \
		x11/qt5/qtsvg \
		devel/libmtp \
		graphics/ffmpeg

CONFIGURE_ARGS +=	-DCMAKE_INSTALL_PREFIX:Path=${PREFIX} \
			-DENABLE_LIBVLC=OFF \
			-DLRELEASE_EXECUTABLE:String=${MODQT_LRELEASE} \
			-DLCONVERT_EXECUTABLE:String=${LOCALBASE}/lib/qt5/bin/lconvert

.include <bsd.port.mk>
