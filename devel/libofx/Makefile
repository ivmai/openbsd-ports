COMMENT=	opensource implementation of the OFX specification

V=	0.10.9
DISTNAME=	libofx-${V}

CATEGORIES=	devel

HOMEPAGE=	http://libofx.sourceforge.net/
MASTER_SITES=https://github.com/libofx/libofx/releases/download/${V}/

MAINTAINER=	Landry Breuil <landry@openbsd.org>

SHARED_LIBS=	ofx 8.0	# .7.2

# GPLv2
PERMIT_PACKAGE=	Yes

COMPILER =		base-clang ports-gcc base-gcc

WANTLIB += ${COMPILER_LIBCXX} c crypto curl ffi glib-2.0 glibmm-2.4
WANTLIB += gmodule-2.0 gobject-2.0 iconv intl lzma m nghttp2 nghttp3
WANTLIB += ngtcp2 ngtcp2_crypto_openssl osp pcre2-8 sigc-2.0 ssl
WANTLIB += xml++-2.6 xml2 z

LIB_DEPENDS=	textproc/opensp \
		net/curl \
		textproc/libxml++

BUILD_DEPENDS =	devel/help2man

CONFIGURE_STYLE =	gnu
# iconv.h
CONFIGURE_ENV=	LDFLAGS="-L${LOCALBASE}/lib" \
		CPPFLAGS="-I${LOCALBASE}/include" \
		ac_cv_sym_visibility=yes
# uses $<
USE_GMAKE =	Yes

CONFIGURE_ARGS=	--with-opensp-includes=${LOCALBASE}/include/OpenSP \
		--with-opensp-libs=${LOCALBASE}/lib \
		--disable-gengetopt \
		--disable-doxygen \
		--disable-dot

.include <bsd.port.mk>
