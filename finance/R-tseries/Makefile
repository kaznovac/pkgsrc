# $NetBSD: Makefile,v 1.7 2025/01/04 22:46:48 mef Exp $

R_PKGNAME=	tseries
R_PKGVER=	0.10-58
CATEGORIES=	finance

MAINTAINER=	minskim@NetBSD.org
COMMENT=	Time series analysis and computational finance
LICENSE=	gnu-gpl-v2

DEPENDS+=	R-quantmod>=0.4.9:../../finance/R-quantmod
DEPENDS+=	R-quadprog>=1.5.7:../../math/R-quadprog
DEPENDS+=	R-zoo>=1.8.6:../../math/R-zoo

# !pdfTeX error: pdflatex (file tctt0900): Font tctt0900 at 600 not found
TEST_DEPENDS+=	tex-ec-[0-9]*:../../fonts/tex-ec
TEST_DEPENDS+=	tex-inconsolata-[0-9]*:../../fonts/tex-inconsolata
TEST_DEPENDS+=	tex-latex-bin-[0-9]*:../../print/tex-latex-bin
TEST_DEPENDS+=	tex-url-[0-9]*:../../print/tex-url
TEST_DEPENDS+=	tex-xkeyval-[0-9]*:../../print/tex-xkeyval

USE_LANGUAGES=	c fortran

.include "../../math/R/Makefile.extension"
.include "../../mk/bsd.pkg.mk"
