COMMENT =		OCaml parser generator for LR(1) grammars

V =			20211012
REVISION =		0
DISTNAME =		menhir-${V}
PKGNAME =		ocaml-${DISTNAME}

MASTER_SITES =		https://gitlab.inria.fr/fpottier/menhir/-/archive/${V}/

HOMEPAGE =		http://cristal.inria.fr/~fpottier/menhir/

CATEGORIES =		devel

# QPLv1/LGPLv2
PERMIT_PACKAGE =	Yes

MODULES =		lang/ocaml

WANTLIB =		c m pthread

BUILD_DEPENDS =		sysutils/findlib \
			devel/dune

RUN_DEPENDS =		sysutils/findlib

NO_TEST =		Yes

do-build:
	cd ${WRKSRC} && dune build -j ${MAKE_JOBS}

do-install:
	cd ${WRKSRC} && dune install \
		--docdir ${TRUEPREFIX}/share/doc/ocaml-menhir/ \
		-j ${MAKE_JOBS}

.include <bsd.port.mk>
