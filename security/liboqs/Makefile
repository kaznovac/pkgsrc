# $NetBSD: Makefile,v 1.4 2024/12/18 21:30:34 jschauma Exp $

DISTNAME=	liboqs-0.12.0
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GITHUB:=open-quantum-safe/}

MAINTAINER=	logan@cyberstorm.mu
HOMEPAGE=	https://github.com/open-quantum-safe/liboqs/
COMMENT=	Post quantum crypto library
LICENSE=	mit

# Used only for tests, not for other parts of the build.
USE_TOOLS+=		bash:test
PYTHON_FOR_BUILD_ONLY=	test
TOOLS_CREATE+=		python3
TOOLS_PATH.python3=	${TOOL_PYTHONBIN:Q}

CMAKE_CONFIGURE_ARGS+=	-DOQS_PERMIT_UNSUPPORTED_ARCHITECTURE=ON

REPLACE_BASH+=	tests/run_astyle.sh
REPLACE_BASH+=	tests/test_spdx.sh
REPLACE_BASH+=	tests/test_vectors.sh

TEST_DEPENDS+=	astyle>=0:../../devel/astyle
TEST_DEPENDS+=	${PYPKGPREFIX}-test>=0:../../devel/py-test
TEST_DEPENDS+=	${PYPKGPREFIX}-test-xdist>=0:../../devel/py-test-xdist
TEST_DEPENDS+=	${PYPKGPREFIX}-yaml>=0:../../textproc/py-yaml

TEST_TARGET=	run_tests

.include "../../devel/cmake/build.mk"
.include "../../lang/python/pyversion.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
