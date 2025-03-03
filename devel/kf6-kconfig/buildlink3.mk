# $NetBSD: buildlink3.mk,v 1.4 2024/11/14 22:19:25 wiz Exp $

BUILDLINK_TREE+=	kf6-kconfig

.if !defined(KF6_KCONFIG_BUILDLINK3_MK)
KF6_KCONFIG_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.kf6-kconfig+=	kf6-kconfig>=6.2.0
BUILDLINK_ABI_DEPENDS.kf6-kconfig?=	kf6-kconfig>=6.2.0nb4
BUILDLINK_PKGSRCDIR.kf6-kconfig?=	../../devel/kf6-kconfig

BUILDLINK_FILES.kf6-kconfig+=		libexec/kf6/*

.include "../../x11/qt6-qtbase/buildlink3.mk"
.endif	# KF6_KCONFIG_BUILDLINK3_MK

BUILDLINK_TREE+=	-kf6-kconfig
