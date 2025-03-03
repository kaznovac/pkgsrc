# $NetBSD: Makefile,v 1.20 2024/12/14 10:27:33 mef Exp $

R_PKGNAME=	knitr
R_PKGVER=	1.49
CATEGORIES=	print

MAINTAINER=	pkgsrc-users@NetBSD.org
COMMENT=	General-purpose package for dynamic report generation in R
LICENSE=	gnu-gpl-v1 OR gnu-gpl-v2 OR gnu-gpl-v3

DEPENDS+=	R-digest>=0.6.4:../../security/R-digest
DEPENDS+=	R-evaluate>=0.15:../../devel/R-evaluate
DEPENDS+=	R-formatR>=0.10:../../textproc/R-formatR
DEPENDS+=	R-highr>=0.8:../../textproc/R-highr
DEPENDS+=	R-markdown>=1.0:../../textproc/R-markdown
DEPENDS+=	R-stringr>=0.6:../../textproc/R-stringr
DEPENDS+=	R-xfun>=0.39:../../devel/R-xfun
DEPENDS+=	R-yaml>=2.1.19:../../textproc/R-yaml

# Packages suggested but not available:
#   'gifski', 'gridSVG', 'JuliaCall', 'litedown', 'reticulate',
#   'showtext', 'styler', 'targets', 'tikzDevice', 'svglite'

TEST_DEPENDS+=	R-DBI-[0-9]*:../../math/R-DBI
TEST_DEPENDS+=	R-bslib-[0-9]*:../../www/R-bslib
TEST_DEPENDS+=	R-highr-[0-9]*:../../textproc/R-highr
TEST_DEPENDS+=	R-htmlwidgets-[0-9]*:../../www/R-htmlwidgets
TEST_DEPENDS+=	R-httr-[0-9]*:../../www/R-httr
TEST_DEPENDS+=	R-jpeg-[0-9]*:../../graphics/R-jpeg
TEST_DEPENDS+=	R-magick-[0-9]*:../../graphics/R-magick
TEST_DEPENDS+=	R-markdown-[0-9]*:../../textproc/R-markdown
TEST_DEPENDS+=	R-png-[0-9]*:../../graphics/R-png
TEST_DEPENDS+=	R-rgl-[0-9]*:../../graphics/R-rgl
TEST_DEPENDS+=	R-ragg-[0-9]*:../../graphics/R-ragg
#EST_DEPENDS+=	R-reticulate-[0-9]*:../../lang/R-reticulate
TEST_DEPENDS+=	R-rmarkdown-[0-9]*:../../textproc/R-rmarkdown
TEST_DEPENDS+=	R-rstudioapi-[0-9]*:../../math/R-rstudioapi
#EST_DEPENDS+=	R-showtext-[0-9]*:../../graphics/R-showtext
TEST_DEPENDS+=	R-testit-[0-9]*:../../devel/R-testit
TEST_DEPENDS+=	R-tibble-[0-9]*:../../math/R-tibble
TEST_DEPENDS+=	R-tinytex-[0-9]*:../../print/R-tinytex
TEST_DEPENDS+=	R-webshot-[0-9]*:../../www/R-webshot
TEST_DEPENDS+=	R-xml2-[0-9]*:../../textproc/R-xml2

USE_LANGUAGES=	# none

REPLACE_RSCRIPT+=	inst/bin/knit
REPLACE_RSCRIPT+=	inst/examples/knit-all.R

REPLACE_INTERPRETER+=	Rscript
REPLACE.Rscript.old=	.*Rscript
REPLACE.Rscript.new=	${PREFIX}/bin/Rscript
REPLACE_FILES.Rscript=	${REPLACE_RSCRIPT}

.include "../../math/R/Makefile.extension"
.include "../../mk/bsd.pkg.mk"
