# $NetBSD: Makefile,v 1.2 2024/11/11 07:27:54 wiz Exp $

DISTNAME=	term-background-1.0.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	comms python
# No source distfile on PyPI
#MASTER_SITES=	${MASTER_SITE_PYPI:=t/term-background/}
MASTER_SITES=	${MASTER_SITE_GITHUB:=rocky/}
GITHUB_PROJECT=	shell-term-background

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/rocky/shell-term-background
COMMENT=	Determine if shell has a light or dark background
LICENSE=	gnu-gpl-v2

WRKSRC=		${WRKDIR}/shell-${DISTNAME}

TOOL_DEPENDS+=	${PYPKGPREFIX}-setuptools-[0-9]*:../../devel/py-setuptools

USE_LANGUAGES=	# none

PYTHON_VERSIONS_INCOMPATIBLE=	27

.include "../../lang/python/wheel.mk"
.include "../../mk/bsd.pkg.mk"
