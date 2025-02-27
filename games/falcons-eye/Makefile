# $NetBSD: Makefile,v 1.47 2025/01/06 21:49:11 ktnb Exp $
#

DISTNAME=		nethack_source_331_jtp_193
PKGNAME=		falcons-eye-1.9.3
PKGREVISION=		17
CATEGORIES=		games
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=falconseye/}
EXTRACT_SUFX=		.zip

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://falconseye.sourceforge.net/
COMMENT=		Falcon's Eye NetHack

PKG_DESTDIR_SUPPORT=	destdir

MAKE_JOBS_SAFE=		no

HAS_CONFIGURE=		yes
CONFIGURE_SCRIPT=	./sys/unix/setup.sh
DIST_SUBDIR=		${PKGNAME_NOREV}-20050216-2

WRKSRC=			${WRKDIR}
USE_TOOLS+=		bison lex ksh:run gzip:run
USE_GAMESGROUP=		yes
MAKE_ENV+=		YACC=${TOOLS_CMDLINE_YACC:Q}
MAKE_FLAGS+=		GAMEUID=${GAMES_USER}
MAKE_FLAGS+=		GAMEGRP=${GAMES_GROUP}

REPLACE_KSH+=		src/fe-config

LIBS.SunOS+=		-lm

SUBST_CLASSES+=		paths
SUBST_MESSAGE.paths=	Configuring program paths.
SUBST_STAGE.paths=	pre-configure
SUBST_FILES.paths=	include/config.h src/fe-config.in
SUBST_FILES.paths+=	sys/unix/nethack.sh
SUBST_SED.paths=	-e "s,XXXPREFIXXXX,${PREFIX},g"
SUBST_SED.paths+=	-e "s,@GZIP_PROGRAM@,${GZIP_CMD:M*gzip},g"

SUBST_CLASSES.NetBSD+=	unixconf
SUBST_MESSAGE.unixconf=	Configuring to use NetBSD presets.
SUBST_STAGE.unixconf=	pre-configure
SUBST_FILES.unixconf=	include/unixconf.h
SUBST_SED.unixconf=	-e 's,^\/\* \#define BSD 1 \*\/,\#define BSD 1,'
SUBST_SED.unixconf+=	-e 's,^\#define SYSV,\/\* \#define SYSV \*\/,'
SUBST_SED.unixconf+=	-e 's,^\#define LINUX,\/\* \#define LINUX \*\/,'

EGDIR=			${PREFIX}/share/examples/falcons-eye
SHAREDIR=		${PREFIX}/share/falcons-eye-dir

CONF_FILES_PERMS+=	/dev/null ${SHAREDIR}/logfile ${REAL_ROOT_USER} ${GAMES_GROUP} ${GAMEDATAMODE}
CONF_FILES_PERMS+=	/dev/null ${SHAREDIR}/record ${REAL_ROOT_USER} ${GAMES_GROUP} ${GAMEDATAMODE}
REQD_DIRS+=		${SHAREDIR}/config
REQD_DIRS_PERMS+=	${SHAREDIR} ${REAL_ROOT_USER} ${GAMES_GROUP} ${GAMEDIRMODE}
REQD_DIRS_PERMS+=	${SHAREDIR}/save ${REAL_ROOT_USER} ${GAMES_GROUP} 770
CONF_FILES_PERMS+=	${EGDIR}/jtp_intr.txt ${SHAREDIR}/config/jtp_intr.txt \
	${REAL_ROOT_USER} ${GAMES_GROUP} ${GAMEDATAMODE}
CONF_FILES_PERMS+=	${EGDIR}/jtp_keys.txt ${SHAREDIR}/config/jtp_keys.txt \
	${REAL_ROOT_USER} ${GAMES_GROUP} ${GAMEDATAMODE}
CONF_FILES_PERMS+=	${EGDIR}/jtp_lit1.dat ${SHAREDIR}/config/jtp_lit1.dat \
	${REAL_ROOT_USER} ${GAMES_GROUP} ${GAMEDATAMODE}
CONF_FILES_PERMS+=	${EGDIR}/jtp_opts.txt ${SHAREDIR}/config/jtp_opts.txt \
	${REAL_ROOT_USER} ${GAMES_GROUP} ${GAMEDATAMODE}
CONF_FILES_PERMS+=	${EGDIR}/jtp_snds.txt ${SHAREDIR}/config/jtp_snds.txt \
	${REAL_ROOT_USER} ${GAMES_GROUP} ${GAMEDATAMODE}
SPECIAL_PERMS+=		${SHAREDIR}/falcons-eye ${SETGID_GAMES_PERMS}

pre-configure:
	${CP} ${WRKSRC}/src/fe-config.in ${WRKSRC}/src/fe-config
	${CHMOD} 755 ${WRKSRC}/sys/unix/setup.sh

post-build:
	${CP} ${WRKSRC}/src/nethack ${WRKSRC}/src/falcons-eye

INSTALL_MAKE_FLAGS+=	PREFIX=${DESTDIR}${PREFIX}

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/src/fe-config ${DESTDIR}${PREFIX}/bin

.include "../../devel/SDL/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
