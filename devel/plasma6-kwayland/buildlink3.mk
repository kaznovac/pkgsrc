# $NetBSD: buildlink3.mk,v 1.4 2024/11/14 22:19:34 wiz Exp $

BUILDLINK_TREE+=	plasma6-kwayland

.if !defined(PLASMA6_KWAYLAND_BUILDLINK3_MK)
PLASMA6_KWAYLAND_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.plasma6-kwayland+=	plasma6-kwayland>=6.0.5
BUILDLINK_ABI_DEPENDS.plasma6-kwayland?=		plasma6-kwayland>=6.0.5nb3
BUILDLINK_PKGSRCDIR.plasma6-kwayland?=		../../devel/plasma6-kwayland

.include "../../devel/wayland-protocols/buildlink3.mk"
.include "../../x11/qt6-qtbase/buildlink3.mk"
.include "../../devel/qt6-qtwayland/buildlink3.mk"
.endif	# PLASMA6_KWAYLAND_BUILDLINK3_MK

BUILDLINK_TREE+=	-plasma6-kwayland
