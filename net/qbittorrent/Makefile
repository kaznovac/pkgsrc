# $NetBSD: Makefile,v 1.84 2025/01/12 17:43:43 wiz Exp $

DISTNAME=	qbittorrent-5.0.3
PKGREVISION=	2
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_GITHUB:=qbittorrent/}
GITHUB_PROJECT=	qBittorrent
GITHUB_TAG=	release-${PKGVERSION_NOREV}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.qbittorrent.org/
COMMENT=	BitTorrent client in Qt
LICENSE=	gnu-gpl-v2

TOOL_DEPENDS+=	qt6-qttools-[0-9]*:../../devel/qt6-qttools

USE_CXX_FEATURES=	c++20
USE_LANGUAGES=		c c++
USE_TOOLS+=		pkg-config

# error: 'class std::basic_ostream<char>' has no member named 'str'
GCC_REQD+=		11

CMAKE_CONFIGURE_ARGS+=	-DCMAKE_BUILD_TYPE="Release"
# error "Boost.Stacktrace requires `_Unwind_Backtrace` function
CMAKE_CONFIGURE_ARGS+=	-DSTACKTRACE=OFF

LDFLAGS.NetBSD+=	-ljemalloc

.include "../../devel/boost-libs/buildlink3.mk"
.include "../../devel/cmake/build.mk"
.include "../../devel/qt6-qttools/buildlink3.mk"
BUILDLINK_API_DEPENDS.zlib+=	zlib>=1.2.11
.include "../../devel/zlib/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../graphics/qt6-qtsvg/buildlink3.mk"
.include "../../net/libtorrent-rasterbar/buildlink3.mk"
BUILDLINK_API_DEPENDS.openssl+=	openssl>=3.0.2
.include "../../security/openssl/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/qt6-qtbase/buildlink3.mk"
.include "../../mk/atomic64.mk"
.include "../../mk/bsd.pkg.mk"
