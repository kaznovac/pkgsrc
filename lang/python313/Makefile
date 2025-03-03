# $NetBSD: Makefile,v 1.15 2025/01/07 19:35:09 riastradh Exp $

PKGREVISION=	3
.include "dist.mk"

PKGNAME=	python313-${PY_DISTVERSION}
CATEGORIES=	lang python

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.python.org/
COMMENT=	Interpreted, interactive, object-oriented programming language
LICENSE=	python-software-foundation

CONFLICTS+=	python-[0-9]*
CONFLICTS+=	py313-cElementTree-[0-9]*
CONFLICTS+=	py313-curses-[0-9]*
CONFLICTS+=	py313-cursespanel-[0-9]*
CONFLICTS+=	py313-expat-[0-9]*
CONFLICTS+=	py313-readline-[0-9]*
CONFLICTS+=	py313-sqlite3-[0-9]*
SUPERSEDES+=	py313-cElementTree-[0-9]*
SUPERSEDES+=	py313-curses-[0-9]*
SUPERSEDES+=	py313-cursespanel-[0-9]*
SUPERSEDES+=	py313-expat-[0-9]*
SUPERSEDES+=	py313-readline-[0-9]*
SUPERSEDES+=	py313-sqlite3-[0-9]*

PLIST_AWK=		-f ${PKGSRCDIR}/lang/python/plist-python.awk
PLIST_AWK_ENV+=		PYVERS=313
PRINT_PLIST_AWK+=	/^[^@]/ && /[^\/]+\.pyc$$/ {
PRINT_PLIST_AWK+=	sub(/__pycache__\//, "")
PRINT_PLIST_AWK+=	sub(/\.cpython-313/, "")}
PRINT_PLIST_AWK+=	/^[^@]/ && /[^\/]+\.opt-1.pyc$$/ {
PRINT_PLIST_AWK+=	sub(/.opt-[12].pyc$$/, ".pyo")}

USE_LANGUAGES=		c c++
USE_TOOLS+=		pkg-config
USE_CC_FEATURES+=	c11
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--enable-shared
CONFIGURE_ARGS+=	--with-openssl=${BUILDLINK_PREFIX.openssl}
CONFIGURE_ARGS+=	--with-system-expat
CONFIGURE_ARGS+=	--without-ensurepip
CONFIGURE_ENV+=		OPT=${CFLAGS:M*:Q}
CONFIGURE_ENV+=		ac_cv_path_mkdir=${TOOLS_PATH.mkdir}
CONFIGURE_ENV+=		py_cv_module__gdbm="n/a"
# example module
CONFIGURE_ENV+=		py_cv_module_xxlimited="n/a"
PKGCONFIG_OVERRIDE+=	Misc/python.pc.in Misc/python-embed.pc.in

PTHREAD_OPTS+=	require
.include "../../mk/pthread.buildlink3.mk"

.include "../../mk/bsd.prefs.mk"

# NetBSD-8 curses has enough support for py-curses
USE_CURSES=		getsyx update_panels wide
# But we build as ncurses still to get the full feature set easily
.if ${OPSYS} == "NetBSD"
FAKE_NCURSES=		yes
.endif

.if ${USE_CROSS_COMPILE:tl} == yes
TOOL_DEPENDS+=		${PKGNAME}:../../${PKGPATH}
CONFIGURE_ARGS+=	\
	--with-build-python=${TOOLBASE:Q}/bin/python${PY_VER_SUFFIX}
CONFIGURE_ARGS+=	MACHDEP=${PY_PLATNAME}
CONFIGURE_ARGS+=	\
	_PYTHON_HOST_PLATFORM=${LOWER_OPSYS}-${MACHINE_GNU_ARCH}
CONFIGURE_ARGS+=	ac_sys_system=${OPSYS}
.  if ${OPSYS} == "OSF1"
CONFIGURE_ARGS+=	ac_cv_buggy_getaddrinfo=true
.  else
CONFIGURE_ARGS+=	ac_cv_buggy_getaddrinfo=false
.  endif
CONFIGURE_ARGS.NetBSD+=	ac_cv_file__dev_ptmx=yes
CONFIGURE_ARGS.NetBSD+=	ac_cv_file__dev_ptc=no
.endif

# http://bugs.python.org/issue13241
.if ${MACHINE_PLATFORM:MDarwin-1[12].*}
PKGSRC_COMPILER=	clang
PKG_CC=			clang
PKG_CXX=		clang++
.endif

# Used in socketmodule.c to determine if a sethostname declaration is required
CFLAGS.SunOS+=		-DPKGSRC_OPSYS_VERSION=${OPSYS_VERSION}
LIBS.SunOS+=		-lrt	# fdatasync()

LIBS.DragonFly+=	-lcrypt
LIBS.NetBSD+=		-lcrypt

PY_VER_SUFFIX=		3.13

.if ${OPSYS} == "Darwin"
USE_TOOLS+=	gmake
.endif

.include "platname.mk"
PLIST_SUBST+=	PY_PLATNAME=${PY_PLATNAME:Q}

# For Xcode 5 and up, we need to search the SDK path for headers, otherwise
# certain modules will not be built.
.if ${OPSYS} == "Darwin" && exists(${OSX_SDK_PATH:Q}/usr/include)
CFLAGS+=	-I${OSX_SDK_PATH:Q}/usr/include
.endif

LDFLAGS.SunOS+=	-lresolv

.for incdir in ${_OPSYS_INCLUDE_DIRS}
.  if exists(${incdir}/rpc/rpc.h)
HAVE_RPC_H=	yes
.  elif exists(${incdir}/tirpc/rpc/rpc.h)
CPPFLAGS+=	-I${incdir}/tirpc
HAVE_RPC_H=	yes
.  endif
.  if exists(${incdir}/rpcsvc/yp_prot.h)
HAVE_YP_PROT_H=	yes
.  elif exists(${incdir}/nsl/rpcsvc/yp_prot.h)
CPPFLAGS+=	-I${incdir}/nsl
HAVE_YP_PROT_H=	yes
.  endif
.endfor

PLIST_SUBST+=	PY_VER_SUFFIX=${PY_VER_SUFFIX:Q}

PRINT_PLIST_AWK+=	{ gsub(/${PY_PLATNAME}/, "$${PY_PLATNAME}") }
PRINT_PLIST_AWK+=	{ gsub(/python${PY_VER_SUFFIX}/, \
				"python$${PY_VER_SUFFIX}") }

TEST_TARGET=	test
INSTALL_TARGET=	altinstall

REPLACE_INTERPRETER+=	python
REPLACE.python.old=	.*python[^ ]*
REPLACE.python.new=	${PREFIX}/bin/python${PY_VER_SUFFIX}
REPLACE_FILES.python+=	Lib/base64.py
REPLACE_FILES.python+=	Lib/cProfile.py
REPLACE_FILES.python+=	Lib/encodings/rot_13.py
REPLACE_FILES.python+=	Lib/idlelib/pyshell.py
REPLACE_FILES.python+=	Lib/pdb.py
REPLACE_FILES.python+=	Lib/platform.py
REPLACE_FILES.python+=	Lib/profile.py
REPLACE_FILES.python+=	Lib/pydoc.py
REPLACE_FILES.python+=	Lib/quopri.py
REPLACE_FILES.python+=	Lib/smtplib.py
REPLACE_FILES.python+=	Lib/tabnanny.py
REPLACE_FILES.python+=	Lib/tarfile.py
REPLACE_FILES.python+=	Lib/test/bisect_cmd.py
REPLACE_FILES.python+=	Lib/test/crashers/recursive_call.py
REPLACE_FILES.python+=	Lib/test/curses_tests.py
REPLACE_FILES.python+=	Lib/test/re_tests.py
REPLACE_FILES.python+=	Lib/test/regrtest.py
REPLACE_FILES.python+=	Lib/test/support/smtpd.py
REPLACE_FILES.python+=	Lib/timeit.py
REPLACE_FILES.python+=	Lib/trace.py
REPLACE_FILES.python+=	Lib/turtledemo/__main__.py
REPLACE_FILES.python+=	Lib/turtledemo/bytedesign.py
REPLACE_FILES.python+=	Lib/turtledemo/clock.py
REPLACE_FILES.python+=	Lib/turtledemo/forest.py
REPLACE_FILES.python+=	Lib/turtledemo/fractalcurves.py
REPLACE_FILES.python+=	Lib/turtledemo/lindenmayer.py
REPLACE_FILES.python+=	Lib/turtledemo/minimal_hanoi.py
REPLACE_FILES.python+=	Lib/turtledemo/paint.py
REPLACE_FILES.python+=	Lib/turtledemo/peace.py
REPLACE_FILES.python+=	Lib/turtledemo/penrose.py
REPLACE_FILES.python+=	Lib/turtledemo/planet_and_moon.py
REPLACE_FILES.python+=	Lib/turtledemo/sorting_animate.py
REPLACE_FILES.python+=	Lib/turtledemo/tree.py
REPLACE_FILES.python+=	Lib/turtledemo/yinyang.py
REPLACE_FILES.python+=	Lib/webbrowser.py

# XXX: It might be needed to add manually more paths like ${PREFIX}/qt5/lib
# Test: python -c 'from ctypes.util import find_library; print(find_library("ffi"));'
SUBST_CLASSES+=		findlib
SUBST_MESSAGE.findlib=	Fixing find_library().
SUBST_STAGE.findlib=	pre-configure
SUBST_FILES.findlib=	Lib/ctypes/macholib/dyld.py
SUBST_FILES.findlib+=	Lib/ctypes/util.py
SUBST_SED.findlib=	-e 's,/usr/local,${PREFIX},'
SUBST_SED.findlib+=	-e "s!\('-Wl,-t'\)!'${COMPILER_RPATH_FLAG}${PREFIX}/lib', '-L${PREFIX}/lib', \1!"
SUBST_NOOP_OK.findlib=	yes

.include "options.mk"

CHECK_INTERPRETER_SKIP+=	lib/python${PY_VER_SUFFIX}/test/archivetestdata/exe_with_z64
CHECK_INTERPRETER_SKIP+=	lib/python${PY_VER_SUFFIX}/test/archivetestdata/exe_with_zip
CHECK_INTERPRETER_SKIP+=	lib/python${PY_VER_SUFFIX}/test/archivetestdata/header.sh
CHECK_INTERPRETER_SKIP+=	lib/python${PY_VER_SUFFIX}/test/ziptestdata/exe_with_z64
CHECK_INTERPRETER_SKIP+=	lib/python${PY_VER_SUFFIX}/test/ziptestdata/exe_with_zip
CHECK_INTERPRETER_SKIP+=	lib/python${PY_VER_SUFFIX}/test/ziptestdata/header.sh
CHECK_INTERPRETER_SKIP+=	lib/python${PY_VER_SUFFIX}/venv/scripts/posix/pydoc

# contain CONFIGURE_ARGS and CONFIGURE_ENV
CHECK_WRKREF_SKIP+=	lib/python${PY_VER_SUFFIX}/_sysconfigdata*
CHECK_WRKREF_SKIP+=	lib/python${PY_VER_SUFFIX}/__pycache__/_sysconfigdata*
CHECK_WRKREF_SKIP+=	lib/python${PY_VER_SUFFIX}/config-${PY_VER_SUFFIX}/Makefile

INSTALLATION_DIRS+=	lib/python${PY_VER_SUFFIX}/site-packages

pre-install: setuptools-preinstall
.PHONY: setuptools-preinstall
setuptools-preinstall:
	${INSTALL_DATA} ${.CURDIR}/../../devel/py-setuptools/files/_distutils_system_mod \
		${DESTDIR}${PREFIX}/lib/python${PY_VER_SUFFIX}/site-packages/_distutils_system_mod.py

# for testing
ALLOW_NETWORK_ACCESS=	yes

.if ${OPSYS} == "Linux"
.include "../../databases/gdbm_compat/buildlink3.mk"
.endif
.include "../../archivers/bzip2/buildlink3.mk"
.include "../../archivers/xz/buildlink3.mk"
.include "../../databases/sqlite3/buildlink3.mk"
.if ${USE_BUILTIN.gettext:U:tl} == no
CONFIGURE_ENV+=		ac_cv_lib_intl_textdomain=yes
.endif
.include "../../devel/libffi/buildlink3.mk"
.include "../../devel/libuuid/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../math/mpdecimal/buildlink3.mk"
.include "../../textproc/expat/buildlink3.mk"
.include "../../mk/atomic64.mk"
.include "../../mk/bdb.buildlink3.mk"
.include "../../mk/curses.buildlink3.mk"
.include "../../mk/dlopen.buildlink3.mk"
.include "../../mk/oss.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
