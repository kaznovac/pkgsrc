# $NetBSD: Makefile,v 1.74 2024/11/14 22:21:50 wiz Exp $

DISTNAME=	kcodecs-${KF5VER}
PKGREVISION=	3
CATEGORIES=	textproc

HOMEPAGE=	https://community.kde.org/Frameworks
COMMENT=	Collection of methods to manipulate strings using various encodings
LICENSE=	gnu-gpl-v2 AND gnu-lgpl-v2.1

.include "../../meta-pkgs/kde/kf5.mk"

TOOL_DEPENDS+=	gperf-[0-9]*:../../devel/gperf

.include "../../x11/qt5-qtbase/buildlink3.mk"
BUILDLINK_DEPMETHOD.qt5-qttools= build
.include "../../x11/qt5-qttools/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
