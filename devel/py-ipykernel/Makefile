# $NetBSD: Makefile,v 1.66 2024/10/14 06:45:39 wiz Exp $

DISTNAME=	ipykernel-6.29.5
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=i/ipykernel/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://ipython.org/
COMMENT=	IPython Kernel for Jupyter
LICENSE=	modified-bsd

TOOL_DEPENDS+=	${PYPKGPREFIX}-hatchling>=1.4:../../devel/py-hatchling
DEPENDS+=	${PYPKGPREFIX}-comm>=0.1.1:../../net/py-comm
DEPENDS+=	${PYPKGPREFIX}-debugpy>=1.6.5:../../devel/py-debugpy
DEPENDS+=	${PYPKGPREFIX}-ipython>=7.23.1:../../devel/py-ipython
DEPENDS+=	${PYPKGPREFIX}-jupyter_client>=6.1.12:../../devel/py-jupyter_client
DEPENDS+=	${PYPKGPREFIX}-jupyter_core>=4.12:../../devel/py-jupyter_core
DEPENDS+=	${PYPKGPREFIX}-matplotlib-inline>=0.1:../../graphics/py-matplotlib-inline
DEPENDS+=	${PYPKGPREFIX}-nest-asyncio-[0-9]*:../../devel/py-nest-asyncio
DEPENDS+=	${PYPKGPREFIX}-packaging-[0-9]*:../../devel/py-packaging
DEPENDS+=	${PYPKGPREFIX}-psutil-[0-9]*:../../sysutils/py-psutil
DEPENDS+=	${PYPKGPREFIX}-tornado>=6.1:../../www/py-tornado
DEPENDS+=	${PYPKGPREFIX}-traitlets>=5.4.0:../../devel/py-traitlets
DEPENDS+=	${PYPKGPREFIX}-zmq>=24:../../net/py-zmq
TEST_DEPENDS+=	${PYPKGPREFIX}-flaky-[0-9]*:../../devel/py-flaky
TEST_DEPENDS+=	${PYPKGPREFIX}-ipyparallel-[0-9]*:../../parallel/py-ipyparallel
TEST_DEPENDS+=	${PYPKGPREFIX}-test-asyncio>=0.23.2:../../devel/py-test-asyncio
TEST_DEPENDS+=	${PYPKGPREFIX}-test-cov-[0-9]*:../../devel/py-test-cov
TEST_DEPENDS+=	${PYPKGPREFIX}-test-timeout-[0-9]*:../../devel/py-test-timeout

.include "../../mk/bsd.prefs.mk"
.if ${OPSYS} == "Darwin"
DEPENDS+=	${PYPKGPREFIX}-appnope-[0-9]*:../../sysutils/py-appnope
.endif

USE_LANGUAGES=	# none

PYTHON_SELF_CONFLICT=	yes

PYTHON_VERSIONS_INCOMPATIBLE=	39

.include "../../lang/python/wheel.mk"
.include "../../mk/bsd.pkg.mk"
