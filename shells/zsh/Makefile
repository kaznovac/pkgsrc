# $NetBSD: Makefile,v 1.106 2024/03/31 22:08:42 js Exp $

DISTNAME=	zsh-5.9
PKGREVISION=	2
CATEGORIES=	shells
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=zsh/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://zsh.sourceforge.io/
COMMENT=	The Z shell
LICENSE=	gnu-gpl-v2 AND zsh

USE_LANGUAGES=		c c99
USE_TOOLS+=		autoconf automake autoreconf makeinfo
GNU_CONFIGURE=		yes
INFO_FILES=		yes
TEXINFO_REQD=		4.0

CHECK_PORTABILITY_SKIP=	Misc/c2z # not used

CONFIGURE_ARGS+=	--disable-gdbm
CONFIGURE_ARGS+=	--enable-etcdir=${PKG_SYSCONFDIR:Q}

# Ensure we can find initscr(3) otherwise the curses module will not be built.
CONFIGURE_ARGS+=	--with-term-lib="${BUILDLINK_LIBNAME.curses} ${BUILDLINK_LIBNAME.terminfo}"

.include "../../mk/bsd.prefs.mk"

# This cannot be detected automatically without a controlling tty, for example
# when bulk building.
.if ${OPSYS} == "Interix"
CONFIGURE_ARGS+=	--without-tcsetpgrp
.else
CONFIGURE_ARGS+=	--with-tcsetpgrp
.endif

.if ${USE_CROSS_COMPILE:U:tl} == "yes"
# These can't be detected automagically in cross-builds.
CONFIGURE_ENV.NetBSD+=	zsh_cv_shared_environ=yes
CONFIGURE_ENV.NetBSD+=	zsh_cv_shared_tgetent=yes
CONFIGURE_ENV.NetBSD+=	zsh_cv_shared_tigetstr=yes
CONFIGURE_ENV.NetBSD+=	zsh_cv_sys_dynamic_execsyms=yes
.endif

INSTALLATION_DIRS+=	share/doc/zsh

PLIST_VARS+=		xattr
.if exists(/usr/include/sys/xattr.h) || \
    exists(/usr/include/${NATIVE_MACHINE_GNU_ARCH}-${LOWER_OPSYS}-gnu/sys/xattr.h) || \
    defined(OSX_SDK_PATH) && exists(${OSX_SDK_PATH}/usr/include/sys/xattr.h)
PLIST.xattr=		yes
.endif
PRINT_PLIST_AWK+=	{if ($$0 ~ /attr.so/) {$$0 = "$${PLIST.xattr}" $$0;}}

MAKE_JOBS_SAFE=		no
INSTALL_TARGET=		install install.info
TEST_TARGET=		check
PKG_SHELL=		bin/zsh

REPLACE_INTERPRETER+=	zsh
REPLACE.zsh.old=	.*zsh
REPLACE.zsh.new=	${PREFIX}/bin/zsh
REPLACE_FILES.zsh=	Functions/Calendar/*
REPLACE_FILES.zsh+=	Functions/Example/*
REPLACE_FILES.zsh+=	Functions/Misc/*
REPLACE_FILES.zsh+=	Functions/VCS_Info/*
REPLACE_FILES.zsh+=	Misc/globtests*
REPLACE_FILES.zsh+=	Test/runtests.zsh Test/ztst.zsh
REPLACE_FILES.zsh+=	Util/check-tmux-state Util/reporter

SUBST_CLASSES+=		pkgdb
SUBST_STAGE.pkgdb=	pre-configure
SUBST_MESSAGE.pkgdb=	Set PKGDB_DIR
SUBST_FILES.pkgdb=	Completion/BSD/Command/_bsd_pkg
SUBST_VARS.pkgdb=	PKG_DBDIR

.include "options.mk"

pre-configure:
	cd ${WRKSRC} && autoreconf -fiv

post-install:
.for f in FEATURES NEWS Etc/BUGS Etc/FAQ
	${INSTALL_DATA} ${WRKSRC}/${f} ${DESTDIR}${PREFIX}/share/doc/zsh
.endfor

.include "../../converters/libiconv/buildlink3.mk"
.include "../../mk/curses.buildlink3.mk"
.include "../../mk/terminfo.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
