V =		0.11.1
COMMENT =	tools for using PIV tokens as an SSH agent, encryption, etc.
DISTNAME =	pivy-$V

HOMEPAGE =	https://github.com/arekinath/pivy

MASTER_SITES =	https://github.com/arekinath/pivy/releases/download/v$V/

CATEGORIES =	security

MAINTAINER =	Jonathan Matthew <jmatthew@openbsd.org>

# MPLv2
PERMIT_PACKAGE =	Yes

WANTLIB =		c edit crypto json-c pcsclite util z

MODULES =		gnu
MODGNU_CONFIG_GUESS_DIRS = openssh

LIB_DEPENDS =		security/pcsc-lite devel/json-c
RUN_DEPENDS =		security/ccid

USE_GMAKE =		Yes

NO_TEST =		Yes

MAKE_FLAGS =		CC="${CC}" \
			COPTFLAGS="${CFLAGS}" \
			prefix=${PREFIX} \
			USE_JSONC=yes

post-extract:
	rm -Rf ${WRKDIST}/libressl

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/pivy
	${INSTALL_DATA} ${WRKSRC}/README.adoc ${PREFIX}/share/doc/pivy

.include <bsd.port.mk>
