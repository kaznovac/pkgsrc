# $NetBSD: buildlink3.mk,v 1.10 2024/11/14 22:20:37 wiz Exp $

BUILDLINK_TREE+=	libksieve

.if !defined(LIBKSIEVE_BUILDLINK3_MK)
LIBKSIEVE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libksieve+=	libksieve>=20.04.1
BUILDLINK_ABI_DEPENDS.libksieve?=		libksieve>=23.08.4nb6
BUILDLINK_PKGSRCDIR.libksieve?=		../../mail/libksieve

.include "../../mail/kmailtransport/buildlink3.mk"
.include "../../misc/kidentitymanagement/buildlink3.mk"
.include "../../misc/pimcommon/buildlink3.mk"
.include "../../x11/qt5-qtwebengine/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.endif	# LIBKSIEVE_BUILDLINK3_MK

BUILDLINK_TREE+=	-libksieve
