# $NetBSD: buildlink3.mk,v 1.5 2024/12/28 21:56:22 adam Exp $

BUILDLINK_TREE+=	libdiscid

.if !defined(LIBDISCID_BUILDLINK3_MK)
LIBDISCID_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libdiscid+=	libdiscid>=0.1.0
BUILDLINK_ABI_DEPENDS.libdiscid+=	libdiscid>=0.6.1
BUILDLINK_PKGSRCDIR.libdiscid?=		../../audio/libdiscid
.endif # LIBDISCID_BUILDLINK3_MK

BUILDLINK_TREE+=	-libdiscid
