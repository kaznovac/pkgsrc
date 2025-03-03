# $NetBSD: buildlink3.mk,v 1.4 2024/11/14 22:21:41 wiz Exp $

BUILDLINK_TREE+=	kf6-kdbusaddons

.if !defined(KF6_KDBUSADDONS_BUILDLINK3_MK)
KF6_KDBUSADDONS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.kf6-kdbusaddons+=	kf6-kdbusaddons>=6.2.0
BUILDLINK_ABI_DEPENDS.kf6-kdbusaddons?=	kf6-kdbusaddons>=6.2.0nb4
BUILDLINK_PKGSRCDIR.kf6-kdbusaddons?=	../../sysutils/kf6-kdbusaddons

.include "../../x11/qt6-qtbase/buildlink3.mk"
.endif	# KF6_KDBUSADDONS_BUILDLINK3_MK

BUILDLINK_TREE+=	-kf6-kdbusaddons
