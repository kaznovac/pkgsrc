# $NetBSD$
#
# This file is included unless the user specifies that the native compiler must
# be used (via USE_NATIVE_GCC=yes).  Its role is to determine which compiler
# should be selected.
#
# GCC version selection is calculated based on either direct GCC_REQD
# requirements from the package, or indirectly via USE_CC_FEATURES and/or
# USE_CXX_FEATURES, which will compute an appropriate GCC_REQD.
#
# The maximum value of GCC_REQD is calculated, any others are discarded, and
# the pkgsrc GCC with the closest version match is saved.
#
# The selection logic is then as follows:
#
#   * If the package is either the pkgsrc GCC itself, or one of its
#     dependencies indicated by the user via GCC_BOOTSTRAP_PKGS, then the
#     native compiler must be selected to avoid circular dependencies.
#
#   * Otherwise if the user has set USE_PKGSRC_GCC=yes then the pkgsrc GCC is
#     selected, regardless of whether the native compiler matches the
#     requirement.
#
#   * Otherwise if the native compiler matches the maximum GCC_REQD
#     requirement, it is selected.
#
#   * Otherwise the pkgsrc GCC is selected.
#
# This file sets the following variables for gcc.mk to use for any further
# processing:
#
# _USE_PKGSRC_GCC
#	Set to "yes" or "no".
#
# _PKGSRC_GCC_PREFIX
#	Set to the base path of a pkgsrc GCC installation.
#


_USER_VARS.gcc+= \
	GCC_BOOTSTRAP_PKGS
_PKG_VARS.gcc+=	\
	GCC_REQD USE_CC_FEATURES USE_CXX_FEATURES
_DEF_VARS.gcc+=	\
	_GCC_LIBS_PKGSRCDIR _GCC_PKGBASE _GCC_PKGSRCDIR \
	_GCC_PKG_SATISFIES_DEP _GCC_REQD _GCC_STRICTEST_REQD \
	_GCC_ARCHDIR _GCC_LDFLAGS _GCC_LIBDIRS _GCC_PREFIX \
	_GCC_SUBPREFIX _PKGSRC_GCC_PREFIX \
	_IGNORE_GCC \
	_NEED_GCC6 _NEED_GCC7 _NEED_GCC8 _NEED_GCC9 _NEED_GCC10 \
	_NEED_GCC12 _NEED_GCC13 _NEED_GCC_AUX
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
USE_CC_FEATURES?=	# empty
USE_CXX_FEATURES?=	# empty

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
_GCC_STRICTEST_REQD:=	${_version_}
.      endif
.    endif
.  endfor
.endfor
_GCC_REQD:=		${_GCC_STRICTEST_REQD}

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
# to "yes" above.  Allow them to be overridden, useful if for example the user
# wants to use a custom GCC in wip or another repository.
#
# When building a pkgsrc GCC we need to indicate which packages are themselves
# dependencies for that GCC.  Those packages must be built with a different
# compiler, to avoid circular dependencies.  It is up to the user to list these
# packages using either
#
#	GCC_BOOTSTRAP_PKGS+=		cat/pkg1 cat/pkg2 ...	# For all GCC
#	GCC_BOOTSTRAP_PKGS.gccx+=	cat/pkg1 cat/pkg2 ...	# For just GCCx
#
# It is not possible to provide a comprehensive list of packages for each GCC,
# as this will depend on OPSYS, selected PKG_OPTIONS, as well as other user
# settings.  We are also limited by being included relatively early, so would
# only be able to check for certain variables.
#
# The following core packages, as well as any of their recursive dependencies,
# are those most likely to be required for most GCC builds:
#
#	devel/binutils
#	devel/gmake
#	devel/gtexinfo
#	lang/perl5
#	pkgtools/cwrappers
#	pkgtools/digest
#	pkgtools/mktools
#	pkgtools/pkg_install-info
#	sysutils/checkperms
#	textproc/gsed
#
# Rather than adding all of these and their dependencies to GCC_BOOTSTRAP_PKGS,
# users may find it simpler to build some the tools in an external location and
# point TOOLS_PLATFORM.<tool> at them, especially for gtexinfo (makeinfo) and
# perl5.
#
GCC_BOOTSTRAP_PKGS.gcc6?=	# empty
GCC_PKGPATH.gcc6?=		lang/gcc6
GCC_LIBSPATH.gcc6?=		lang/gcc6-libs
#
GCC_BOOTSTRAP_PKGS.gcc7?=	# empty
GCC_PKGPATH.gcc7?=		lang/gcc7
GCC_LIBSPATH.gcc7?=		lang/gcc7-libs
#
GCC_BOOTSTRAP_PKGS.gcc8?=	# empty
GCC_PKGPATH.gcc8?=		lang/gcc8
GCC_LIBSPATH.gcc8?=		lang/gcc8-libs
#
GCC_BOOTSTRAP_PKGS.gcc9?=	# empty
GCC_PKGPATH.gcc9?=		lang/gcc9
GCC_LIBSPATH.gcc9?=		lang/gcc9-libs
#
GCC_BOOTSTRAP_PKGS.gcc10?=	# empty
GCC_PKGPATH.gcc10?=		lang/gcc10
GCC_LIBSPATH.gcc10?=		lang/gcc10-libs
#
GCC_BOOTSTRAP_PKGS.gcc12?=	# empty
GCC_PKGPATH.gcc12?=		lang/gcc12
GCC_LIBSPATH.gcc12?=		lang/gcc12-libs
#
GCC_BOOTSTRAP_PKGS.gcc13?=	# empty
GCC_PKGPATH.gcc13?=		lang/gcc13
GCC_LIBSPATH.gcc13?=		lang/gcc13-libs
#
GCC_BOOTSTRAP_PKGS.gcc-aux?=	# empty
GCC_PKGPATH.gcc6-aux?=		lang/gcc6-aux

.if ${_NEED_GCC6} == "yes"
_GCC_PKGBASE=		gcc6
.elif ${_NEED_GCC7} == "yes"
_GCC_PKGBASE=		gcc7
.elif ${_NEED_GCC8} == "yes"
_GCC_PKGBASE=		gcc8
.elif ${_NEED_GCC9} == "yes"
_GCC_PKGBASE=		gcc9
.elif ${_NEED_GCC10} == "yes"
_GCC_PKGBASE=		gcc10
.elif ${_NEED_GCC12} == "yes"
_GCC_PKGBASE=		gcc12
.elif ${_NEED_GCC13} == "yes"
_GCC_PKGBASE=		gcc13
.elif ${_NEED_GCC_AUX} == "yes"
_GCC_PKGBASE=		gcc6-aux
.endif

.if defined(_GCC_PKGBASE)
GCC_BOOTSTRAP_PKGS?=	${GCC_BOOTSTRAP_PKGS.${_GCC_PKGBASE}}
#
# Set _IGNORE_GCC if we are attempting to build GCC itself or one of its
# bootstrap dependencies.
#
.  if ${PKGPATH} == ${GCC_PKGPATH.${_GCC_PKGBASE}} || \
      ${PKGPATH:M${GCC_BOOTSTRAP_PKGS}}
_IGNORE_GCC=		yes
MAKEFLAGS+=		_IGNORE_GCC=yes
.  endif
#
# If we're not building GCC or a dependency, and the package has USE_LANGUAGES
# that matches a GCC compiler, define the variables that are used later to
# actually pull in GCC.
#
.  if !defined(_IGNORE_GCC) && !empty(_LANGUAGES.gcc)
_GCC_PKGSRCDIR=		../../${GCC_PKGPATH.${_GCC_PKGBASE}}
.    if defined(GCC_LIBSPATH.${_GCC_PKGBASE})
_GCC_LIBS_PKGSRCDIR=	../../${GCC_LIBSPATH.${_GCC_PKGBASE}}
.    endif
.  endif
.endif

#
# At this point we have all the information required to determine whether we
# should be using a pkgsrc GCC or not, and so can set _USE_PKGSRC_GCC.
#
#   * If _IGNORE_GCC is set then we are compiling a pkgsrc GCC itself, or one
#     of its dependencies, and must set _USE_PKGSRC_GCC=no to avoid recursion.
#
#   * If the user has explicitly set USE_PKGSRC_GCC=yes then honour their
#     selection, regardless of other factors.
#
#   * If there is a native GCC, _USE_PKGSRC_GCC is set based on whether it
#     satisfies the current _GCC_REQD requirement or not.
#
#   * Otherwise we must be using a pkgsrc GCC.
#
.if defined(_IGNORE_GCC)
_USE_PKGSRC_GCC=	no
.elif ${USE_PKGSRC_GCC:tl} == "yes"
_USE_PKGSRC_GCC=	yes
.elif ${_IS_NATIVE_GCC} == "yes"
_USE_PKGSRC_GCC!=	\
	if ${PKG_ADMIN} pmatch 'gcc>=${_GCC_REQD}' \
	    gcc-${_NATIVE_GCC_VERSION} 2>/dev/null; then \
		${ECHO} "no"; \
	else \
		${ECHO} "yes"; \
	fi
.else
_USE_PKGSRC_GCC=	yes
.endif

#
# If we are using pkgsrc GCC then pull in the compiler, as well as the optional
# runtime library if enabled.
#
.if ${_USE_PKGSRC_GCC} == "yes"
.  if defined(_GCC_PKGSRCDIR)
.    include "${_GCC_PKGSRCDIR}/buildlink3.mk"
.  endif
.  if ${USE_PKGSRC_GCC_RUNTIME:tl} == "yes" && defined(_GCC_LIBS_PKGSRCDIR)
.    include "${_GCC_LIBS_PKGSRCDIR}/buildlink3.mk"
.  endif
.endif

#
# Ensure that the correct rpath is passed to the linker if we need to
# link against gcc shared libs.
#
# XXX cross-compilation -- is this TOOLBASE or LOCALBASE?
#
.if ${_USE_PKGSRC_GCC} == "yes"
_GCC_SUBPREFIX!=	\
	if ${PKG_INFO} -qe ${_GCC_PKGBASE}; then			\
		${PKG_INFO} -f ${_GCC_PKGBASE} |			\
		${GREP} "File:.*bin/gcc" |				\
		${GREP} -v "/gcc[0-9][0-9]*-.*" |			\
		${SED} -e "s/.*File: *//;s/bin\/gcc.*//;q";		\
	else								\
		case ${_CC} in						\
		${LOCALBASE}/*)						\
			subprefix="${_CC:H:S/\/bin$//:S/${LOCALBASE}\///:S/${LOCALBASE}//}"; \
			case "$${subprefix}" in				\
			"")	${ECHO} "$${subprefix}" ;;		\
			*)	${ECHO} "$${subprefix}/" ;;		\
			esac;						\
			;;						\
		*)							\
			${ECHO} "_GCC_SUBPREFIX_not_found/";		\
			;;						\
		esac;							\
	fi
_PKGSRC_GCC_PREFIX=	${LOCALBASE}/${_GCC_SUBPREFIX}
_GCC_ARCHDIR!=		\
	if [ -x ${_PKGSRC_GCC_PREFIX}bin/gcc ]; then			\
		${DIRNAME} `${_PKGSRC_GCC_PREFIX}bin/gcc -print-libgcc-file-name 2>/dev/null`; \
	else								\
		${ECHO} "_GCC_ARCHDIR_not_found";			\
	fi
_GCC_LIBDIRS=	${_GCC_ARCHDIR}
.  if empty(USE_PKGSRC_GCC_RUNTIME:M[Yy][Ee][Ss])
_GCC_LIBDIRS+=	${_PKGSRC_GCC_PREFIX}lib${LIBABISUFFIX}
.  endif
_GCC_LDFLAGS=	# empty
.  for _dir_ in ${_GCC_LIBDIRS:N*not_found*}
_GCC_LDFLAGS+=	-L${_dir_} ${COMPILER_RPATH_FLAG}${_dir_}
.  endfor
LDFLAGS+=	${_GCC_LDFLAGS}
.endif

#.READONLY: GCC_REQD
_GCC_REQD_EFFECTIVE:=	${GCC_REQD}
