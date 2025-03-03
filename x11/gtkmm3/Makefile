# $NetBSD: Makefile,v 1.72 2024/12/27 08:20:56 wiz Exp $

DISTNAME=	gtkmm-3.24.9
PKGNAME=	${DISTNAME:S/gtkmm/gtkmm3/1}
PKGREVISION=	7
CATEGORIES=	x11 gnome
MASTER_SITES=	${MASTER_SITE_GNOME:=sources/gtkmm/${PKGVERSION_NOREV:R}/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.gtkmm.org/
COMMENT=	C++ Interfaces for GTK+ and GNOME (v3)
LICENSE=	gnu-lgpl-v2.1 AND gnu-gpl-v2

USE_LANGUAGES=		c c++
USE_CXX_FEATURES+=	c++11
USE_TOOLS+=		perl pkg-config
PKGCONFIG_OVERRIDE+=	gdk/gdkmm.pc.in
PKGCONFIG_OVERRIDE+=	gtk/gtkmm.pc.in

MESON_REQD+=	0.56.0

BUILDLINK_API_DEPENDS.gtk3+=	gtk3+>=3.24.0
.include "../../x11/gtk3/buildlink3.mk"

PLIST_VARS+=	x11
.if ${PKG_BUILD_OPTIONS.gtk3:Mx11}
PLIST.x11=	yes
.endif

BUILDLINK_API_DEPENDS.atkmm+=	atkmm>=2.24.2
.include "../../devel/atkmm/buildlink3.mk"
BUILDLINK_API_DEPENDS.glibmm+=	glibmm>=2.49.1
.include "../../devel/glibmm/buildlink3.mk"
.include "../../devel/meson/build.mk"
BUILDLINK_API_DEPENDS.pangomm+=	pangomm>=2.38.2
.include "../../devel/pangomm/buildlink3.mk"
BUILDLINK_API_DEPENDS.cairomm+=	cairomm>=1.14.0
.include "../../graphics/cairomm/buildlink3.mk"
BUILDLINK_API_DEPENDS.gdk-pixbuf2+=	gdk-pixbuf2>=2.35.5
.include "../../graphics/gdk-pixbuf2/buildlink3.mk"
.include "../../textproc/libxslt/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
