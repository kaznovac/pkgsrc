# $NetBSD: Makefile,v 1.72 2024/11/14 22:19:27 wiz Exp $

DISTNAME=	ki18n-${KF5VER}
PKGREVISION=	3
CATEGORIES=	devel

HOMEPAGE=	https://community.kde.org/Frameworks
COMMENT=	Advanced internationalization framework
LICENSE=	modified-bsd AND gnu-lgpl-v2.1

USE_TOOLS+=	msgfmt

CMAKE_CONFIGURE_ARGS+=	-DLibIntl_INCLUDE_DIRS=${BUILDLINK_PREFIX.gettext}/include

.include "../../meta-pkgs/kde/kf5.mk"

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../x11/qt5-qtscript/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
