# $NetBSD: Makefile,v 1.44 2024/11/14 22:21:51 wiz Exp $

DISTNAME=	kpimtextedit-${KAPPSVER}
PKGREVISION=	6
CATEGORIES=	textproc

HOMEPAGE=	https://community.kde.org/KDE_PIM
COMMENT=	Textedit with PIM-specific features
LICENSE=	gnu-lgpl-v2

.include "../../meta-pkgs/kde/applications.mk"

DEPENDS+=	kdesignerplugin-[0-9]*:../../x11/kdesignerplugin

USE_TOOLS+=	msgmerge

.include "../../devel/grantlee-qt5/buildlink3.mk"
.include "../../devel/kio/buildlink3.mk"
.include "../../misc/kemoticons/buildlink3.mk"
.include "../../textproc/ktextaddons/buildlink3.mk"
.include "../../textproc/syntax-highlighting/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../x11/qt5-qtspeech/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
