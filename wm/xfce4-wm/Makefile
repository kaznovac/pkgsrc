# $NetBSD: Makefile,v 1.99 2025/01/07 19:31:33 bsiegert Exp $

.include "../../meta-pkgs/xfce4/Makefile.common"

VERSION=	4.20.0
DISTNAME=	xfwm4-${VERSION}
PKGNAME=	xfce4-wm-${VERSION}
CATEGORIES=	wm
MASTER_SITES+=	https://archive.xfce.org/src/xfce/xfwm4/${VERSION:R}/

HOMEPAGE=	https://docs.xfce.org/xfce/xfwm4/start
COMMENT=	Xfce window manager

.include "../../devel/gettext-tools/msgfmt-desktop.mk"
.include "../../devel/libwnck3/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/libXdamage/buildlink3.mk"
.include "../../x11/libXfixes/buildlink3.mk"
.include "../../x11/libXpresent/buildlink3.mk"
.include "../../x11/libxfce4ui/buildlink3.mk"
.include "../../x11/libxfce4windowing/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
