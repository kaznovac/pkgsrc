# $NetBSD: Makefile,v 1.13 2024/11/11 07:28:03 wiz Exp $

.include "../../devel/py-angr/version.mk"

DISTNAME=	cle-${ANGR_VERSION}
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=c/cle/}

MAINTAINER=	khorben@defora.org
HOMEPAGE=	https://github.com/angr/cle
COMMENT=	CLE Loads Everything (at least, many binary formats!)
LICENSE=	2-clause-bsd

TOOL_DEPENDS+=	${PYPKGPREFIX}-setuptools>=46.4.0:../../devel/py-setuptools
DEPENDS+=	${PYPKGPREFIX}-archinfo>=${PKGVERSION_NOREV}:../../devel/py-archinfo
DEPENDS+=	${PYPKGPREFIX}-pefile-[0-9]*:../../sysutils/py-pefile
DEPENDS+=	${PYPKGPREFIX}-pyelftools>=0.27:../../devel/py-pyelftools
DEPENDS+=	${PYPKGPREFIX}-pyvex>=${PKGVERSION_NOREV}:../../devel/py-pyvex
DEPENDS+=	${PYPKGPREFIX}-sortedcontainers>=2.0:../../devel/py-sortedcontainers
# minidump
DEPENDS+=	${PYPKGPREFIX}-minidump>=0.0.10:../../devel/py-minidump
# xbe
DEPENDS+=	${PYPKGPREFIX}-xbe>=0.0.4:../../devel/py-xbe
TEST_DEPENDS+=	${PYPKGPREFIX}-cffi-[0-9]*:../../devel/py-cffi

PYTHON_VERSIONS_INCOMPATIBLE=	39

.include "../../lang/python/wheel.mk"
.include "../../mk/bsd.pkg.mk"
