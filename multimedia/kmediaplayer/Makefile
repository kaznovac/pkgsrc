# $NetBSD: Makefile,v 1.29 2024/11/14 22:20:58 wiz Exp $

DISTNAME=	kmediaplayer-${KF5VER}
PKGREVISION=	4
CATEGORIES=	multimedia

HOMEPAGE=	https://community.kde.org/Frameworks
COMMENT=	Plugin interface for media player features
LICENSE=	gnu-lgpl-v2.1

.include "../../meta-pkgs/kde/kf5.mk"
MASTER_SITES=	${MASTER_SITE_KDE:=frameworks/${KF5VER:R}/portingAids/}

USE_TOOLS+=	msgmerge

.include "../../devel/kparts/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
