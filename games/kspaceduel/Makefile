# $NetBSD: Makefile,v 1.74 2024/11/14 22:19:54 wiz Exp $

DISTNAME=	kspaceduel-${KAPPSVER}
PKGREVISION=	6
CATEGORIES=	games

HOMEPAGE=	https://kde.org/applications/games/kspaceduel/
COMMENT=	Two player game with shooting spaceships flying around a sun
LICENSE=	gnu-gpl-v2 AND gnu-fdl-v1.2

.include "../../meta-pkgs/kde/applications.mk"

TOOL_DEPENDS+=	kdoctools>=5.19.0:../../devel/kdoctools

USE_TOOLS+=	msgmerge

.include "../../games/libkdegames/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
