# $NetBSD: buildlink3.mk,v 1.19 2024/12/06 09:55:23 nros Exp $

BUILDLINK_TREE+=	sweep

.if !defined(SWEEP_BUILDLINK3_MK)
SWEEP_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.sweep+=	sweep>=0.8.2nb6
BUILDLINK_ABI_DEPENDS.sweep+=	sweep>=0.9.3nb49
BUILDLINK_PKGSRCDIR.sweep?=	../../audio/sweep

.include "../../audio/libmad/buildlink3.mk"
.include "../../audio/libsamplerate/buildlink3.mk"
.include "../../audio/libsndfile/buildlink3.mk"
.include "../../audio/libvorbis/buildlink3.mk"
.include "../../audio/speex/buildlink3.mk"
.include "../../converters/libiconv/buildlink3.mk"
.include "../../databases/tdb/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.endif # SWEEP_BUILDLINK3_MK

BUILDLINK_TREE+=	-sweep
