# $NetBSD: Makefile,v 1.6 2024/12/25 10:05:29 adam Exp $

DISTNAME=	amaranth-0.5.4
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=a/amaranth/}

MAINTAINER=	js@NetBSD.org
HOMEPAGE=	https://github.com/amaranth-lang/amaranth
COMMENT=	Toolchain for developing hardware based on synchronous digital logic
LICENSE=	2-clause-bsd

TOOL_DEPENDS+=	${PYPKGPREFIX}-pdm_backend>=2.3.0:../../devel/py-pdm_backend
DEPENDS+=	${PYPKGPREFIX}-jinja2>=3.0:../../textproc/py-jinja2
DEPENDS+=	${PYPKGPREFIX}-jschon>=0.11.1:../../textproc/py-jschon
DEPENDS+=	${PYPKGPREFIX}-pyvcd>=0.2.2:../../devel/py-pyvcd

USE_LANGUAGES=	# none

.include "../../lang/python/wheel.mk"
.include "../../mk/bsd.pkg.mk"
