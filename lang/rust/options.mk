# $NetBSD: options.mk,v 1.42 2024/11/24 16:13:43 he Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.rust
PKG_SUPPORTED_OPTIONS+=	rust-cargo-static rust-docs

.include "../../mk/bsd.fast.prefs.mk"

# The bundled LLVM current has issues building on SunOS.
.if ${OPSYS} != "SunOS"
PKG_SUPPORTED_OPTIONS+=		rust-internal-llvm
# There may be compatibility issues with the base LLVM on e.g. NetBSD.
.  if !empty(HAVE_LLVM) || ${MACHINE_PLATFORM:MDarwin-*-aarch64}
PKG_SUGGESTED_OPTIONS+=		rust-internal-llvm
.  endif
.endif

# If cross-building, always use the internal LLVM
.if !empty(TARGET)
PKG_SUGGESTED_OPTIONS+=		rust-internal-llvm
.endif

PKG_OPTIONS_LEGACY_OPTS+=	rust-llvm:rust-internal-llvm

# Bundle OpenSSL and curl into the cargo binary when producing
# bootstraps on NetBSD.
.if ${OPSYS} == "NetBSD" && ${BUILD_TARGET} == "dist"
PKG_SUGGESTED_OPTIONS+=	rust-cargo-static
.endif

.include "../../mk/bsd.options.mk"

# NetBSD/sparc64 when using the internal LLVM needs
# to not use gcc 10.4 or 10.5 (as found in 10.0_BETA or 10.0), ref.
# https://github.com/rust-lang/rust/issues/117231
# (however, gcc from 9.x produces a working LLVM, go figure).
.if ${MACHINE_PLATFORM:MNetBSD-10.*-sparc64}
.  if !empty(PKG_OPTIONS:Mrust-internal-llvm)
# Require GCC 12 (from pkgsrc) to correctly build the embedded LLVM (18.x).
GCC_REQD+=	12
.  endif
.endif

#
# Use the internal copy of LLVM or the external one?
#
.if empty(PKG_OPTIONS:Mrust-internal-llvm)
.include "../../lang/libunwind/buildlink3.mk"
.include "../../lang/llvm/buildlink3.mk"
CONFIGURE_ARGS+=	--enable-llvm-link-shared
CONFIGURE_ARGS+=	--llvm-libunwind=system
CONFIGURE_ARGS+=	--llvm-root=${BUILDLINK_PREFIX.llvm}
# Also turn off build of the internal LLD, as the external LLVM
# may be older (e.g. 17) than the internal LLD (now 18.x), ref.
# https://github.com/rust-lang/rust/issues/131291
CONFIGURE_ARGS+=	--set rust.lld=false
.endif

#
# Link cargo statically against "native" libraries.
# (openssl and curl specifically).
#
.if !empty(PKG_OPTIONS:Mrust-cargo-static)
CONFIGURE_ARGS+=	--enable-cargo-native-static
.else
BUILDLINK_API_DEPENDS.nghttp2+= nghttp2>=1.41.0
BUILDLINK_API_DEPENDS.curl+= 	curl>=7.67.0
.include "../../www/curl/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.endif

#
# Install documentation.
#
.if !empty(PKG_OPTIONS:Mrust-docs)
CONFIGURE_ARGS+=	--enable-docs
.else
CONFIGURE_ARGS+=	--disable-docs
.endif
