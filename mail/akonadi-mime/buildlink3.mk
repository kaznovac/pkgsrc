# $NetBSD: buildlink3.mk,v 1.10 2024/11/14 22:20:33 wiz Exp $

BUILDLINK_TREE+=	akonadi-mime

.if !defined(AKONADI_MIME_BUILDLINK3_MK)
AKONADI_MIME_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.akonadi-mime+=	akonadi-mime>=17.12.1
BUILDLINK_ABI_DEPENDS.akonadi-mime?=	akonadi-mime>=23.08.4nb6
BUILDLINK_PKGSRCDIR.akonadi-mime?=	../../mail/akonadi-mime

.include "../../mail/akonadi/buildlink3.mk"
.include "../../mail/kmime/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.endif	# AKONADI_MIME_BUILDLINK3_MK

BUILDLINK_TREE+=	-akonadi-mime
