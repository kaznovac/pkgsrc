# $NetBSD$
#
# This file determines if a pkgsrc GCC should be selected, if the user has not
# specified that the native compiler must be used (with USE_NATIVE_GCC=yes).
#
# GCC selection is calculated based on either direct GCC_REQD requirements from
# the package, or indirectly via USE_CC_FEATURES and USE_CXX_FEATURES which
# will compute an appropriate GCC_REQD.
#
# If the default compiler is deemed to be too old then a suitable pkgsrc GCC
# will be built and depended upon.  To avoid a heavy dependency on the full GCC
# package, users may want to then set USE_PKGSRC_GCC_RUNTIME=yes to instead
# build against and depend upon the smaller gcc*-libs packages which repackage
# just the GCC runtime libraries.
#


_PKG_VARS.gcc+=	\
	GCC_REQD USE_CC_FEATURES USE_CXX_FEATURES
_IGN_VARS.gcc+=	\
	_GCC6_PATTERNS _GCC7_PATTERNS _GCC8_PATTERNS _GCC9_PATTERNS \
	_GCC10_PATTERNS _GCC12_PATTERNS _GCC13_PATTERNS _GCC_AUX_PATTERNS

#
# Each successive GCC_REQD has an associated cost below when executing
# pkg_admin to determine if it's suitable, so only add these incredibly
# old versions if we haven't already set one.
#
.if !defined(GCC_REQD)
.  if ${USE_LANGUAGES:Mc99} || ${MACHINE_ARCH} == "x86_64"
GCC_REQD+=	3.0
.  else
GCC_REQD+=	2.8.0
.  endif
.endif

#
# Most of the time, GCC adds support for features of new C and C++
# standards incrementally, so USE_CXX_FEATURES= c++XX is for
# establishing an idealistic baseline, usually based on compiler
# versions shipped with NetBSD.
#
# Resources:
# https://gcc.gnu.org/projects/cxx-status.html
# https://gcc.gnu.org/wiki/C11Status
# https://gcc.gnu.org/c99status.html
#

.if ${USE_CXX_FEATURES:Mc++20}
# GCC 10 is chosen because it is planned to be shipped with NetBSD 10,
# so is fairly battle-hardened with pkgsrc.
#
# We hope that it remains OK for most C++20 in the future...
GCC_REQD+=	10
.endif

.if ${USE_CXX_FEATURES:Mc++17}
# GCC 7 is chosen because it shipped with NetBSD 9, so is fairly
# battle-hardened with pkgsrc.
GCC_REQD+=	7
.endif

.if ${USE_CXX_FEATURES:Mc++14}
# GCC 5 is chosen because it shipped with NetBSD 8, so is fairly
# battle-hardened with pkgsrc.
GCC_REQD+=	5
.endif

.if ${USE_CXX_FEATURES:Mc++11}
# While gcc "technically" added experimental C++11 support earlier
# (and there was previously a lot of cargo-culted GCC_REQD in pkgsrc
# as a result), earlier compiler versions are not so well-tested any more.
#
# GCC 4.8 was the version shipped with NetBSD 7 and CentOS 7, so is fairly
# battle-hardened with pkgsrc.
#
# Versions before GCC 4.7 do not accept -std=c++11.
GCC_REQD+=	4.8
.endif

.if ${USE_CXX_FEATURES:Mhas_include} || ${USE_CC_FEATURES:Mhas_include}
GCC_REQD+=	5
.endif

.if ${USE_CC_FEATURES:Mc99}
GCC_REQD+=	3
.endif

.if ${USE_CC_FEATURES:Mc11}
GCC_REQD+=	4.9
.endif

.if ${USE_CXX_FEATURES:Munique_ptr}
GCC_REQD+=	4.9
.endif

.if ${USE_CXX_FEATURES:Mregex}
GCC_REQD+=	4.9
.endif

.if ${USE_CXX_FEATURES:Mput_time}
GCC_REQD+=	5
.endif

.if ${USE_CXX_FEATURES:Mis_trivially_copy_constructible}
GCC_REQD+=	5
.endif

.if ${USE_CXX_FEATURES:Mfilesystem}
# GCC 7 supports filesystem under an experimental header, this is not
# part of GCC 7 as shipped with NetBSD 9.
#
# GCC 8 supports filesystem with explicit linking to the libstdc++fs
# library, which many packages do not do.
GCC_REQD+=	10
.endif

.if ${USE_CXX_FEATURES:Mparallelism_ts}
GCC_REQD+=	10
.endif

.if ${USE_CXX_FEATURES:Mcharconv}
GCC_REQD+=	8
.endif

# Only one compiler defined here supports Ada: lang/gcc6-aux
# If the Ada language is requested, force lang/gcc6-aux to be selected
.if ${USE_LANGUAGES:Mada}
GCC_REQD+=	20160822
.endif

#
# Define version patterns for each available pkgsrc GCC.  If the patterns match
# the requested GCC_REQD then that GCC version will be selected.
#
# A GCC pattern may include other versions if it is the best available match,
# for example if an older GCC version is no longer available in pkgsrc, or a
# major release was never imported (as was the case for GCC 11.x).
#
_GCC6_PATTERNS=		5 6 [0-6].*
_GCC7_PATTERNS=		7 7.*
_GCC8_PATTERNS=		8 8.*
_GCC9_PATTERNS=		9 9.*
_GCC10_PATTERNS=	10 10.*
_GCC12_PATTERNS=	11 11.* 12 12.*
_GCC13_PATTERNS=	13 13.*
_GCC_AUX_PATTERNS=	20[1-2][0-9][0-1][0-9][0-3][0-9]*

#.READONLY: GCC_REQD
_GCC_REQD_EFFECTIVE:=	${GCC_REQD}
