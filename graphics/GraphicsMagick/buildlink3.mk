# $NetBSD: buildlink3.mk,v 1.68 2024/11/14 22:20:03 wiz Exp $

BUILDLINK_TREE+=	GraphicsMagick

.if !defined(GRAPHICSMAGICK_BUILDLINK3_MK)
GRAPHICSMAGICK_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.GraphicsMagick+=	GraphicsMagick>=1.3.12nb6
BUILDLINK_ABI_DEPENDS.GraphicsMagick+=	GraphicsMagick>=1.3.42nb7
BUILDLINK_PKGSRCDIR.GraphicsMagick?=	../../graphics/GraphicsMagick

pkgbase := GraphicsMagick
.include "../../mk/pkg-build-options.mk"

.if ${PKG_BUILD_OPTIONS.GraphicsMagick:Mghostscript}
.include "../../print/ghostscript/buildlink3.mk"
.endif
.if ${PKG_BUILD_OPTIONS.GraphicsMagick:Mx11}
.include "../../x11/libSM/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.endif
.if ${PKG_BUILD_OPTIONS.GraphicsMagick:Mzstd}
.include "../../archivers/zstd/buildlink3.mk"
.endif

.include "../../archivers/bzip2/buildlink3.mk"
.include "../../archivers/xz/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../devel/libltdl/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../graphics/lcms2/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.endif # GRAPHICSMAGICK_BUILDLINK3_MK

BUILDLINK_TREE+=	-GraphicsMagick
