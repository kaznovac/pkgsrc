# $NetBSD: buildlink3.mk,v 1.70 2024/12/27 08:20:25 wiz Exp $

BUILDLINK_TREE+=	totem

.if !defined(TOTEM_BUILDLINK3_MK)
TOTEM_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.totem+=	totem>=3.34.1
BUILDLINK_ABI_DEPENDS.totem?=	totem>=3.34.1nb37
BUILDLINK_PKGSRCDIR.totem?=	../../multimedia/totem

.include "../../multimedia/totem-pl-parser/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.endif	# TOTEM_BUILDLINK3_MK

BUILDLINK_TREE+=	-totem
