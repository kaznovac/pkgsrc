# $NetBSD: Makefile,v 1.12 2024/11/14 22:20:53 wiz Exp $

DISTNAME=	pim-data-exporter-${KAPPSVER}
PKGREVISION=	6
CATEGORIES=	misc

HOMEPAGE=	https://kontact.kde.org/
COMMENT=	Import and export KDE PIM settings
LICENSE=	gnu-lgpl-v2.1 AND gnu-gpl-v2

.include "../../meta-pkgs/kde/applications.mk"

TOOL_DEPENDS+=	kdoctools>=5.19.0:../../devel/kdoctools

USE_TOOLS+=	msgmerge

.include "../../devel/boost-headers/buildlink3.mk"
.include "../../mail/mailcommon/buildlink3.mk"
.include "../../misc/akonadi-notes/buildlink3.mk"
.include "../../misc/kuserfeedback/buildlink3.mk"
.include "../../time/calendarsupport/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
