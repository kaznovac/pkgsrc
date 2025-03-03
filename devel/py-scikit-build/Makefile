# $NetBSD: Makefile,v 1.8 2024/09/15 15:54:15 adam Exp $

DISTNAME=	scikit_build-0.18.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/_/-/}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/scikit-build/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/scikit-build/scikit-build
COMMENT=	Build system generator for Python C/C++/Fortran/Cython extensions
LICENSE=	mit

TOOL_DEPENDS+=	${PYPKGPREFIX}-hatchling-[0-9]*:../../devel/py-hatchling
TOOL_DEPENDS+=	${PYPKGPREFIX}-hatch-fancy-pypi-readme-[0-9]*:../../devel/py-hatch-fancy-pypi-readme
TOOL_DEPENDS+=	${PYPKGPREFIX}-hatch-vcs-[0-9]*:../../devel/py-hatch-vcs
DEPENDS+=	cmake>=3.5:../../devel/cmake
DEPENDS+=	ninja-build-[0-9]*:../../devel/ninja-build
DEPENDS+=	${PYPKGPREFIX}-distro-[0-9]*:../../devel/py-distro
DEPENDS+=	${PYPKGPREFIX}-packaging-[0-9]*:../../devel/py-packaging
DEPENDS+=	${PYPKGPREFIX}-setuptools>=42.0.0:../../devel/py-setuptools
DEPENDS+=	${PYPKGPREFIX}-wheel>=0.32.0:../../devel/py-wheel
TEST_DEPENDS+=	${PYPKGPREFIX}-build>=0.7:../../devel/py-build
TEST_DEPENDS+=	${PYPKGPREFIX}-cython>=0.25.1:../../devel/py-cython
TEST_DEPENDS+=	${PYPKGPREFIX}-requests-[0-9]*:../../devel/py-requests
TEST_DEPENDS+=	${PYPKGPREFIX}-test-mock>=1.10.4:../../devel/py-test-mock
TEST_DEPENDS+=	${PYPKGPREFIX}-virtualenv-[0-9]*:../../devel/py-virtualenv
TEST_DEPENDS+=	git-base-[0-9]*:../../devel/git-base

USE_LANGUAGES=	c c++

.include "../../lang/python/pyversion.mk"
.if ${PYTHON_VERSION} < 311
DEPENDS+=	${PYPKGPREFIX}-tomli-[0-9]*:../../textproc/py-tomli
.endif

post-install:
	${RM} ${DESTDIR}${PREFIX}/${PYSITELIB}/skbuild/platform_specifics/platform_factory.py.orig

.include "../../lang/python/wheel.mk"
.include "../../mk/bsd.pkg.mk"
