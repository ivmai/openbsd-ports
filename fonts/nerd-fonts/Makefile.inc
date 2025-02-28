COMMENT =	${NF_FONT} Nerd Font
DIST_SUBDIR =	${NF_PROJECT}

NF_PROJECT =	nerd-fonts
VERSION =	2.2.2
PKGNAME =	${NF_FONT:L}-${NF_PROJECT}-${VERSION}
CATEGORIES =	fonts
HOMEPAGE =	https://www.nerdfonts.com/

# https://github.com/ryanoasis/nerd-fonts/blob/master/license-audit.md
# So far the most restrictive license Nerd Fonts has to adhere to is CC
# BY-NC-ND 3.0, but we the required consent from the author.
PERMIT_PACKAGE =	Yes

MASTER_SITES =		https://github.com/ryanoasis/${NF_PROJECT}/releases/download/v${VERSION}/
DISTFILES =		${NF_FONT}${EXTRACT_SUFX}
EXTRACT_SUFX =		.zip

MODULES =		font

NO_BUILD =		Yes
NO_TEST =		Yes

TYPEFACE =		${NF_FONT:L}
FONTDIR =		${PREFIX}/share/fonts/${NF_PROJECT}/${NF_FONT:L}
DOCDIR =		${PREFIX}/share/doc/${NF_PROJECT}/${NF_FONT:L}
