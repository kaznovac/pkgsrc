# $NetBSD: Makefile,v 1.7 2024/12/05 09:43:27 markd Exp $

DISTNAME=	kguiaddons-${KF6VER}
CATEGORIES=	x11

HOMEPAGE=	https://community.kde.org/Frameworks
COMMENT=	Addons to QtGui
LICENSE=	gnu-gpl-v2 AND gnu-lgpl-v2.1

.include "../../meta-pkgs/kde/kf6.mk"

USE_TOOLS+=	pkg-config

CMAKE_CONFIGURE_ARGS+=	-DBUILD_GEO_SCHEME_HANDLER=OFF

PKGCONFIG_OVERRIDE+=		_KDE_build/KF6GuiAddons.pc
PKGCONFIG_OVERRIDE_STAGE=	post-build

.include "../../devel/wayland/platform.mk"

.if ${PLATFORM_SUPPORTS_WAYLAND} == "yes"
.  include "../../devel/plasma-wayland-protocols/buildlink3.mk"
.  include "../../devel/qt6-qtwayland/buildlink3.mk"
.else
CMAKE_CONFIGURE_ARGS+=	-DWITH_WAYLAND=OFF
.endif

.include "../../x11/qt6-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
