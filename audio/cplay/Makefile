COMMENT =	simple curses audio player

MODPY_EGG_VERSION =	5.0.1

DISTNAME =	cplay-ng-${MODPY_EGG_VERSION}
PKGNAME =	cplay-${MODPY_EGG_VERSION}
REVISION =	2

CATEGORIES =	audio

HOMEPAGE =	https://github.com/xi/cplay-ng

# GPLv2+
PERMIT_PACKAGE =	Yes

MODULES =		lang/python

MODPY_PI =		Yes
MODPY_PYBUILD =		setuptools

RUN_DEPENDS =		multimedia/mpv

post-install:
	ln -s cplay-ng ${PREFIX}/bin/cplay

.include <bsd.port.mk>
