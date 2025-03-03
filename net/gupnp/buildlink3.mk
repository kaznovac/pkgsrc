# $NetBSD: buildlink3.mk,v 1.60 2024/11/14 22:21:08 wiz Exp $

BUILDLINK_TREE+=	gupnp

.if !defined(GUPNP_BUILDLINK3_MK)
GUPNP_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gupnp+=	gupnp>=1.6
BUILDLINK_ABI_DEPENDS.gupnp+=	gupnp>=1.6.6nb6
BUILDLINK_PKGSRCDIR.gupnp?=	../../net/gupnp

.include "../../mk/bsd.fast.prefs.mk"
.if (${OPSYS:M*BSD} || ${OPSYS} == "DragonFly" || ${OPSYS} == "Darwin") && (!defined(USE_INTERNAL_UUID) || empty(USE_INTERNAL_UUID:M[Yy][Ee][Ss]))
.PHONY: uuid-symlink
pre-configure: uuid-symlink
uuid-symlink:
	if ! ${TEST} -e ${BUILDLINK_DIR}/lib/pkgconfig/uuid.pc; then cp ${BUILDLINK_PKGSRCDIR.gupnp}/files/uuid.pc ${BUILDLINK_DIR}/lib/pkgconfig/uuid.pc; fi
.else
.include "../../devel/libuuid/buildlink3.mk"
.endif

.include "../../devel/glib2/buildlink3.mk"
.include "../../net/libsoup3/buildlink3.mk"
.include "../../net/gssdp/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.endif	# GUPNP_BUILDLINK3_MK

BUILDLINK_TREE+=	-gupnp
