# $NetBSD: buildlink3.mk,v 1.4 2024/12/27 08:20:35 wiz Exp $

BUILDLINK_TREE+=	ayatana-ido

.if !defined(AYATANA_IDO_BUILDLINK3_MK)
AYATANA_IDO_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.ayatana-ido+=	ayatana-ido>=0.10.2
BUILDLINK_ABI_DEPENDS.ayatana-ido?=	ayatana-ido>=0.10.2nb3
BUILDLINK_PKGSRCDIR.ayatana-ido?=	../../sysutils/ayatana-ido

.include "../../devel/glib2/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.endif	# AYATANA_IDO_BUILDLINK3_MK

BUILDLINK_TREE+=	-ayatana-ido
