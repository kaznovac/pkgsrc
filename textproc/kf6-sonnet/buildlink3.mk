# $NetBSD: buildlink3.mk,v 1.4 2024/11/14 22:21:51 wiz Exp $

BUILDLINK_TREE+=	kf6-sonnet

.if !defined(KF6_SONNET_BUILDLINK3_MK)
KF6_SONNET_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.kf6-sonnet+=	kf6-sonnet>=6.2.0
BUILDLINK_ABI_DEPENDS.kf6-sonnet?=	kf6-sonnet>=6.2.0nb4
BUILDLINK_PKGSRCDIR.kf6-sonnet?=	../../textproc/kf6-sonnet

.include "../../x11/qt6-qtbase/buildlink3.mk"
.endif	# KF6_SONNET_BUILDLINK3_MK

BUILDLINK_TREE+=	-kf6-sonnet
