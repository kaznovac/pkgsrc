# $NetBSD: Makefile,v 1.13 2025/01/11 11:55:00 mef Exp $

R_PKGNAME=	digest
R_PKGVER=	0.6.37
CATEGORIES=	security

MAINTAINER=	pkgsrc-users@NetBSD.org
COMMENT=	Create compact hash digests of R objects
LICENSE=	gnu-gpl-v2 OR gnu-gpl-v3

USE_LANGUAGES+=	c c++

# Packages suggested but not available: 'simplermarkdown'
TEST_DEPENDS+=	R-tinytest-[0-9]*:../../devel/R-tinytest

.include "../../math/R/Makefile.extension"
.include "../../mk/bsd.pkg.mk"
