# $NetBSD: Makefile,v 1.48 2024/11/14 22:20:49 wiz Exp $

DISTNAME=	khelpcenter-${KAPPSVER}
PKGREVISION=	6
CATEGORIES=	misc

HOMEPAGE=	https://userbase.kde.org/KHelpCenter
COMMENT=	Application to show KDE Applications' documentation
LICENSE=	gnu-gpl-v2

.include "../../meta-pkgs/kde/applications.mk"

TOOL_DEPENDS+=	kdoctools>=5.19.0:../../devel/kdoctools
DEPENDS+=	kinit>=5.21.0:../../x11/kinit

USE_TOOLS+=	msgmerge pkg-config perl:run

REPLACE_PERL+=	searchhandlers/khc_mansearch.pl

.include "../../devel/grantlee-qt5/buildlink3.mk"
.include "../../devel/kdoctools/buildlink3.mk"
.include "../../devel/kio/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../textproc/xapian/buildlink3.mk"
.include "../../www/khtml/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
