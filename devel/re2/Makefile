# $NetBSD: Makefile,v 1.23 2024/08/25 06:18:37 wiz Exp $

DISTNAME=	re2-${GITHUB_TAG:S/-//g}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=google/}
GITHUB_TAG=	2024-07-02

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/google/re2
COMMENT=	Regular expression library
LICENSE=	modified-bsd

USE_LANGUAGES=	c c++

CMAKE_CONFIGURE_ARGS+=	-DBUILD_SHARED_LIBS=ON

USE_CXX_FEATURES=	c++11
PKGCONFIG_OVERRIDE=	re2.pc.in
INSTALLATION_DIRS+=	lib/pkgconfig

# To build unit-tests:
#CMAKE_CONFIGURE_ARGS+=	-DRE2_BUILD_TESTING=ON
#TEST_ENV=	LD_LIBRARY_PATH=${WRKSRC}/${CMAKE_BUILD_DIR}
# For Darwin
#TEST_ENV=	DYLD_LIBRARY_PATH=${WRKSRC}/${CMAKE_BUILD_DIR}
#TEST_TARGET=	test
#.include "../../benchmarks/google-benchmark/buildlink3.mk"
#.include "../../devel/googletest/buildlink3.mk"

.include "../../devel/abseil/buildlink3.mk"
.include "../../devel/cmake/build.mk"
.include "../../mk/bsd.pkg.mk"
