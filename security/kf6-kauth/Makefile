# $NetBSD: Makefile,v 1.7 2024/12/05 09:43:24 markd Exp $

DISTNAME=	kauth-${KF6VER}
CATEGORIES=	security

HOMEPAGE=	https://community.kde.org/Frameworks
COMMENT=	Abstraction to system policy and authentication features
LICENSE=	gnu-lgpl-v2.1

.include "../../meta-pkgs/kde/kf6.mk"

.include "../../devel/kf6-kcoreaddons/buildlink3.mk"
.include "../../devel/qt6-qttools/buildlink3.mk"
.include "../../security/polkit-qt6/buildlink3.mk"
.include "../../x11/kf6-kwindowsystem/buildlink3.mk"
.include "../../x11/qt6-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
