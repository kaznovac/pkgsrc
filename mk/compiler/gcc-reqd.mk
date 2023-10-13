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
_DEF_VARS.gcc+=	\
	_GCC_DEPENDENCY _GCC_PKGBASE _GCC_PKGSRCDIR \
	_GCC_PKG_SATISFIES_DEP _GCC_REQD _GCC_STRICTEST_REQD \
	_IGNORE_GCC \
	_NEED_GCC6 _NEED_GCC7 _NEED_GCC8 _NEED_GCC9 _NEED_GCC10 \
	_NEED_GCC12 _NEED_GCC13 _NEED_GCC_AUX \
	_USE_GCC_SHLIB
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
# Distill the GCC_REQD list into a single _GCC_REQD value that is the
# highest version of GCC required.
#
_GCC_STRICTEST_REQD?=	none
.for _version_ in ${GCC_REQD}
.  for _pkg_ in gcc-${_version_}
.    if ${_GCC_STRICTEST_REQD} == "none"
_GCC_PKG_SATISFIES_DEP=	yes
.      for _vers_ in ${GCC_REQD}
.        if ${_GCC_PKG_SATISFIES_DEP} == "yes"
_GCC_PKG_SATISFIES_DEP!= \
	if ${PKG_ADMIN} pmatch 'gcc>=${_vers_}' ${_pkg_} 2>/dev/null; then \
		${ECHO} "yes"; \
	else \
		${ECHO} "no"; \
	fi
.        endif
.      endfor
.      if ${_GCC_PKG_SATISFIES_DEP} == "yes"
_GCC_STRICTEST_REQD=	${_version_}
.      endif
.    endif
.  endfor
.endfor
_GCC_REQD=		${_GCC_STRICTEST_REQD}

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

#
# Determine which GCC version is required by examining _GCC_REQD.
#
_NEED_GCC6?=		no
.for _pattern_ in ${_GCC6_PATTERNS}
.  if ${_GCC_REQD:M${_pattern_}}
_NEED_GCC6=		yes
.    if ${ALLOW_NEWER_COMPILER:tl} != "yes"
PKG_FAIL_REASON+=	"Package requires at least gcc 6 to build"
.    endif
.  endif
.endfor

_NEED_GCC7?=		no
.for _pattern_ in ${_GCC7_PATTERNS}
.  if ${_GCC_REQD:M${_pattern_}}
.    if ${OPSYS} == "NetBSD" && ${OPSYS_VERSION} < 089937
USE_PKGSRC_GCC=		yes
USE_PKGSRC_GCC_RUNTIME=	yes
.    endif
.    if ${ALLOW_NEWER_COMPILER:tl} != "yes"
PKG_FAIL_REASON+=	"Package requires at least gcc 7 to build"
.    endif
_NEED_GCC7=		yes
.  endif
.endfor

_NEED_GCC8?=		no
.for _pattern_ in ${_GCC8_PATTERNS}
.  if ${_GCC_REQD:M${_pattern_}}
.    if ${OPSYS} == "NetBSD" && ${OPSYS_VERSION} < 099917
USE_PKGSRC_GCC=		yes
USE_PKGSRC_GCC_RUNTIME=	yes
.    endif
.    if ${ALLOW_NEWER_COMPILER:tl} != "yes"
PKG_FAIL_REASON+=	"Package requires at least gcc 8 to build"
.    endif
_NEED_GCC8=		yes
.  endif
.endfor

_NEED_GCC9?=		no
.for _pattern_ in ${_GCC9_PATTERNS}
.  if ${_GCC_REQD:M${_pattern_}}
.    if ${OPSYS} == "NetBSD" && ${OPSYS_VERSION} < 099976
USE_PKGSRC_GCC=		yes
USE_PKGSRC_GCC_RUNTIME=	yes
.    endif
.    if ${ALLOW_NEWER_COMPILER:tl} != "yes"
PKG_FAIL_REASON+=	"Package requires at least gcc 9 to build"
.    endif
_NEED_GCC9=		yes
.  endif
.endfor

_NEED_GCC10?=		no
.for _pattern_ in ${_GCC10_PATTERNS}
.  if ${_GCC_REQD:M${_pattern_}}
.    if ${OPSYS} == "NetBSD" && ${OPSYS_VERSION} < 099982
USE_PKGSRC_GCC=		yes
USE_PKGSRC_GCC_RUNTIME=	yes
.    endif
.    if ${ALLOW_NEWER_COMPILER:tl} != "yes"
PKG_FAIL_REASON+=	"Package requires at least gcc 10 to build"
.    endif
_NEED_GCC10=		yes
.  endif
.endfor

_NEED_GCC12?=		no
.for _pattern_ in ${_GCC12_PATTERNS}
.  if ${_GCC_REQD:M${_pattern_}}
# XXX: pin to a version when NetBSD switches to gcc12
.    if ${OPSYS} == "NetBSD"
USE_PKGSRC_GCC=		yes
USE_PKGSRC_GCC_RUNTIME=	yes
.    endif
.    if ${ALLOW_NEWER_COMPILER:tl} != "yes"
PKG_FAIL_REASON+=	"Package requires at least gcc 12 to build"
.    endif
_NEED_GCC12=		yes
.  endif
.endfor

_NEED_GCC13?=		no
.for _pattern_ in ${_GCC13_PATTERNS}
.  if ${_GCC_REQD:M${_pattern_}}
# XXX: pin to a version when NetBSD switches to gcc13
.    if ${OPSYS} == "NetBSD"
USE_PKGSRC_GCC=		yes
USE_PKGSRC_GCC_RUNTIME=	yes
.    endif
.    if ${ALLOW_NEWER_COMPILER:tl} != "yes"
PKG_FAIL_REASON+=	"Package requires at least gcc 13 to build"
.    endif
_NEED_GCC13=		yes
.  endif
.endfor

_NEED_GCC_AUX?=		no
.for _pattern_ in ${_GCC_AUX_PATTERNS}
.  if ${_GCC_REQD:M${_pattern_}}
_NEED_GCC_AUX=		yes
.  endif
.endfor

# XXX: What is this logic for, why is it GCC 8, and why is it undocumented?
.if ${_NEED_GCC6:tl} == "no" && ${_NEED_GCC7:tl} == "no" && \
    ${_NEED_GCC8:tl} == "no" && ${_NEED_GCC9:tl} == "no" && \
    ${_NEED_GCC10:tl} == "no" && ${_NEED_GCC12:tl} == "no" && \
    ${_NEED_GCC13:tl} == "no" && ${_NEED_GCC_AUX:tl} == "no"
_NEED_GCC8=		yes
.endif

# April 2022: GCC below 10 from pkgsrc is broken on 32-bit arm NetBSD.
.if !empty(MACHINE_PLATFORM:MNetBSD-*-earm*) && ${OPSYS_VERSION} < 099900 && \
    (${_NEED_GCC8:tl} == "yes" || ${_NEED_GCC9:tl} == "yes")
_NEED_GCC8=	no
_NEED_GCC9=	no
_NEED_GCC10=	yes
.endif

#
# Set the required GCC dependency variables based on which _NEED_GCC* is set
# to "yes" above.
#
.if ${_NEED_GCC6} == "yes"
_GCC_PKGBASE=		gcc6
.  if ${PKGPATH} == lang/gcc6
_IGNORE_GCC=		yes
MAKEFLAGS+=		_IGNORE_GCC=yes
.  endif
.  if !defined(_IGNORE_GCC) && !empty(_LANGUAGES.gcc)
_GCC_PKGSRCDIR=		../../lang/gcc6
_GCC_DEPENDENCY=	gcc6>=${_GCC_REQD}:../../lang/gcc6
.    if ${_LANGUAGES.gcc:Mc++} || \
        ${_LANGUAGES.gcc:Mfortran} || \
        ${_LANGUAGES.gcc:Mfortran77} || \
        ${_LANGUAGES.gcc:Mgo} || \
        ${_LANGUAGES.gcc:Mobjc} || \
        ${_LANGUAGES.gcc:Mobj-c++}
_USE_GCC_SHLIB?=	yes
.    endif
.  endif
#
.elif ${_NEED_GCC7} == "yes"
_GCC_PKGBASE=		gcc7
.  if ${PKGPATH} == lang/gcc7
_IGNORE_GCC=		yes
MAKEFLAGS+=		_IGNORE_GCC=yes
.  endif
.  if !defined(_IGNORE_GCC) && !empty(_LANGUAGES.gcc)
_GCC_PKGSRCDIR=		../../lang/gcc7
_GCC_DEPENDENCY=	gcc7>=${_GCC_REQD}:../../lang/gcc7
.    if ${_LANGUAGES.gcc:Mc++} || \
        ${_LANGUAGES.gcc:Mfortran} || \
        ${_LANGUAGES.gcc:Mfortran77} || \
        ${_LANGUAGES.gcc:Mgo} || \
        ${_LANGUAGES.gcc:Mobjc} || \
        ${_LANGUAGES.gcc:Mobj-c++}
_USE_GCC_SHLIB?=	yes
.    endif
.  endif
#
.elif ${_NEED_GCC8} == "yes"
_GCC_PKGBASE=		gcc8
.  if ${PKGPATH} == lang/gcc8
_IGNORE_GCC=		yes
MAKEFLAGS+=		_IGNORE_GCC=yes
.  endif
.  if !defined(_IGNORE_GCC) && !empty(_LANGUAGES.gcc)
_GCC_PKGSRCDIR=		../../lang/gcc8
_GCC_DEPENDENCY=	gcc8>=${_GCC_REQD}:../../lang/gcc8
.    if ${_LANGUAGES.gcc:Mc++} || \
        ${_LANGUAGES.gcc:Mfortran} || \
        ${_LANGUAGES.gcc:Mfortran77} || \
        ${_LANGUAGES.gcc:Mgo} || \
        ${_LANGUAGES.gcc:Mobjc} || \
        ${_LANGUAGES.gcc:Mobj-c++}
_USE_GCC_SHLIB?=	yes
.    endif
.  endif
#
.elif ${_NEED_GCC9} == "yes"
_GCC_PKGBASE=		gcc9
.  if ${PKGPATH} == lang/gcc9
_IGNORE_GCC=		yes
MAKEFLAGS+=		_IGNORE_GCC=yes
.  endif
.  if !defined(_IGNORE_GCC) && !empty(_LANGUAGES.gcc)
_GCC_PKGSRCDIR=		../../lang/gcc9
_GCC_DEPENDENCY=	gcc9>=${_GCC_REQD}:../../lang/gcc9
.    if ${_LANGUAGES.gcc:Mc++} || \
        ${_LANGUAGES.gcc:Mfortran} || \
        ${_LANGUAGES.gcc:Mfortran77} || \
        ${_LANGUAGES.gcc:Mgo} || \
        ${_LANGUAGES.gcc:Mobjc} || \
        ${_LANGUAGES.gcc:Mobj-c++}
_USE_GCC_SHLIB?=	yes
.    endif
.  endif
#
.elif ${_NEED_GCC10} == "yes"
_GCC_PKGBASE=		gcc10
.  if ${PKGPATH} == lang/gcc10
_IGNORE_GCC=		yes
MAKEFLAGS+=		_IGNORE_GCC=yes
.  endif
.  if !defined(_IGNORE_GCC) && !empty(_LANGUAGES.gcc)
_GCC_PKGSRCDIR=		../../lang/gcc10
_GCC_DEPENDENCY=	gcc10>=${_GCC_REQD}:../../lang/gcc10
.    if ${_LANGUAGES.gcc:Mc++} || \
        ${_LANGUAGES.gcc:Mfortran} || \
        ${_LANGUAGES.gcc:Mfortran77} || \
        ${_LANGUAGES.gcc:Mgo} || \
        ${_LANGUAGES.gcc:Mobjc} || \
        ${_LANGUAGES.gcc:Mobj-c++}
_USE_GCC_SHLIB?=	yes
.    endif
.  endif
#
.elif ${_NEED_GCC12} == "yes"
_GCC_PKGBASE=		gcc12
.  if ${PKGPATH} == lang/gcc12
_IGNORE_GCC=		yes
MAKEFLAGS+=		_IGNORE_GCC=yes
.  endif
.  if !defined(_IGNORE_GCC) && !empty(_LANGUAGES.gcc)
_GCC_PKGSRCDIR=		../../lang/gcc12
_GCC_DEPENDENCY=	gcc12>=${_GCC_REQD}:../../lang/gcc12
.    if ${_LANGUAGES.gcc:Mc++} || \
        ${_LANGUAGES.gcc:Mfortran} || \
        ${_LANGUAGES.gcc:Mfortran77} || \
        ${_LANGUAGES.gcc:Mgo} || \
        ${_LANGUAGES.gcc:Mobjc} || \
        ${_LANGUAGES.gcc:Mobj-c++}
_USE_GCC_SHLIB?=	yes
.    endif
.  endif
#
.elif ${_NEED_GCC13} == "yes"
_GCC_PKGBASE=		gcc13
.  if ${PKGPATH} == lang/gcc13
_IGNORE_GCC=		yes
MAKEFLAGS+=		_IGNORE_GCC=yes
.  endif
.  if !defined(_IGNORE_GCC) && !empty(_LANGUAGES.gcc)
_GCC_PKGSRCDIR=		../../lang/gcc13
_GCC_DEPENDENCY=	gcc13>=${_GCC_REQD}:../../lang/gcc13
.    if ${_LANGUAGES.gcc:Mc++} || \
        ${_LANGUAGES.gcc:Mfortran} || \
        ${_LANGUAGES.gcc:Mfortran77} || \
        ${_LANGUAGES.gcc:Mgo} || \
        ${_LANGUAGES.gcc:Mobjc} || \
        ${_LANGUAGES.gcc:Mobj-c++}
_USE_GCC_SHLIB?=	yes
.    endif
.  endif
#
.elif ${_NEED_GCC_AUX} == "yes"
_GCC_PKGBASE=		gcc6-aux
.  if ${PKGPATH} == lang/gcc6-aux
_IGNORE_GCC=		yes
MAKEFLAGS+=		_IGNORE_GCC=yes
.  endif
.  if !defined(_IGNORE_GCC) && !empty(_LANGUAGES.gcc)
_GCC_PKGSRCDIR=		../../lang/gcc6-aux
_GCC_DEPENDENCY=	gcc6-aux>=${_GCC_REQD}:../../lang/gcc6-aux
.    if ${_LANGUAGES.gcc:Mc++} || \
        ${_LANGUAGES.gcc:Mfortran} || \
        ${_LANGUAGES.gcc:Mfortran77} || \
        ${_LANGUAGES.gcc:Mada} || \
        ${_LANGUAGES.gcc:Mobjc}
_USE_GCC_SHLIB?=	yes
.    endif
.  endif
.endif

#
# At this point we have all the information required to determine whether we
# should be using a pkgsrc GCC or not, and so can set _USE_PKGSRC_GCC.
#
#   * If _IGNORE_GCC is set then we are compiling a pkgsrc GCC itself, and
#     must set _USE_PKGSRC_GCC=no to avoid recursion.
#
#   * If the user has explicitly set USE_PKGSRC_GCC=yes then honour their
#     selection, regardless of other factors.
#
#   * If GCC is builtin, _USE_PKGSRC_GCC is set based on whether it satisfies
#     the current _GCC_REQD requirement or not.
#
#   * Otherwise we must be using a pkgsrc GCC.
#
.if defined(_IGNORE_GCC)
_USE_PKGSRC_GCC=	no
.elif ${USE_PKGSRC_GCC:tl} == "yes"
_USE_PKGSRC_GCC=	yes
.elif ${_IS_BUILTIN_GCC} == "yes"
_USE_PKGSRC_GCC!=       \
        if ${PKG_ADMIN} pmatch 'gcc>=${_GCC_REQD}' gcc-${_GCC_VERSION} 2>/dev/null; then \
                ${ECHO} "no"; \
        else \
                ${ECHO} "yes"; \
        fi
.else
_USE_PKGSRC_GCC=	yes
.endif

#
# Add the dependency on GCC if requested.
#
.if ${_USE_PKGSRC_GCC} == "yes" && defined(_GCC_PKGSRCDIR)
.  include "${_GCC_PKGSRCDIR}/buildlink3.mk"
.endif

#.READONLY: GCC_REQD
_GCC_REQD_EFFECTIVE:=	${GCC_REQD}
