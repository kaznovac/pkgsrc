# $NetBSD: buildlink3.mk,v 1.36 2024/11/14 22:19:28 wiz Exp $

BUILDLINK_TREE+=	kpackage

.if !defined(KPACKAGE_BUILDLINK3_MK)
KPACKAGE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.kpackage+=	kpackage>=5.19.0
BUILDLINK_ABI_DEPENDS.kpackage?=	kpackage>=5.116.0nb3
BUILDLINK_PKGSRCDIR.kpackage?=		../../devel/kpackage

.include "../../archivers/karchive/buildlink3.mk"
.include "../../devel/kconfig/buildlink3.mk"
.include "../../devel/kcoreaddons/buildlink3.mk"
.include "../../devel/ki18n/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.endif	# KPACKAGE_BUILDLINK3_MK

BUILDLINK_TREE+=	-kpackage
