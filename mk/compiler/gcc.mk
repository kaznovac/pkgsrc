# $NetBSD: gcc.mk,v 1.263 2023/10/09 13:36:13 nia Exp $
#
# This is the compiler definition for the GNU Compiler Collection.
#
# User-settable variables:
#
# GCCBASE
#	If using a native GCC and the compiler is not in $PATH then
#	this should be set to the base installation directory.
#
# USE_NATIVE_GCC
#	When set to "yes", the native gcc is used, no matter which compiler
#	version a package requires.  See below for a fuller explanation of GCC
#	selection.
#
# USE_PKGSRC_GCC
#	When set to "yes", use an appropriate version of GCC from pkgsrc based
#	on GCC_REQD instead of the native compiler.  See below for a fuller
#	explanation of GCC selection.
#
# USE_PKGSRC_GCC_RUNTIME
#	When set to "yes", the runtime gcc libraries (libgcc, libstdc++, etc)
#	will be used from a corresponding gcc*-libs package rather than the
#	full gcc* compiler package.
#
# GCC_VERSION_SUFFIX
#	Optional suffix for GCC binaries, i.e. if the installed names are like
#	/usr/bin/g++-5, /usr/bin/gcc-5 etc.

# Package-settable variables:
#
# GCC_REQD
#	The minimum version of the GNU Compiler Collection that is
#	required to build this package. Setting this variable doesn't
#	change the compiler that is used for building packages. See
#	ONLY_FOR_COMPILER for that purpose. This is a list of version
#	numbers, of which the maximum version is the definitive one.
#
#	This variable can also be set by the user when USE_PKGSRC_GCC
#	is in effect to ensure that a specific compiler is used for
#	packages which do not specify a higher version.
#
# USE_GCC_RUNTIME
#	Packages which build shared libraries but do not use libtool to
#	do so should define this variable.  It is used to determine whether
#	the gcc runtime should be depended upon when a user has enabled
#	USE_PKGSRC_GCC_RUNTIME.
#
# System-defined variables:
#
# CC_VERSION
#	A string of the form "gcc-4.3.2"
#
# CC_VERSION_STRING
#	The same(?) as CC_VERSION. FIXME: What's the difference between
#	the two?
#
# Keywords: gcc
#

.if !defined(COMPILER_GCC_MK)
COMPILER_GCC_MK=	defined

_VARGROUPS+=	gcc
_USER_VARS.gcc=	\
	USE_NATIVE_GCC USE_PKGSRC_GCC USE_PKGSRC_GCC_RUNTIME \
	GCCBASE GCC_VERSION_SUFFIX \
	TOOLS_USE_CROSS_COMPILE \
	PKGSRC_USE_FORTIFY PKGSRC_USE_RELRO PKGSRC_USE_SSP \
	COMPILER_USE_SYMLINKS CC
_PKG_VARS.gcc=	\
	USE_GCC_RUNTIME USE_LANGUAGES
_SYS_VARS.gcc=	\
	CC_VERSION CC_VERSION_STRING LANGUAGES.gcc \
	CCPATH CPPPATH CXXPATH F77PATH FCPATH \
	PKG_CC PKG_CPP PKG_CXX PKG_FC FC PKGSRC_FORTRAN \
	ADAPATH GMKPATH GLKPATH GBDPATH CHPPATH GLSPATH GNTPATH PRPPATH
_DEF_VARS.gcc=	\
	MAKEFLAGS IMAKEOPTS \
	CFLAGS LDFLAGS \
	PREPEND_PATH \
	COMPILER_INCLUDE_DIRS COMPILER_LIB_DIRS \
	CWRAPPERS_APPEND.cc CWRAPPERS_APPEND.cxx CWRAPPERS_APPEND.ld \
	PKG_ADA PKG_GMK PKG_GLK PKG_GBD PKG_CHP PKG_GNT PKG_GLS PKG_PRP \
	PKGSRC_ADA PKGSRC_GMK PKGSRC_GLK PKGSRC_GBD PKGSRC_CHP PKGSRC_GNT PKGSRC_GLS PKGSRC_PRP \
	_CC _COMPILER_RPATH_FLAG _COMPILER_STRIP_VARS \
	_GCCBINDIR _GCC_ARCHDIR _GCC_BIN_PREFIX _GCC_CFLAGS \
	_GCC_CC _GCC_CPP _GCC_CXX \
	_GCC_FC _GCC_LDFLAGS _GCC_LIBDIRS _GCC_PKG \
	_GCC_PREFIX _GCC_SUBPREFIX \
	_GCC_TEST_DEPENDS _GCC_NEEDS_A_FORTRAN _GCC_VARS _GCC_VERSION \
	_GCC_ADA _GCC_GMK _GCC_GLK _GCC_GBD _GCC_CHP _GCC_GLS _GCC_GNT _GCC_PRP \
	_IS_BUILTIN_GCC \
	_LANGUAGES.gcc \
	_LINKER_RPATH_FLAG \
	_USE_PKGSRC_GCC \
	_WRAP_EXTRA_ARGS.CC \
	_EXTRA_CC_DIRS \
	_C_STD_VERSIONS \
	${_C_STD_VERSIONS:@std@_C_STD_FLAG.${std}@} \
	_CXX_STD_VERSIONS \
	${_CXX_STD_VERSIONS:@std@_CXX_STD_FLAG.${std}@} \
	_MKPIE_CFLAGS.gcc _MKPIE_LDFLAGS \
	_FORTIFY_CFLAGS _RELRO_LDFLAGS _STACK_CHECK_CFLAGS \
	_CTF_CFLAGS \
	_GCC_DIR \
	_ALIASES.CC _ALIASES.CPP _ALIASES.CXX _ALIASES.FC \
	_ALIASES.ADA _ALIASES.GMK _ALIASES.GLK _ALIASES.GBD \
	_ALIASES.CHP _ALIASES.PRP _ALIASES.GLS _ALIASES.GNT \
	_COMPILER_ABI_FLAG.32 _COMPILER_ABI_FLAG.64 \
	_COMPILER_ABI_FLAG.n32 _COMPILER_ABI_FLAG.o32 \
	_SSP_CFLAGS \
	_CXX_STD_FLAG.c++03 _CXX_STD_FLAG.gnu++03
_USE_VARS.gcc=	\
	MACHINE_ARCH PATH OPSYS TOOLBASE \
	USE_LIBTOOL \
	LIBABISUFFIX \
	COMPILER_RPATH_FLAG \
	MACHINE_GNU_PLATFORM \
	WRKDIR MACHINE_PLATFORM PKGPATH \
	_PKGSRC_MKPIE _PKGSRC_MKREPRO _MKREPRO_CFLAGS.gcc \
	_PKGSRC_USE_FORTIFY _PKGSRC_USE_RELRO _PKGSRC_USE_STACK_CHECK \
	_OPSYS_INCLUDE_DIRS _OPSYS_LIB_DIRS
_LISTED_VARS.gcc= \
	MAKEFLAGS IMAKEOPTS LDFLAGS PREPEND_PATH

.include "../../mk/bsd.prefs.mk"

#
# There are three primary options when it comes to GCC selection:
#
#   1. Use the native GCC exclusively (USE_NATIVE_GCC=yes).
#
#   2. Use a pkgsrc GCC exclusively (USE_PKGSRC_GCC=yes)
#
#   3. Use the native GCC, but pull in a pkgsrc GCC if the native GCC does not
#      satisfy GCC_REQD requirements (the pkgsrc default).
#
# Each option has pros and cons.
#
#   1. Using the native GCC is the simplest option with the best chance of
#      compatibility with the host, as well as avoiding additional package
#      dependencies and runtime library issues, and is recommended wherever
#      possible.  However, unless the native GCC is new enough to satisfy the
#      highest GCC_REQD setting, there may be some packages that will fail to
#      build due to requiring newer compiler features.
#
#   2. Using a pkgsrc GCC is a good option if the system compiler is too old,
#      or if you do not want to rely on the system runtime libraries and
#      prefer to ship self-contained binary package sets.  Users can set
#      GCC_REQD in mk.conf to specify a particular pkgsrc GCC (usually the
#      newest), and can set USE_PKGSRC_GCC_RUNTIME=yes to depend upon the much
#      smaller gcc*-libs packages.  However, this option does require some
#      upfront configuration to ensure that any dependencies of the chosen
#      GCC are built with a native compiler to avoid circular dependencies.
#
#   3. The pkgsrc default is to use the native compiler where possible, but to
#      pull in a pkgsrc GCC when GCC_REQD is newer than the native compiler.
#      While this option does not require any upfront configuration, it has a
#      number of drawbacks.  Dependant on the package build order and GCC_REQD
#      selection, the user may end up building many different versions of GCC.
#      Binaries may end up linked against multiple versions of GCC libraries,
#      causing difficult to debug runtime issues.  And, by default, packages
#      will depend upon the much larger main GCC packages instead of the
#      smaller gcc*-libs packages, making them less suitable for distribution.
#
USE_NATIVE_GCC?=		no
USE_PKGSRC_GCC?=		no
USE_PKGSRC_GCC_RUNTIME?=	no

#
# First get some information about the system so that we can make informed
# choices about which compiler to choose later.
#

#
# Historically the list of supported languages was naively done based on GCC
# version, with a large amount of cargo culting and no consideration at all as
# to whether the language was actually enabled in the build or not.
#
# Instead, we now simply indicate all of the languages that any modern version
# of GCC supports, with GCC_REQD used to indicate a particular version that is
# required, notably for gcc-aux and ada support.
#
LANGUAGES.gcc?=		ada c c++ fortran fortran77 go java obj-c++ objc
_LANGUAGES.gcc=		# empty
.for _lang_ in ${USE_LANGUAGES}
_LANGUAGES.gcc+=	${LANGUAGES.gcc:M${_lang_}}
.endfor

#
# Override the default from sys.mk if necessary.
#
.if ${CC} == cc && ${GCCBASE:U} && !exists(${GCCBASE}/bin/${CC}) && exists(${GCCBASE}/bin/gcc)
CC=	gcc
.endif

#
# _CC is the full path to the compiler named by ${CC} if it can be found.
#
.if !defined(_CC)
_CC:=	${CC:[1]}
.  if !empty(GCCBASE) && exists(${GCCBASE}/bin)
_EXTRA_CC_DIRS=	${GCCBASE}/bin
.  endif
.  for _dir_ in ${_EXTRA_CC_DIRS} ${PATH:C/\:/ /g}
.    if empty(_CC:M/*)
.      if exists(${_dir_}/${CC:[1]})
_CC:=	${_dir_}/${CC:[1]}
.      endif
.    endif
.  endfor
# Pass along _CC only if we're working on native packages -- don't pass
# the cross-compiler on to submakes for building native packages.
.  if ${TOOLS_USE_CROSS_COMPILE:tl} == "no"
MAKEFLAGS+=	_CC=${_CC:Q}
.  endif
.endif

#
# Get the version of the builtin GCC, defaulting to "0" to simplify setting
# _IS_BUILTIN_GCC later.
#
# Prune anything following a "-".  This has only been confirmed in the wild
# with "2.95.3-haiku-090629", so unless it is also seen with a non-obsolete
# compiler this may be removed at some point.
#
.if !defined(_GCC_VERSION)
_GCC_VERSION!=	${_CC} -dumpversion 2>/dev/null || ${ECHO} 0
_GCC_VERSION:=	${_GCC_VERSION:C/-.*$//}
.endif

#
# Set _IS_BUILTIN_GCC to denote whether the default GCC is builtin or not.
#
# If _CC returns a valid path that does not match TOOLBASE (i.e. is not from
# pkgsrc), and _GCC_VERSION returned a positive result, then it is builtin.
#
.if ! ${_CC:M${TOOLBASE}/*} && ${_CC:M/*} && ${_GCC_VERSION} != 0
_IS_BUILTIN_GCC=	yes
.else
_IS_BUILTIN_GCC=	no
.endif

#
# Now we can set _USE_PKGSRC_GCC.  This is the primary variable that determines
# whether we are using a GCC from pkgsrc for this build, and if set will enable
# additional features below to support them correctly.
#
# If the user has explicitly requested USE_NATIVE_GCC=yes then do not consider
# using a pkgsrc GCC at all.  Otherwise gcc-reqd.mk is included and that will
# set _USE_PKGSRC_GCC accordingly, along with any other variables that might
# be required later if _USE_PKGSRC_GCC=yes.
#
.if ${USE_NATIVE_GCC:tl} == "yes"
_USE_PKGSRC_GCC=	no
.else
.  include "gcc-reqd.mk"
.endif

#
# Include support for common GCC-style command line arguments.
#
.include "gcc-style-args.mk"

.for _version_ in ${_C_STD_VERSIONS}
_C_STD_FLAG.${_version_}?=	-std=${_version_}
.endfor
# XXX: pkgsrc historically hardcoded c99=gnu99 so we retain that for now, but
# we should look at removing this and be explicit in packages where required.
_C_STD_FLAG.c99=	-std=gnu99

.for _version_ in ${_CXX_STD_VERSIONS}
_CXX_STD_FLAG.${_version_}?=	-std=${_version_}
.endfor
.if !empty(_GCC_VERSION:M[34].[1234].*)
_CXX_STD_FLAG.c++03=	-std=c++0x
_CXX_STD_FLAG.gnu++03=	-std=gnu++0x
.endif

.if ${_PKGSRC_USE_STACK_CHECK} == "yes"
_STACK_CHECK_CFLAGS=	-fstack-check
_GCC_CFLAGS+=		${_STACK_CHECK_CFLAGS}
.elif ${_PKGSRC_USE_STACK_CHECK} == "stack-clash"
_STACK_CHECK_CFLAGS=	-fstack-clash-protection
_GCC_CFLAGS+=		${_STACK_CHECK_CFLAGS}
.endif

.if ${_PKGSRC_MKPIE} == "yes"
_MKPIE_FCFLAGS=		-fPIC
.  if ${PKGSRC_OVERRIDE_MKPIE:tl} == "no"
_GCC_FCFLAGS+=		${_MKPIE_FCFLAGS}
.  endif
.endif

# GCC has this annoying behaviour where it advocates in a multi-line
# banner the use of "#include" over "#import" when including headers.
# This generates a huge number of warnings when building practically all
# Objective-C code where it is convention to use "#import".  Suppress
# the warning if we're building Objective-C code using GCC.
#
.if !empty(_LANGUAGES.gcc:Mobjc)
CFLAGS+=	-Wno-import
.endif

CFLAGS+=	${_GCC_CFLAGS}
FCFLAGS+=	${_GCC_FCFLAGS}

.if !empty(_USE_PKGSRC_GCC:M[yY][eE][sS])
#
# Ensure that the correct rpath is passed to the linker if we need to
# link against gcc shared libs.
#
# XXX cross-compilation -- is this TOOLBASE or LOCALBASE?
#
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
_GCC_PREFIX=		${LOCALBASE}/${_GCC_SUBPREFIX}
_GCC_ARCHDIR!=		\
	if [ -x ${_GCC_PREFIX}bin/gcc ]; then				\
		${DIRNAME} `${_GCC_PREFIX}bin/gcc -print-libgcc-file-name 2>/dev/null`; \
	else								\
		${ECHO} "_GCC_ARCHDIR_not_found";			\
	fi
_GCC_LIBDIRS=	${_GCC_ARCHDIR}
.  if empty(USE_PKGSRC_GCC_RUNTIME:M[Yy][Ee][Ss])
_GCC_LIBDIRS+=	${_GCC_PREFIX}lib${LIBABISUFFIX}
.  endif
_GCC_LDFLAGS=	# empty
.  for _dir_ in ${_GCC_LIBDIRS:N*not_found*}
_GCC_LDFLAGS+=	-L${_dir_} ${COMPILER_RPATH_FLAG}${_dir_}
.  endfor
.endif

LDFLAGS+=	${_GCC_LDFLAGS}

# Point the variables that specify the compiler to the installed
# GCC executables.
#
_GCC_DIR=	${WRKDIR}/.gcc
_GCC_VARS=	# empty

.if !empty(_USE_PKGSRC_GCC:M[yY][eE][sS])
_GCCBINDIR=	${_GCC_PREFIX}bin
.elif !empty(_IS_BUILTIN_GCC:M[yY][eE][sS])
_GCCBINDIR=	${_CC:H}
.endif
.if !empty(TOOLS_USE_CROSS_COMPILE:M[yY][eE][sS])
_GCC_BIN_PREFIX=	${MACHINE_GNU_PLATFORM}-
.endif
_GCC_BIN_PREFIX?=	# empty
GCC_VERSION_SUFFIX?=	# empty
.if exists(${_GCCBINDIR}/${_GCC_BIN_PREFIX}gcc${GCC_VERSION_SUFFIX})
_GCC_VARS+=	CC
_GCC_CC=	${_GCC_DIR}/bin/${_GCC_BIN_PREFIX}gcc${GCC_VERSION_SUFFIX}
_ALIASES.CC=	cc gcc
CCPATH=		${_GCCBINDIR}/${_GCC_BIN_PREFIX}gcc${GCC_VERSION_SUFFIX}
PKG_CC:=	${_GCC_CC}
.endif
.if exists(${_GCCBINDIR}/${_GCC_BIN_PREFIX}cpp${GCC_VERSION_SUFFIX})
_GCC_VARS+=	CPP
_GCC_CPP=	${_GCC_DIR}/bin/${_GCC_BIN_PREFIX}cpp${GCC_VERSION_SUFFIX}
_ALIASES.CPP=	cpp
CPPPATH=	${_GCCBINDIR}/${_GCC_BIN_PREFIX}cpp${GCC_VERSION_SUFFIX}
PKG_CPP:=	${_GCC_CPP}
.endif
.if exists(${_GCCBINDIR}/${_GCC_BIN_PREFIX}g++${GCC_VERSION_SUFFIX})
_GCC_VARS+=	CXX
_GCC_CXX=	${_GCC_DIR}/bin/${_GCC_BIN_PREFIX}g++${GCC_VERSION_SUFFIX}
_ALIASES.CXX=	c++ g++
CXXPATH=	${_GCCBINDIR}/${_GCC_BIN_PREFIX}g++${GCC_VERSION_SUFFIX}
PKG_CXX:=	${_GCC_CXX}
.endif
.if exists(${_GCCBINDIR}/${_GCC_BIN_PREFIX}g77${GCC_VERSION_SUFFIX})
_GCC_VARS+=	FC
_GCC_FC=	${_GCC_DIR}/bin/${_GCC_BIN_PREFIX}g77${GCC_VERSION_SUFFIX}
_ALIASES.FC=	f77 g77
FC=		g77
FCPATH=		${_GCCBINDIR}/${_GCC_BIN_PREFIX}g77${GCC_VERSION_SUFFIX}
F77PATH=	${_GCCBINDIR}/${_GCC_BIN_PREFIX}g77${GCC_VERSION_SUFFIX}
PKG_FC:=	${_GCC_FC}
PKGSRC_FORTRAN?=	g77
.endif
.if exists(${_GCCBINDIR}/${_GCC_BIN_PREFIX}gfortran${GCC_VERSION_SUFFIX})
_GCC_VARS+=	FC
_GCC_FC=	${_GCC_DIR}/bin/${_GCC_BIN_PREFIX}gfortran${GCC_VERSION_SUFFIX}
_ALIASES.FC=	gfortran
FC=		gfortran
FCPATH=		${_GCCBINDIR}/${_GCC_BIN_PREFIX}gfortran${GCC_VERSION_SUFFIX}
F77PATH=	${_GCCBINDIR}/${_GCC_BIN_PREFIX}gfortran${GCC_VERSION_SUFFIX}
PKG_FC:=	${_GCC_FC}
PKGSRC_FORTRAN?=	gfortran
.endif
.if exists(${_GCCBINDIR}/${_GCC_BIN_PREFIX}ada)
_GCC_VARS+=	ADA GMK GLK GBD CHP PRP GLS GNT
_GCC_ADA=	${_GCC_DIR}/bin/${_GCC_BIN_PREFIX}ada
_GCC_GMK=	${_GCC_DIR}/bin/${_GCC_BIN_PREFIX}gnatmake
_GCC_GLK=	${_GCC_DIR}/bin/${_GCC_BIN_PREFIX}gnatlink
_GCC_GBD=	${_GCC_DIR}/bin/${_GCC_BIN_PREFIX}gnatbind
_GCC_CHP=	${_GCC_DIR}/bin/${_GCC_BIN_PREFIX}gnatchop
_GCC_PRP=	${_GCC_DIR}/bin/${_GCC_BIN_PREFIX}gnatprep
_GCC_GLS=	${_GCC_DIR}/bin/${_GCC_BIN_PREFIX}gnatls
_GCC_GNT=	${_GCC_DIR}/bin/${_GCC_BIN_PREFIX}gnat
_ALIASES.ADA=	ada
_ALIASES.GMK=	gnatmake
_ALIASES.GLK=	gnatlink
_ALIASES.GBD=	gnatbind
_ALIASES.CHP=	gnatchop
_ALIASES.PRP=	gnatprep
_ALIASES.GLS=	gnatls
_ALIASES.GNT=	gnat
ADAPATH=	${_GCCBINDIR}/${_GCC_BIN_PREFIX}ada
GMKPATH=	${_GCCBINDIR}/${_GCC_BIN_PREFIX}gnatmake
GLKPATH=	${_GCCBINDIR}/${_GCC_BIN_PREFIX}gnatlink
GBDPATH=	${_GCCBINDIR}/${_GCC_BIN_PREFIX}gnatbind
CHPPATH=	${_GCCBINDIR}/${_GCC_BIN_PREFIX}gnatchop
PRPPATH=	${_GCCBINDIR}/${_GCC_BIN_PREFIX}gnatprep
GLSPATH=	${_GCCBINDIR}/${_GCC_BIN_PREFIX}gnatls
GNTPATH=	${_GCCBINDIR}/${_GCC_BIN_PREFIX}gnat
PKG_ADA:=	${_GCC_ADA}
PKG_GMK:=	${_GCC_GMK}
PKG_GLK:=	${_GCC_GLK}
PKG_GBD:=	${_GCC_GBD}
PKG_CHP:=	${_GCC_CHP}
PKG_PRP:=	${_GCC_PRP}
PKG_GLS:=	${_GCC_GLS}
PKG_GNT:=	${_GCC_GNT}
PKGSRC_ADA?=	ada
PKGSRC_GMK?=	gnatmake
PKGSRC_GLK?=	gnatlink
PKGSRC_GBD?=	gnatbind
PKGSRC_CHP?=	gnatchop
PKGSRC_PRP?=	gnatprep
PKGSRC_GLS?=	gnatls
PKGSRC_GNT?=	gnat
.endif
_COMPILER_STRIP_VARS+=	${_GCC_VARS}

# Pass the required flags to imake to tell it we're using gcc on Solaris.
.if ${OPSYS} == "SunOS"
IMAKEOPTS+=	-DHasGcc2=YES -DHasGcc2ForCplusplus=YES
.endif

.if ${OPSYS} == "AIX"
# On AIX the GCC toolchain recognizes -maix32 and -maix64,
# -m32 or -m64 are not recognized.
_COMPILER_ABI_FLAG.32=	-maix32
_COMPILER_ABI_FLAG.64=	-maix64
# On HP-UX the GCC toolchain must be specifically targeted to an ABI,
# -m32 or -m64 are not recognized.
.elif ${OPSYS} == "HPUX"
_COMPILER_ABI_FLAG.32=	# empty
_COMPILER_ABI_FLAG.64=	# empty
.elif !empty(MACHINE_ARCH:Mmips*)
_COMPILER_ABI_FLAG.32=	-mabi=n32	# ABI == "32" == "n32"
_COMPILER_ABI_FLAG.n32=	-mabi=n32
_COMPILER_ABI_FLAG.o32=	-mabi=32
_COMPILER_ABI_FLAG.64=	-mabi=64
.elif !empty(MACHINE_ARCH:Maarch64*)
_COMPILER_ABI_FLAG.32=	-m32
_COMPILER_ABI_FLAG.64=	# empty
.else
_COMPILER_ABI_FLAG.32=	-m32
_COMPILER_ABI_FLAG.64=	-m64
.endif

.if !empty(_USE_PKGSRC_GCC:M[yY][eE][sS])
.  if exists(${CCPATH})
CC_VERSION_STRING!=	${CCPATH} -v 2>&1
CC_VERSION!=		\
	if ${CCPATH} -dumpversion > /dev/null 2>&1; then		\
		${ECHO} "gcc-`${CCPATH} -dumpversion`";			\
	else								\
		${ECHO} "gcc-${_GCC_REQD}";				\
	fi

.  else
CC_VERSION_STRING=	${CC_VERSION}
CC_VERSION=		gcc-${_GCC_REQD}
.  endif
.else
CC_VERSION_STRING=	${CC_VERSION}
CC_VERSION=		gcc-${_GCC_VERSION}
.endif

# Prepend the path to the compiler to the PATH.
.if !empty(_LANGUAGES.gcc)
PREPEND_PATH+=	${_GCC_DIR}/bin
.endif

.for _var_ in ${_GCC_VARS}
.  if !target(${_GCC_${_var_}})
override-tools: ${_GCC_${_var_}}
${_GCC_${_var_}}:
	${RUN}${MKDIR} ${.TARGET:H}
.    if !empty(COMPILER_USE_SYMLINKS:M[Yy][Ee][Ss])
	${RUN}${RM} -f ${.TARGET}
	${RUN}${LN} -s ${_GCCBINDIR}/${.TARGET:T} ${.TARGET}
.    else
	${RUN}					\
	(${ECHO} '#!${TOOLS_SHELL}';					\
	 ${ECHO} 'exec ${_GCCBINDIR}/${.TARGET:T} "$$@"';		\
	) > ${.TARGET}
	${RUN}${CHMOD} +x ${.TARGET}
.    endif
.    for _alias_ in ${_ALIASES.${_var_}:S/^/${.TARGET:H}\//}
	${RUN}					\
	if [ ! -x "${_alias_}" ]; then					\
		${LN} -f -s ${.TARGET:T} ${_alias_};			\
	fi
.    endfor
.  endif
.endfor

# On systems without a Fortran compiler, pull one in if needed.
PKGSRC_FORTRAN?=gfortran

_GCC_NEEDS_A_FORTRAN=	no
.if empty(_USE_PKGSRC_GCC:M[yY][eE][sS]) && !(defined(FCPATH) && exists(${FCPATH}))
_GCC_NEEDS_A_FORTRAN=	yes
.else
.  for _pattern_ in 0.* 1.[0-4] 1.[0-4].*
.    if !empty(MACHINE_PLATFORM:MNetBSD-${_pattern_}-*)
_GCC_NEEDS_A_FORTRAN=	yes
.    endif
.  endfor
.endif
.if !empty(_GCC_NEEDS_A_FORTRAN:M[yY][eE][sS])
.  include "../../mk/compiler/${PKGSRC_FORTRAN}.mk"
.endif

.if ${OPSYS} == "Interix" && !empty(_GCCBINDIR:M/opt/gcc.*)
COMPILER_INCLUDE_DIRS=	${_GCCBINDIR:H}/include ${_OPSYS_INCLUDE_DIRS}
COMPILER_LIB_DIRS=	${_GCCBINDIR:H}/lib ${_OPSYS_LIB_DIRS}
.endif

.endif	# COMPILER_GCC_MK
