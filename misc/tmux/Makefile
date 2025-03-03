# $NetBSD: Makefile,v 1.67 2024/10/27 17:53:30 leot Exp $

DISTNAME=	tmux-3.5a
CATEGORIES=	misc
MASTER_SITES=	${MASTER_SITE_GITHUB:=tmux/}
GITHUB_RELEASE=	${PKGVERSION_NOREV}

MAINTAINER=	leot@NetBSD.org
HOMEPAGE=	https://tmux.github.io/
COMMENT=	BSD-licensed terminal multiplexer (GNU Screen alternative)
LICENSE=	modified-bsd

GNU_CONFIGURE=	yes

CONFIGURE_ARGS+=	--enable-sixel

USE_TOOLS+=	pkg-config
USE_FEATURES+=	strnlen

SUBST_CLASSES+=			sysconfdir
SUBST_STAGE.sysconfdir=		pre-configure
SUBST_MESSAGE.sysconfdir=	Do not force sysconfdir to /etc
SUBST_FILES.sysconfdir=		configure configure.ac
SUBST_SED.sysconfdir=		-e '/Default tmux\.conf goes in \/etc/d'
SUBST_SED.sysconfdir+=		-e '/sysconfdir=\/etc/d'

# tmux expects setupterm in libcurses, but it is in libterminfo
CONFIGURE_ARGS+=	ac_cv_lib_curses_setupterm=yes
LDFLAGS.NetBSD+=	-lterminfo

.include "../../mk/bsd.prefs.mk"
.include "../../mk/compiler.mk"
.if ${MACHINE_PLATFORM:MSunOS-5.1[0-9]-*} && \
    ${CC_VERSION:Mgcc-4.[6-9].*}
BUILDLINK_TRANSFORM+=	opt:-D_XPG4_2:-D_XPG6
.endif

# https://trac.macports.org/changeset/127986
.if ${MACHINE_PLATFORM:MDarwin-1[0-9].*}
CPPFLAGS+=	-D__DARWIN_VERS_1050=0
.endif

.if ${OPSYS} == "Darwin"
CONFIGURE_ARGS+=	--enable-utf8proc
.include "../../converters/utf8proc/buildlink3.mk"
.endif

.include "../../devel/libevent/buildlink3.mk"
.include "../../mk/curses.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
