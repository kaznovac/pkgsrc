# $NetBSD: Makefile,v 1.9 2024/11/03 01:49:44 mef Exp $

R_PKGNAME=	gss
R_PKGVER=	2.2-8

MAINTAINER=	minskim@NetBSD.org
COMMENT=	General smoothing splines
LICENSE=	gnu-gpl-v2 OR gnu-gpl-v3

USE_LANGUAGES=	c fortran

TEST_DEPENDS+=	tex-ec-[0-9]*:../../fonts/tex-ec
TEST_DEPENDS+=	tex-inconsolata-[0-9]*:../../fonts/tex-inconsolata
TEST_DEPENDS+=	tex-latex-bin-[0-9]*:../../print/tex-latex-bin
TEST_DEPENDS+=	tex-xkeyval-[0-9]*:../../print/tex-xkeyval
TEST_DEPENDS+=	tex-url-[0-9]*:../../print/tex-url

.include "../../math/R/Makefile.extension"
.include "../../mk/bsd.pkg.mk"
