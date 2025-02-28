ONLY_FOR_ARCHS =	amd64 aarch64
COMMENT =		Mozilla e-mail, calendar, rss and usenet client

# Don't forget to bump mail/thunderbird-i18n after updates.

MOZILLA_VERSION =	102.12.0
REVISION =		0
MOZILLA_BRANCH =	release
MOZILLA_PROJECT =	thunderbird
MOZILLA_CODENAME =	comm/mail
EXTRACT_SUFX =		.tar.xz
DEBUG_PACKAGES =	${BUILD_PACKAGES}

# XXX badly formed debug in libxul ?
DWZ = :

HOMEPAGE =	https://www.thunderbird.net/

SO_VERSION =	37.0
# NOTE: Must bump minor version if any shlib's are removed from the
# components dir to avoid pkg_add -r issues.

MOZILLA_LIBS = lgpllibs mozgtk mozsqlite3 xul

CATEGORIES=	mail news

# MPL
PERMIT_PACKAGE=	Yes

MODULES =	www/mozilla lang/python
MODPY_RUNDEP =	No

COMPILER =	ports-clang
MODCLANG_ARCHS =	amd64 aarch64

# 56 requires 59.1
MOZILLA_USE_BUNDLED_ICU =	Yes

# 63 requires node because why not #1483595
BUILD_DEPENDS +=	lang/node
# 63 requires cbindgen #1478813
BUILD_DEPENDS +=	devel/cbindgen
.if (${MACHINE_ARCH}==amd64) || (${MACHINE_ARCH}==i386)
# 67 requires nasm for bundled libdav1d
BUILD_DEPENDS +=	devel/nasm
.endif
# wasi
BUILD_DEPENDS +=	lang/wasi-sdk/compiler-rt \
			lang/wasi-sdk/libcxxabi \
			lang/wasi-sdk/libcxx \
			lang/wasi-libc

WRKDIST =	${WRKDIR}/${MOZILLA_DIST}-${MOZILLA_DIST_VERSION:C/b[0-9]*//}

NO_TEST =	Yes

CONFIGURE_STYLE =	simple
CONFIGURE_SCRIPT =	${MODPY_BIN} ${WRKSRC}/configure.py
CONFIGURE_ARGS +=	--prefix=${PREFIX}
# pledge strings to be defined, and no multiprocess anyway..
CONFIGURE_ARGS +=	--disable-sandbox
CONFIGURE_ARGS +=	--with-libclang-path=${LOCALBASE}/lib
CONFIGURE_ARGS +=	--with-wasi-sysroot=${LOCALBASE}/share/wasi-sysroot
# #1664111
CONFIGURE_ARGS +=	--with-system-ffi
# #1732809
CONFIGURE_ARGS +=	--with-system-librnp
# --enable-debug does too much, this defaults to -g (which is 3 times larger than using -ggdb1)
CONFIGURE_ARGS +=	--disable-debug-symbols
DEBUG_CONFIGURE_ARGS +=	--enable-debug-symbols \
			--disable-install-strip
MAKE_ENV +=		BUILD_VERBOSE_LOG="1" CARGOFLAGS="-j${MAKE_JOBS}"

LIB_DEPENDS +=	security/rnp \
		devel/libffi

WANTLIB +=	Xrandr Xtst ffi rnp

ALL_TARGET =	default

post-patch:
	sed -i 's/"files":{[^}]*}/"files":{}/' \
		${WRKSRC}/third_party/rust/mp4parse/.cargo-checksum.json

post-install:
	# install prefs
	${SUBST_DATA} ${FILESDIR}/all-openbsd.js \
		${PREFIX}/lib/${MOZILLA_PROJECT}/defaults/pref/all-openbsd.js
	# install distribution.ini file
	${INSTALL_DATA_DIR} ${PREFIX}/lib/${MOZILLA_PROJECT}/distribution
	echo "[Global]\nid=OpenBSD\nversion=${OSREV}\nabout=Packaged by ${MAINTAINER}\n" > \
		${PREFIX}/lib/${MOZILLA_PROJECT}/distribution/distribution.ini
	# install desktop file
	${INSTALL_DATA_DIR} ${PREFIX}/share/applications/
	${INSTALL_DATA} ${FILESDIR}/${MOZILLA_PROJECT}.desktop \
		${PREFIX}/share/applications/${MOZILLA_PROJECT}.desktop

	# install icons for desktop file
.for s in 16 22 24 32 48 64 128 256
	${INSTALL_DATA_DIR} ${PREFIX}/share/icons/hicolor/${s}x${s}/apps
	${INSTALL_DATA} ${WRKSRC}/comm/mail/branding/thunderbird/default${s}.png \
		${PREFIX}/share/icons/hicolor/${s}x${s}/apps/org.mozilla.${MOZILLA_PROJECT}.png
.endfor
	${INSTALL_DATA_DIR} ${PREFIX}/share/icons/hicolor/scalable/apps
	sed -e '1,3d' ${WRKSRC}/comm/mail/branding/thunderbird/content/about-logo.svg > \
		${PREFIX}/share/icons/hicolor/scalable/apps/org.mozilla.${MOZILLA_PROJECT}.svg

.include <bsd.port.mk>
