# $NetBSD: Makefile,v 1.13 2024/10/14 06:46:03 wiz Exp $

DISTNAME=	sphinxcontrib_serializinghtml-2.0.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/_/-/}
CATEGORIES=	textproc python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/sphinxcontrib-serializinghtml/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.sphinx-doc.org/
COMMENT=	Sphinx API for "serialized" HTML files
LICENSE=	2-clause-bsd

TOOL_DEPENDS+=	${PYPKGPREFIX}-flit_core>=3.7:../../devel/py-flit_core
TEST_DEPENDS+=	${PYPKGPREFIX}-sphinx>=5:../../textproc/py-sphinx

USE_LANGUAGES=	# none

.include "../../lang/python/wheel.mk"
.include "../../mk/bsd.pkg.mk"
