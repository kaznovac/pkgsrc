# $NetBSD: Makefile,v 1.22 2025/01/12 14:22:09 mef Exp $

R_PKGNAME=	xfun
R_PKGVER=	0.50
CATEGORIES=	devel

MAINTAINER=	pkgsrc-users@NetBSD.org
COMMENT=	Miscellaneous functions by 'Yihui Xie'
LICENSE=	mit

# Packages suggested but not available: 'litedown', 'rhub', 'magick', 'qs'
# VignetteBuilder package required for checking but not installed: 'litedown'

TEST_DEPENDS+=	R-knitr>=1.47:../../print/R-knitr
TEST_DEPENDS+=	R-pak-[0-9]*:../../devel/R-pak
TEST_DEPENDS+=	R-remotes-[0-9]*:../../devel/R-remotes
TEST_DEPENDS+=	R-renv-[0-9]*:../../devel/R-renv
TEST_DEPENDS+=	R-rmarkdown-[0-9]*:../../textproc/R-rmarkdown
TEST_DEPENDS+=	R-rstudioapi-[0-9]*:../../math/R-rstudioapi
TEST_DEPENDS+=	R-testit-[0-9]*:../../devel/R-testit
TEST_DEPENDS+=	R-tinytex>=0.31:../../print/R-tinytex

USE_LANGUAGES=	c c++

.include "../../math/R/Makefile.extension"
.include "../../mk/bsd.pkg.mk"
