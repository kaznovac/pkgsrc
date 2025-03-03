# $NetBSD: buildlink3.mk,v 1.4 2024/11/14 22:20:48 wiz Exp $

BUILDLINK_TREE+=	kf6-kcontacts

.if !defined(KF6_KCONTACTS_BUILDLINK3_MK)
KF6_KCONTACTS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.kf6-kcontacts+=	kf6-kcontacts>=6.2.0
BUILDLINK_ABI_DEPENDS.kf6-kcontacts?=	kf6-kcontacts>=6.2.0nb4
BUILDLINK_PKGSRCDIR.kf6-kcontacts?=	../../misc/kf6-kcontacts

.include "../../devel/kf6-kconfig/buildlink3.mk"
.include "../../devel/kf6-kcoreaddons/buildlink3.mk"
.include "../../devel/kf6-ki18n/buildlink3.mk"
.include "../../textproc/kf6-kcodecs/buildlink3.mk"
.include "../../lang/qt6-qtdeclarative/buildlink3.mk"
.include "../../x11/qt6-qtbase/buildlink3.mk"
.endif	# KF6_KCONTACTS_BUILDLINK3_MK

BUILDLINK_TREE+=	-kf6-kcontacts
