# $NetBSD: buildlink3.mk,v 1.19 2024/12/05 17:41:15 jperkin Exp $

BUILDLINK_TREE+=	libfetch

.if !defined(LIBFETCH_BUILDLINK3_MK)
LIBFETCH_BUILDLINK3_MK:=

BUILDLINK_DEPMETHOD.libfetch?=	build

BUILDLINK_API_DEPENDS.libfetch+=	libfetch>=2.28
BUILDLINK_ABI_DEPENDS.libfetch?=	libfetch>=2.39nb2
BUILDLINK_PKGSRCDIR.libfetch?=		../../net/libfetch

pkgbase := libfetch
.include "../../mk/pkg-build-options.mk"

.if ${OPSYS} == "SunOS"
BUILDLINK_LIBS.libfetch+=	-lsocket
.endif

.if ${PKG_BUILD_OPTIONS.libfetch:Mopenssl}
.  include "../../security/openssl/buildlink3.mk"
BUILDLINK_DEPMETHOD.openssl=	full
BUILDLINK_LIBS.libfetch+=	-lssl -lcrypto
.endif

.endif # LIBFETCH_BUILDLINK3_MK

BUILDLINK_TREE+=	-libfetch
