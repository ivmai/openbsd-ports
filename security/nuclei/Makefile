COMMENT =		fast and customizable vulnerability scanner

MODGO_MODNAME =		github.com/projectdiscovery/nuclei/v2
MODGO_VERSION =		v2.9.4

DISTNAME =		nuclei-${MODGO_VERSION}

CATEGORIES =		security

HOMEPAGE =		https://nuclei.projectdiscovery.io

MAINTAINER =		Xi Lu <lx@shellcodes.org>

# MIT
PERMIT_PACKAGE =	Yes

WANTLIB += 		c pthread
NO_TEST	=		Yes

MODULES +=		lang/go

.include "modules.inc"
.include <bsd.port.mk>
