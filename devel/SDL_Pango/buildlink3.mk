# $NetBSD: buildlink3.mk,v 1.35 2024/12/27 08:19:30 wiz Exp $

BUILDLINK_TREE+=	SDL_Pango

.if !defined(SDL_PANGO_BUILDLINK3_MK)
SDL_PANGO_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.SDL_Pango+=	SDL_Pango>=0.1.2
BUILDLINK_ABI_DEPENDS.SDL_Pango+=	SDL_Pango>=0.1.2nb35
BUILDLINK_PKGSRCDIR.SDL_Pango?=		../../devel/SDL_Pango

# Seems to be unnecessary, pkg-config does not show anything from SDL
#.include "../../devel/SDL/buildlink3.mk"
.include "../../devel/pango/buildlink3.mk"
.endif # SDL_PANGO_BUILDLINK3_MK

BUILDLINK_TREE+=	-SDL_Pango
