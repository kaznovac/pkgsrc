# $NetBSD: buildlink3.mk,v 1.11 2024/10/19 11:55:08 wiz Exp $

BUILDLINK_TREE+=	nvidia-texture-tools

.if !defined(NVIDIA_TEXTURE_TOOLS_BUILDLINK3_MK)
NVIDIA_TEXTURE_TOOLS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.nvidia-texture-tools+=	nvidia-texture-tools>=2.0.8
BUILDLINK_ABI_DEPENDS.nvidia-texture-tools?=	nvidia-texture-tools>=2.1.0nb10
BUILDLINK_PKGSRCDIR.nvidia-texture-tools?=	../../graphics/nvidia-texture-tools

.include "../../graphics/openexr/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../graphics/tiff/buildlink3.mk"
.endif	# NVIDIA_TEXTURE_TOOLS_BUILDLINK3_MK

BUILDLINK_TREE+=	-nvidia-texture-tools
