# $NetBSD: NetBSD.mk,v 1.81 2024/04/12 19:58:22 riastradh Exp $
#
# Variable definitions for the NetBSD operating system.

# Needed for 1.6.1 and earlier due to rpcgen bugs and paths
.if defined(CPP) && ${CPP} == "cpp"
CPP=		/usr/bin/cpp
.endif
ECHO_N?=	${ECHO} -n
IMAKE_MAKE?=	${MAKE}		# program which gets invoked by imake
PKGLOCALEDIR?=	share
PS?=		/bin/ps
SU?=		/usr/bin/su
TYPE?=		type				# Shell builtin

# pax-as-tar, found on <=8, and optionally later, fails on many archives.
EXTRACT_USING?=	bsdtar

.if ${OPSYS_VERSION} < 090000
EXTRACT_ENV+=	LC_CTYPE=en_US.UTF-8
.endif

USERADD?=	/usr/sbin/useradd
GROUPADD?=	/usr/sbin/groupadd

CPP_PRECOMP_FLAGS?=	# unset
DEF_UMASK?=		0022
.if ${OBJECT_FMT} == "ELF"
EXPORT_SYMBOLS_LDFLAGS?=-Wl,-E	# add symbols to the dynamic symbol table
.else
EXPORT_SYMBOLS_LDFLAGS?=-Wl,--export-dynamic
.endif
MOTIF_TYPE_DEFAULT?=	motif	# default 2.0 compatible libs type
NOLOGIN?=		/sbin/nologin
# This must be lazy and using :? evaluation doesn't work due to a make bugs.
NATIVE_PKG_TOOLS_BIN_cmd=	if [ -x ${TOOLBASE}/sbin/pkg_info ]; then echo ${TOOLBASE}/sbin; else echo /usr/sbin; fi
NATIVE_PKG_TOOLS_BIN?=		${NATIVE_PKG_TOOLS_BIN_cmd:sh}
.if ${USE_CROSS_COMPILE:tl} == "yes"
PKG_TOOLS_BIN=			${CROSS_PKG_TOOLS_BIN:U/usr/sbin}
.else
PKG_TOOLS_BIN?=			${NATIVE_PKG_TOOLS_BIN}
.endif
ROOT_CMD?=		${SU} - root -c
ROOT_USER?=		root
ROOT_GROUP?=	wheel
ULIMIT_CMD_virtualsize?=	ulimit -v `ulimit -H -v`
ULIMIT_CMD_datasize?=		ulimit -d `ulimit -H -d`
ULIMIT_CMD_stacksize?=		ulimit -s `ulimit -H -s`
ULIMIT_CMD_memorysize?=		ulimit -m `ulimit -H -m`
ULIMIT_CMD_cputime?=		ulimit -t `ulimit -H -t`

# Native X11 is only supported on NetBSD-5 and later.
# On NetBSD-5, native X11 has enough issues that we default
# to modular.
.if ${OPSYS_VERSION} >= 060000
X11_TYPE?=		native
.endif

_OPSYS_EMULDIR.aout=		/emul/aout
_OPSYS_EMULDIR.darwin=		/emul/darwin
_OPSYS_EMULDIR.freebsd=		/emul/freebsd
_OPSYS_EMULDIR.hpux=		/emul/hpux
_OPSYS_EMULDIR.irix=		/emul/irix
_OPSYS_EMULDIR.linux=		/emul/linux
_OPSYS_EMULDIR.linux32=		/emul/linux32
_OPSYS_EMULDIR.netbsd=		# empty
_OPSYS_EMULDIR.netbsd32=	/emul/netbsd32
_OPSYS_EMULDIR.osf1=		/emul/osf1
_OPSYS_EMULDIR.solaris=		/emul/svr4
_OPSYS_EMULDIR.solaris32=	/emul/svr4_32
_OPSYS_EMULDIR.sunos=		/emul/sunos

_OPSYS_SYSTEM_RPATH?=		/usr/lib
_OPSYS_LIB_DIRS?=		/usr/lib
_OPSYS_INCLUDE_DIRS?=		/usr/include

.if exists(${_CROSS_DESTDIR:U}/usr/include/netinet6)
_OPSYS_HAS_INET6=	yes	# IPv6 is standard
.else
_OPSYS_HAS_INET6=	no	# IPv6 is not standard
.endif
_OPSYS_HAS_JAVA=	no	# Java is not standard
_OPSYS_HAS_MANZ=	yes	# MANZ controls gzipping of man pages
_OPSYS_HAS_OSSAUDIO=	yes	# libossaudio is available
_OPSYS_PERL_REQD=		# no base version of perl required
_OPSYS_PTHREAD_AUTO=	no	# -lpthread needed for pthreads
_OPSYS_SHLIB_TYPE=	${_OPSYS_SHLIB_TYPE_cmd:sh}	# shared library type
_OPSYS_SHLIB_TYPE_cmd=	\
	output=`/usr/bin/file /sbin/sysctl`;	\
	case $$output in			\
	*ELF*dynamically*)	echo ELF ;;	\
	*shared*library*)	echo a.out ;;	\
	*dynamically*)		echo a.out ;;	\
	*)			echo ELF ;;	\
	esac
_PATCH_CAN_BACKUP=	yes	# native patch(1) can make backups
_PATCH_BACKUP_ARG?=	-V simple --suffix # switch to patch(1) for backup suffix
_USE_RPATH=		yes	# add rpath to LDFLAGS

_STRIPFLAG_CC?=		${_INSTALL_UNSTRIPPED:D:U-s}	# cc(1) option to strip
_STRIPFLAG_INSTALL?=	${_INSTALL_UNSTRIPPED:D:U-s}	# install(1) option to strip

.if (${MACHINE_ARCH} == alpha)
DEFAULT_SERIAL_DEVICE?=	/dev/ttyC0
SERIAL_DEVICES?=	/dev/ttyC0 \
			/dev/ttyC1
.elif (${MACHINE_ARCH} == "i386")
DEFAULT_SERIAL_DEVICE?=	/dev/tty00
SERIAL_DEVICES?=	/dev/tty00 \
			/dev/tty01
.elif (${MACHINE_ARCH} == m68k)
DEFAULT_SERIAL_DEVICE?=	/dev/tty00
SERIAL_DEVICES?=	/dev/tty00 \
			/dev/tty01
.elif (${MACHINE_ARCH} == mipsel)
DEFAULT_SERIAL_DEVICE?=	/dev/ttyC0
SERIAL_DEVICES?=	/dev/ttyC0 \
			/dev/ttyC1
.elif (${MACHINE_ARCH} == "sparc")
DEFAULT_SERIAL_DEVICE?=	/dev/ttya
SERIAL_DEVICES?=	/dev/ttya \
			/dev/ttyb
.else
DEFAULT_SERIAL_DEVICE?=	/dev/null
SERIAL_DEVICES?=	/dev/null
.endif

.if (${MACHINE_ARCH} == alpha)
CFLAGS+=	-mieee
FFLAGS+=	-mieee
.endif

# check for posix_spawn(3) support, added in NetBSD-6.0
.if exists(${_CROSS_DESTDIR:U}/usr/include/spawn.h)
OPSYS_HAS_POSIX_SPAWN=	# defined
.endif

# check for kqueue(2) support, added in NetBSD-1.6J
.if exists(${_CROSS_DESTDIR:U}/usr/include/sys/event.h)
OPSYS_HAS_KQUEUE=	# defined
.endif

# check for eventfd(2) support, added in NetBSD-9.99.x
.if exists(${_CROSS_DESTDIR:U}/usr/include/sys/eventfd.h)
OPSYS_HAS_EVENTFD=	# defined
.endif

# check for timerfd(2) support, added in NetBSD-9.99.x
.if exists(${_CROSS_DESTDIR:U}/usr/include/sys/timerfd.h)
OPSYS_HAS_TIMERFD=	# defined
.endif

# check for epoll(2) support, added in NetBSD-10.99.x
.if exists(${_CROSS_DESTDIR:U}/usr/include/sys/epoll.h)
OPSYS_HAS_EPOLL=	# defined
.endif

# CIRCLEQ support was removed in NetBSD 10 - some packages still
# require it and need a shipped header.
.if ${OPSYS_VERSION} < 099973
OPSYS_HAS_CIRCLEQ=	# defined
.endif

# Register support for FORTIFY (with GCC)
# Disable on older versions, see:
# http://mail-index.netbsd.org/pkgsrc-users/2017/08/07/msg025435.html
.if ${OPSYS_VERSION} >= 070000
_OPSYS_SUPPORTS_FORTIFY=yes
.endif

# Register support for PIE on supported architectures (with GCC)
.if (${MACHINE_ARCH} == "i386") || \
    (${MACHINE_ARCH} == "x86_64") || \
    (${MACHINE_ARCH} == "aarch64") || \
    (${MACHINE_ARCH} == "aarch64eb") || \
    (${MACHINE_ARCH} == "sparc64") || \
    (${MACHINE_ARCH} == "m68k") || \
    (!empty(MACHINE_ARCH:Mearm*)) || \
    (!empty(MACHINE_ARCH:Mmips*))
_OPSYS_SUPPORTS_MKPIE=	yes
.endif

.if (${MACHINE_ARCH} == "i386" || \
    ${MACHINE_ARCH} == "x86_64") && \
    ${OPSYS_VERSION} >= 090000
OPSYS_HAS_STATIC_PIE=	# defined
.endif

# Register support for RELRO on supported architectures
.if (${MACHINE_ARCH} == "i386") || \
    (${MACHINE_ARCH} == "x86_64") || \
    (${MACHINE_ARCH} == "aarch64") || \
    (${MACHINE_ARCH} == "aarch64eb") || \
    (${MACHINE_ARCH} == "powerpc")
_OPSYS_SUPPORTS_RELRO=	yes
.endif

# Register support for REPRO (with GCC)
_OPSYS_SUPPORTS_MKREPRO=	yes

# Register support for SSP on most architectures (with GCC)
.if (${MACHINE_ARCH} != "alpha") && \
    (${MACHINE_ARCH} != "hppa") && \
    (${MACHINE_ARCH} != "ia64") && \
    (${MACHINE_ARCH} != "mips")
_OPSYS_SUPPORTS_SSP=	yes
.endif

# Register support for stack check on supported architectures (with GCC)
.if (${MACHINE_ARCH} == "i386") || \
    (${MACHINE_ARCH} == "x86_64")
_OPSYS_SUPPORTS_STACK_CHECK=	yes
.endif

.if !defined(PKG_DBDIR) && exists(/var/db/pkg)
PKG_DBDIR_ERROR=	Compatibility pkgdb location exists, but PKG_DBDIR not specified. \
			This may cause unexpected issues. To avoid problems, add \
			PKG_DBDIR=/var/db/pkg to /etc/mk.conf.
.endif

.if exists(/usr/bin/ctfconvert)
_OPSYS_SUPPORTS_CTF=		yes # Compact Type Format conversion.
.endif
_OPSYS_SUPPORTS_CWRAPPERS=	yes
_OPSYS_SUPPORTS_MKTOOLS=	yes

# use readelf in check/bsd.check-vars.mk
_OPSYS_CAN_CHECK_RELRO=		yes
_OPSYS_CAN_CHECK_SHLIBS=	yes
_OPSYS_CAN_CHECK_SSP=		no  # only supports libssp at this time

# check for maximum command line length and set it in configure's environment,
# to avoid a test required by the libtool script that takes forever.
_OPSYS_MAX_CMDLEN_CMD=	/sbin/sysctl -n kern.argmax

# ABI selection.  (XXX Can we do this in terms of ${ABI} instead of
# ${MACHINE_ARCH} vs ${HOST_MACHINE_ARCH} (uname -m)?  Complication is
# I don't know how to get the value of ${ABI} that ld is configured for
# by default.)
_OPSYS_LDEMUL.i386=		elf_i386

.if ${MACHINE_ARCH} != ${HOST_MACHINE_ARCH} && \
    defined(_OPSYS_LDEMUL.${MACHINE_ARCH})
_WRAP_EXTRA_ARGS.LD+=	-m ${_OPSYS_LDEMUL.${MACHINE_ARCH}}
CWRAPPERS_APPEND.ld+=	-m ${_OPSYS_LDEMUL.${MACHINE_ARCH}}
.endif
