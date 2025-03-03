# $NetBSD: buildlink3.mk,v 1.15 2024/11/14 22:20:59 wiz Exp $

BUILDLINK_TREE+=	libkcompactdisc

.if !defined(LIBKCOMPACTDISC_BUILDLINK3_MK)
LIBKCOMPACTDISC_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libkcompactdisc+=	libkcompactdisc>=20.04.1
BUILDLINK_ABI_DEPENDS.libkcompactdisc?=	libkcompactdisc>=23.08.4nb5
BUILDLINK_PKGSRCDIR.libkcompactdisc?=	../../multimedia/libkcompactdisc

.include "../../devel/kcoreaddons/buildlink3.mk"
.include "../../devel/ki18n/buildlink3.mk"
.include "../../multimedia/phonon-qt5/buildlink3.mk"
.include "../../sysutils/solid/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.endif	# LIBKCOMPACTDISC_BUILDLINK3_MK

BUILDLINK_TREE+=	-libkcompactdisc
