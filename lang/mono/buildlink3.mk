# $NetBSD: buildlink3.mk,v 1.78 2024/11/14 22:20:28 wiz Exp $

BUILDLINK_TREE+=	mono

.if !defined(MONO_BUILDLINK3_MK)
MONO_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.mono+=	mono>=4
BUILDLINK_ABI_DEPENDS.mono+=	mono>=6.12.0.199nb4
BUILDLINK_PKGSRCDIR.mono?=	../../lang/mono
ALL_ENV+=			MONO_SHARED_DIR=${WRKDIR}
BUILDLINK_CONTENTS_FILTER.mono=	${EGREP} '(^include/|^lib/)'

.include "../../textproc/icu/buildlink3.mk"
.endif # MONO_BUILDLINK3_MK

BUILDLINK_TREE+=	-mono
