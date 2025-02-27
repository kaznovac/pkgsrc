# $NetBSD: options.mk,v 1.5 2024/11/19 14:58:05 nia Exp $

PKG_OPTIONS_VAR=		PKG_OPTIONS.libretro-flycast

.include "../../mk/bsd.fast.prefs.mk"

PKG_OPTIONS_REQUIRED_GROUPS+=	gl
PKG_OPTIONS_GROUP.gl+=		opengl

.if ${OPSYS} == "NetBSD" && ${MACHINE_ARCH:M*arm*}
PKG_OPTIONS_GROUP.gl+=		rpi
.endif

.if ${MACHINE_PLATFORM:MNetBSD-*-earmv6hf}
PKG_SUGGESTED_OPTIONS+=		rpi
.elif ${OPSYS} != "Darwin"
PKG_SUGGESTED_OPTIONS+=		opengl
.endif

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mrpi)
CMAKE_CONFIGURE_ARGS+=	-DUSE_VIDEOCORE=ON
CMAKE_CONFIGURE_ARGS+=	-DUSE_GLES2=ON
CMAKE_CONFIGURE_ARGS+=	-DUSE_OPENGL=OFF
.  include "../../misc/raspberrypi-userland/buildlink3.mk"
.elif !empty(PKG_OPTIONS:Mopengl)
CMAKE_CONFIGURE_ARGS+=	-DUSE_OPENGL=ON
.  if ${OPSYS} != "Darwin"
.    include "../../graphics/MesaLib/buildlink3.mk"
.  endif
.endif
