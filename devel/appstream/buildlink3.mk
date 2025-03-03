# $NetBSD: buildlink3.mk,v 1.8 2024/11/14 22:19:16 wiz Exp $

BUILDLINK_TREE+=	appstream

.if !defined(APPSTREAM_BUILDLINK3_MK)
APPSTREAM_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.appstream+=	appstream>=0.16.3
BUILDLINK_ABI_DEPENDS.appstream+=	appstream>=1.0.3nb5
BUILDLINK_PKGSRCDIR.appstream?=		../../devel/appstream

.include "../../archivers/zstd/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../textproc/libstemmer/buildlink3.mk"
.include "../../textproc/libxmlb/buildlink3.mk"
.include "../../textproc/libyaml/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.endif	# APPSTREAM_BUILDLINK3_MK

BUILDLINK_TREE+=	-appstream
