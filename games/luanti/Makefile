# $NetBSD: Makefile,v 1.1 2024/11/16 01:57:06 ktnb Exp $

DISTNAME=	luanti-5.10.0
CATEGORIES=	games
MASTER_SITES=	${MASTER_SITE_GITHUB:=minetest/}
GITHUB_TAG=	${PKGVERSION_NOREV}
GITHUB_PROJECT=	minetest

MAINTAINER=	ktnb@NetBSD.org
HOMEPAGE=	https://www.luanti.org/
COMMENT=	Open source voxel game-creation platform
LICENSE=	gnu-lgpl-v2.1 AND cc-by-sa-v3.0 AND apache-2.0

WRKSRC=		${WRKDIR}/minetest-${PKGVERSION_NOREV}

USE_TOOLS+=	msgfmt
USE_LANGUAGES=	c c++

# "Insufficient gcc version, found 4.8.5.  Version 4.9 or higher is required."
GCC_REQD+=	4.9

CMAKE_CONFIGURE_ARGS+=	-DCMAKE_BUILD_TYPE="Release"

CMAKE_CONFIGURE_ARGS+=	-DBUILD_CLIENT=TRUE
CMAKE_CONFIGURE_ARGS+=	-DBUILD_SERVER=TRUE

CMAKE_CONFIGURE_ARGS+=	-DENABLE_POSTGRESQL=FALSE
CMAKE_CONFIGURE_ARGS+=	-DENABLE_LEVELDB=FALSE
CMAKE_CONFIGURE_ARGS+=	-DENABLE_REDIS=FALSE
CMAKE_CONFIGURE_ARGS+=	-DENABLE_SPATIAL=FALSE

#.include "../../lang/LuaJIT2/platform.mk"
#.if ${PLATFORM_SUPPORTS_LUAJIT} == "no"
#CMAKE_CONFIGURE_ARGS+=	-DENABLE_LUAJIT=FALSE
#.endif
# Binaries built with LuaJIT support have been broken since 2015, see:
# https://github.com/minetest/minetest/issues/2988
CMAKE_CONFIGURE_ARGS+=	-DENABLE_LUAJIT=FALSE

.include "../../archivers/bzip2/buildlink3.mk"
.include "../../audio/openal-soft/buildlink3.mk"
.include "../../audio/libvorbis/buildlink3.mk"
.include "../../databases/sqlite3/buildlink3.mk"
.include "../../devel/cmake/build.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/gmp/buildlink3.mk"
.include "../../devel/ncurses/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../archivers/zstd/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../graphics/glu/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../graphics/MesaLib/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../textproc/jsoncpp/buildlink3.mk"
#.if ${PLATFORM_SUPPORTS_LUAJIT} != "no"
#.include "../../lang/LuaJIT2/buildlink3.mk"
#.endif
.include "../../www/curl/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libICE/buildlink3.mk"
.include "../../x11/libSM/buildlink3.mk"
.include "../../x11/libXxf86vm/buildlink3.mk"
.include "../../mk/jpeg.buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
