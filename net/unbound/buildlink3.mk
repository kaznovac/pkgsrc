# $NetBSD: buildlink3.mk,v 1.13 2024/11/14 22:21:18 wiz Exp $

BUILDLINK_TREE+=	unbound

.if !defined(UNBOUND_BUILDLINK3_MK)
UNBOUND_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.unbound+=	unbound>=1.6.0
BUILDLINK_ABI_DEPENDS.unbound+=	unbound>=1.22.0nb3
BUILDLINK_PKGSRCDIR.unbound?=	../../net/unbound

.include "../../devel/libevent/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
pkgbase := unbound
.include "../../mk/pkg-build-options.mk"
.if ${PKG_BUILD_OPTIONS.unbound:Mdoh}
.include "../../www/nghttp2/buildlink3.mk"
.endif
.endif	# UNBOUND_BUILDLINK3_MK

BUILDLINK_TREE+=	-unbound
