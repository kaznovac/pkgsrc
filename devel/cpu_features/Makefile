# $NetBSD: Makefile,v 1.9 2024/08/25 06:18:32 wiz Exp $

GITHUB_TAG=	v${PKGVERSION_NOREV}
DISTNAME=	cpu_features-0.7.0
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=google/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/google/cpu_features/
COMMENT=	Cross platform C99 library to get CPU features at runtime
LICENSE=	apache-2.0

USE_LANGUAGES=	c c++
CMAKE_CONFIGURE_ARGS+=	-DCMAKE_POSITION_INDEPENDENT_CODE=ON
CMAKE_CONFIGURE_ARGS+=	-DBUILD_TESTING=OFF

.include "../../mk/bsd.prefs.mk"

.if ${MACHINE_ARCH} == "i386" || ${MACHINE_ARCH} == "x86_64"
PLIST_SUBST+=		CPU_FEATURES_ARCH=x86
.elif ${MACHINE_ARCH:M*aarch64*}
PLIST_SUBST+=		CPU_FEATURES_ARCH=aarch64
.elif ${MACHINE_ARCH:M*powerpc*}
PLIST_SUBST+=		CPU_FEATURES_ARCH=ppc
.elif ${MACHINE_ARCH:M*arm*}
PLIST_SUBST+=		CPU_FEATURES_ARCH=arm
.elif ${MACHINE_ARCH:M*mips*}
PLIST_SUBST+=		CPU_FEATURES_ARCH=mips
.else
PKG_FAIL_REASON+=	"${MACHINE_ARCH} unsupported, see CMakeLists.txt"
.endif

# wiz 20231231:
# as of 0.7.0, the ninja generator has problems in some environments:
# ninja: error: manifest 'build.ninja' still dirty after 100 tries, perhaps system time is not set
CMAKE_GENERATOR=	make

.include "../../devel/cmake/build.mk"
.include "../../mk/bsd.pkg.mk"
