# $NetBSD: Makefile,v 1.27 2024/12/27 08:19:43 wiz Exp $

DISTNAME=	melonDS-0.8.3
PKGNAME=	${DISTNAME:S/DS/ds/}
PKGREVISION=	21
CATEGORIES=	emulators
MASTER_SITES=	${MASTER_SITE_GITHUB:=Arisotura/}

MAINTAINER=	nia@NetBSD.org
HOMEPAGE=	http://melonds.kuribo64.net/
COMMENT=	Nintendo DS emulator, sorta
LICENSE=	gnu-gpl-v3

USE_CMAKE=	yes
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c c++

USE_CXX_FEATURES+=	c++11

CMAKE_CONFIGURE_ARGS+=	-DCMAKE_BUILD_TYPE="Release"
CMAKE_CONFIGURE_ARGS+=	-DENABLE_LTO=OFF

ICON_SIZES=	16 32 48 64 128 256

INSTALLATION_DIRS+=	share/applications
.for s in ${ICON_SIZES}
INSTALLATION_DIRS+=	share/icons/hicolor/${s}x${s}/apps
.endfor

# Wants to build with -fno-pic for whatever reason
MKPIE_SUPPORTED=	no

.include "../../graphics/MesaLib/features.mk"
.if ${MESALIB_SUPPORTS_EGL:tl} == "no"
PKG_FAIL_REASON+=	"Requires EGL support in Mesa"
.endif

post-install:
	${INSTALL_DATA} ${WRKSRC}/flatpak/net.kuribo64.melonds.desktop \
		${DESTDIR}${PREFIX}/share/applications
.for s in ${ICON_SIZES}
	${INSTALL_DATA} ${WRKSRC}/icon/melon_${s}x${s}.png \
		${DESTDIR}${PREFIX}/share/icons/hicolor/${s}x${s}/apps/net.kuribo64.melonds.png
.endfor

.include "../../devel/SDL2/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../net/libpcap/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
