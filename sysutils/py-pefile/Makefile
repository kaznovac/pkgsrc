# $NetBSD: Makefile,v 1.18 2024/11/11 07:28:59 wiz Exp $

DISTNAME=	pefile-2024.8.26
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	sysutils python
MASTER_SITES=	${MASTER_SITE_PYPI:=p/pefile/}

MAINTAINER=	khorben@defora.org
HOMEPAGE=	https://github.com/erocarrera/pefile
COMMENT=	Python module to read and work with PE files
LICENSE=	modified-bsd

TOOL_DEPENDS+=	${PYPKGPREFIX}-setuptools-[0-9]*:../../devel/py-setuptools

USE_LANGUAGES=	# none

.include "../../lang/python/wheel.mk"
.include "../../mk/bsd.pkg.mk"
