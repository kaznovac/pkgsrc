# $NetBSD: Makefile,v 1.18 2024/08/19 22:00:26 wiz Exp $

DISTNAME=	soupsieve-2.6
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	www python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/soupsieve/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/facelessuser/soupsieve
COMMENT=	CSS4 selector implementation for Beautiful Soup
LICENSE=	mit

TOOL_DEPENDS+=	${PYPKGPREFIX}-hatchling>=0.21.1:../../devel/py-hatchling
TEST_DEPENDS+=	${PYPKGPREFIX}-beautifulsoup4-[0-9]*:../../www/py-beautifulsoup4
TEST_DEPENDS+=	${PYPKGPREFIX}-coverage-[0-9]*:../../devel/py-coverage
TEST_DEPENDS+=	${PYPKGPREFIX}-html5lib-[0-9]*:../../textproc/py-html5lib
TEST_DEPENDS+=	${PYPKGPREFIX}-lxml-[0-9]*:../../textproc/py-lxml
TEST_DEPENDS+=	${PYPKGPREFIX}-mypy-[0-9]*:../../lang/py-mypy
TEST_DEPENDS+=	${PYPKGPREFIX}-test-[0-9]*:../../devel/py-test
TEST_DEPENDS+=	${PYPKGPREFIX}-test-cov-[0-9]*:../../devel/py-test-cov

USE_LANGUAGES=	# none

PYTHON_VERSIONS_INCOMPATIBLE=	27

# as of 2.6
# 381 passed

.include "../../lang/python/wheel.mk"
.include "../../mk/bsd.pkg.mk"
