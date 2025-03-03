# $NetBSD: buildlink3.mk,v 1.59 2024/12/27 08:20:55 wiz Exp $

BUILDLINK_TREE+=	gtk3

.if !defined(GTK3_BUILDLINK3_MK)
GTK3_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gtk3+=	gtk3+>=3.0.0
BUILDLINK_ABI_DEPENDS.gtk3+=	gtk3+>=3.24.43nb6
BUILDLINK_PKGSRCDIR.gtk3?=	../../x11/gtk3

.include "../../mk/bsd.fast.prefs.mk"

pkgbase := gtk3
.include "../../mk/pkg-build-options.mk"

.include "../../devel/at-spi2-core/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../devel/pango/buildlink3.mk"
.include "../../fonts/fontconfig/buildlink3.mk"
.include "../../graphics/cairo/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../graphics/gdk-pixbuf2/buildlink3.mk"
BUILDLINK_API_DEPENDS.libepoxy+=	libepoxy>=1.4
.include "../../graphics/libepoxy/buildlink3.mk"
.if ${PKG_BUILD_OPTIONS.gtk3:Mx11}
.include "../../x11/libXcursor/buildlink3.mk"
BUILDLINK_API_DEPENDS.Xft2+=	Xft2>=2.1.2nb2
.include "../../x11/libXft/buildlink3.mk"
.include "../../x11/libXrandr/buildlink3.mk"
.include "../../x11/libXinerama/buildlink3.mk"
.include "../../x11/libXi/buildlink3.mk"
.include "../../x11/libXcomposite/buildlink3.mk"
.endif # PKG_BUILD_OPTIONS.gtk3:Mx11
.if ${PKG_BUILD_OPTIONS.gtk3:Mwayland}
.include "../../devel/wayland/buildlink3.mk"
.include "../../devel/wayland-protocols/buildlink3.mk"
.include "../../x11/libxkbcommon/buildlink3.mk"
.endif # PKG_BUILD_OPTIONS.gtk3:Mwayland
.endif # GTK3_BUILDLINK3_MK

BUILDLINK_TREE+=	-gtk3
