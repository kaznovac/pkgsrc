# $NetBSD: Makefile,v 1.96 2024/12/29 15:09:50 adam Exp $

PKGNAME=		koverartist-0.7.6
DISTNAME=		38195-koverartist_0.7.6.orig
PKGREVISION=		76
CATEGORIES=		graphics kde
MASTER_SITES=		http://kde-apps.org/CONTENT/content-files/
EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		markd@NetBSD.org
HOMEPAGE=		http://www.kde-apps.org/content/show.php?content=38195
COMMENT=		CD/DVD case designer

TOOL_DEPENDS+=	automoc4>=0.9.87:../../devel/automoc4

USE_TOOLS+=		msgfmt perl
USE_LANGUAGES=		c c++

WRKSRC=			${WRKDIR}/${PKGNAME_NOREV}

.include "../../meta-pkgs/kde4/kde4.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../x11/kdelibs4/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"

.include "../../mk/bsd.pkg.mk"
