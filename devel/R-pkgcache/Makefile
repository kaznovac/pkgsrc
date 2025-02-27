# $NetBSD: Makefile,v 1.12 2024/10/19 22:13:38 mef Exp $

R_PKGNAME=	pkgcache
R_PKGVER=	2.2.3
CATEGORIES=	devel

MAINTAINER=	pkgsrc-users@NetBSD.org
COMMENT=	Cache 'CRAN'-Like Metadata and R Packages
LICENSE=	mit	# + file LICENSE

DEPENDS+=	R-assertthat>=0.2.1:../../devel/R-assertthat
DEPENDS+=	R-callr>=2.0.4.9000:../../devel/R-callr
DEPENDS+=	R-cli>=2.0.0:../../devel/R-cli
DEPENDS+=	R-glue>=1.4.1:../../devel/R-glue
DEPENDS+=	R-rappdirs>=0.3.1:../../devel/R-rappdirs
DEPENDS+=	R-rlang>=0.4.9:../../devel/R-rlang
DEPENDS+=	R-uuid>=0.1.2:../../devel/R-uuid
DEPENDS+=	R-prettyunits>=1.0.2:../../math/R-prettyunits
DEPENDS+=	R-tibble>=2.1.3:../../math/R-tibble
DEPENDS+=	R-digest>=0.6.25:../../security/R-digest
DEPENDS+=	R-processx>=3.8.2:../../sysutils/R-processx
DEPENDS+=	R-curl>=3.2:../../www/R-curl
DEPENDS+=	R-filelock-[0-9]*:../../devel/R-filelock
DEPENDS+=	R-jsonlite-[0-9]*:../../textproc/R-jsonlite

TEST_DEPENDS+=	R-covr-[0-9]*:../../devel/R-covr
TEST_DEPENDS+=	R-debugme-[0-9]*:../../devel/R-debugme
TEST_DEPENDS+=	R-fs-[0-9]*:../../devel/R-fs
TEST_DEPENDS+=	R-mockery-[0-9]*:../../devel/R-mockery
TEST_DEPENDS+=	R-pingr-[0-9]*:../../net/R-pingr
TEST_DEPENDS+=	R-sessioninfo-[0-9]*:../../devel/R-sessioninfo
TEST_DEPENDS+=	R-spelling-[0-9]*:../../textproc/R-spelling
TEST_DEPENDS+=	R-webfakes>=1.1.5:../../www/R-webfakes
TEST_DEPENDS+=	R-zip-[0-9]*:../../archivers/R-zip

# !pdfTeX error: pdflatex (file tctt1000): Font tctt1000 at 600 not found
TEST_DEPENDS+=	tex-ec-[0-9]*:../../fonts/tex-ec
TEST_DEPENDS+=	tex-inconsolata-[0-9]*:../../fonts/tex-inconsolata
TEST_DEPENDS+=	tex-latex-bin-[0-9]*:../../print/tex-latex-bin
TEST_DEPENDS+=	tex-url-[0-9]*:../../print/tex-url
TEST_DEPENDS+=	tex-xkeyval-[0-9]*:../../print/tex-xkeyval

USE_LANGUAGES=	c

.include "../../math/R/Makefile.extension"
.include "../../mk/bsd.pkg.mk"
