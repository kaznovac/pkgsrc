# $NetBSD: Makefile,v 1.20 2024/09/17 12:16:50 adam Exp $

DISTNAME=	Catch2-3.7.1
PKGNAME=	${DISTNAME:tl}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=catchorg/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	bsiegert@NetBSD.org
HOMEPAGE=	https://github.com/catchorg/Catch2
COMMENT=	C++ test framework for unit tests
LICENSE=	boost-license

WRKSRC=		${WRKDIR}/${DISTNAME}

USE_CXX_FEATURES=	c++17
USE_LANGUAGES=		c c++

CMAKE_CONFIGURE_ARGS+=	-DBUILD_TESTING=OFF
CMAKE_CONFIGURE_ARGS+=	-DPKGCONFIG_INSTALL_DIR:PATH=${PREFIX}/lib/pkgconfig
CMAKE_CONFIGURE_ARGS+=	-DCMAKE_CXX_STANDARD=17

.include "../../devel/cmake/build.mk"
.include "../../mk/bsd.pkg.mk"
