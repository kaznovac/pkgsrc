# $NetBSD: buildlink3.mk,v 1.47 2024/11/14 22:20:33 wiz Exp $

BUILDLINK_TREE+=	akonadi

.if !defined(AKONADI_BUILDLINK3_MK)
AKONADI_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.akonadi+=	akonadi>=17.12.1
BUILDLINK_ABI_DEPENDS.akonadi?=	akonadi>=23.08.4nb6
BUILDLINK_PKGSRCDIR.akonadi?=	../../mail/akonadi

BUILDLINK_FILES.akonadi+=	share/dbus-1/interfaces/org.freedesktop.Akonadi.*.xml
BUILDLINK_FILES.akonadi+=	share/kf5/akonadi/kcfg2dbus.xsl

.include "../../devel/kio/buildlink3.mk"
.include "../../devel/kitemmodels/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.endif	# AKONADI_BUILDLINK3_MK

BUILDLINK_TREE+=	-akonadi
