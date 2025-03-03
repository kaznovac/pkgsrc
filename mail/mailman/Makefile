# $NetBSD: Makefile,v 1.100 2024/08/27 16:56:57 gdt Exp $

VERSION_MINOR=	2.1
VERSION_MICRO=	39
VERSION=	${VERSION_MINOR}.${VERSION_MICRO}
DISTNAME=	mailman-${VERSION}
CATEGORIES=	mail www
MASTER_SITES=	https://launchpad.net/mailman/${VERSION_MINOR}/${VERSION}/+download/
EXTRACT_SUFX=	.tgz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.list.org/
COMMENT=	The GNU Mailing List Manager
LICENSE=	gnu-gpl-v2

DEPENDS+=	${PYPKGPREFIX}-dns-[0-9]*:../../net/py-dns1

.include "../../mk/bsd.prefs.mk"

PKG_SYSCONFSUBDIR?=	httpd
MESSAGE_SUBST+=		PKG_SYSCONFDIR=${PKG_SYSCONFDIR}
MESSAGE_SUBST+=		DOCDIR=${DOCDIR}

GNU_CONFIGURE=		yes
GNU_CONFIGURE_PREFIX=	${EXECDIR}

MAKE_FLAGS+=		DIRSETGID=${TRUE:Q}
EXECDIR=		${PREFIX}/lib/mailman
MAILMAN_DATADIR?=	${VARBASE}/db/mailman
EGDIR=			${PREFIX}/share/examples/mailman
DOCDIR=			${PREFIX}/share/doc/mailman
MAILMAN_USER?=		mailman
MAILMAN_GROUP?=		mailman
MAILMAN_CGIGROUP?=	${APACHE_GROUP}
MAILMAN_MAILGROUP?=	daemon	# group sendmail runs under; use 'nobody' for postfix
MAILMAN_CGIEXT?=	.cgi

MESSAGE_SUBST+=		EGDIR=${EGDIR}
MESSAGE_SUBST+=		MAILMAN_USER=${MAILMAN_USER}
PLIST_SUBST+=		PYVERSSUFFIX=${PYVERSSUFFIX:Q}
PLIST_SUBST+=		MAILMAN_CGIEXT=${MAILMAN_CGIEXT:S/none//}

PKG_GROUPS_VARS+=	MAILMAN_GROUP MAILMAN_CGIGROUP MAILMAN_MAILGROUP
PKG_USERS_VARS+=	MAILMAN_USER

PKG_GROUPS=		${MAILMAN_GROUP}
PKG_USERS=		${MAILMAN_USER}:${MAILMAN_GROUP}

PKG_GECOS.${MAILMAN_USER}=	Mailman user
PKG_SHELL.${MAILMAN_USER}=	${SH}

REQD_DIRS_PERMS+=	${EXECDIR} root ${MAILMAN_GROUP} 775
OWN_DIRS_PERMS+=	${MAILMAN_DATADIR} ${MAILMAN_USER} ${MAILMAN_GROUP} 775
MAKE_DIRS_PERMS+=	${MAILMAN_DATADIR}/archives ${MAILMAN_USER} ${MAILMAN_GROUP} 775
MAKE_DIRS_PERMS+=	${MAILMAN_DATADIR}/archives/public ${MAILMAN_USER} ${MAILMAN_GROUP} 775
MAKE_DIRS_PERMS+=	${MAILMAN_DATADIR}/archives/private ${MAILMAN_USER} ${MAILMAN_GROUP} 771
MAKE_DIRS_PERMS+=	${MAILMAN_DATADIR}/data ${MAILMAN_USER} ${MAILMAN_GROUP} 775
MAKE_DIRS_PERMS+=	${MAILMAN_DATADIR}/lists ${MAILMAN_USER} ${MAILMAN_GROUP} 775
MAKE_DIRS_PERMS+=	${MAILMAN_DATADIR}/locks ${MAILMAN_USER} ${MAILMAN_GROUP} 775
MAKE_DIRS_PERMS+=	${MAILMAN_DATADIR}/logs ${MAILMAN_USER} ${MAILMAN_GROUP} 775
MAKE_DIRS_PERMS+=	${MAILMAN_DATADIR}/qfiles ${MAILMAN_USER} ${MAILMAN_GROUP} 775
MAKE_DIRS_PERMS+=	${MAILMAN_DATADIR}/spam ${MAILMAN_USER} ${MAILMAN_GROUP} 775

CONF_FILES+=		${EGDIR}/mailman.conf ${PKG_SYSCONFDIR}/mailman.conf
CONF_FILES+=		${EXECDIR}/Mailman/mm_cfg.py.dist ${EXECDIR}/Mailman/mm_cfg.py

RCD_SCRIPTS=		mailman

INSTALL_TEMPLATES+=	${FILESDIR}/INSTALL
DEINSTALL_TEMPLATES+=	${FILESDIR}/DEINSTALL

PYTHON_VERSIONS_ACCEPTED=	27 # Mailman 2.1.x is stuck in Python 2.7
REPLACE_PYTHON+=		Mailman/Archiver/pipermail.py
REPLACE_PYTHON+=		Mailman/Post.py
REPLACE_PYTHON+=		bin/msgfmt.py

CONFIGURE_ARGS+=	--with-cgi-gid=${MAILMAN_CGIGROUP:Q}
.if ${MAILMAN_CGIEXT} != "none"
CONFIGURE_ARGS+=	--with-cgi-ext=${MAILMAN_CGIEXT:Q}
.endif
CONFIGURE_ARGS+=	--with-groupname=${MAILMAN_GROUP:Q}
CONFIGURE_ARGS+=	--with-mail-gid=${MAILMAN_MAILGROUP:Q}
CONFIGURE_ARGS+=	--with-python=${PYTHONBIN:Q}
CONFIGURE_ARGS+=	--with-username=${MAILMAN_USER:Q}
CONFIGURE_ARGS+=	--with-var-prefix=${MAILMAN_DATADIR:Q}
CONFIGURE_ARGS+=	--without-permcheck

# Put in externally invalid defaults (MESSAGE directs how to fix it)
CONFIGURE_ARGS+=	--with-mailhost=localhost
CONFIGURE_ARGS+=	--with-urlhost=localhost

BUILD_DEFS+=		MAILMAN_DATADIR
BUILD_DEFS+=		MAILMAN_CGIEXT
BUILD_DEFS+=		VARBASE

SUBST_CLASSES+=		paths
SUBST_FILES.paths=	${WRKDIR}/mailman.conf.dist
SUBST_VARS.paths=	EXECDIR
SUBST_VARS.paths+=	MAILMAN_DATADIR
SUBST_STAGE.paths=	pre-configure

DOCFILELIST=	ACKNOWLEDGMENTS BUGS FAQ INSTALL NEWS README \
		README-I18N.en README.CONTRIB README.NETSCAPE \
		README.USERAGENT STYLEGUIDE.txt TODO UPGRADING

# mailman depends a lot on it and will bitch if changed.
CHECK_PERMS=	no

REPLACE_PYTHON+=	cron/senddigests tests/fblast.py tests/onebounce.py

post-extract:
	${CP} ${FILESDIR}/mailman.conf.dist ${WRKDIR}/mailman.conf.dist

post-patch:
	${RM} -f ${WRKSRC}/[A-Z]*.orig

pre-install:
	${INSTALL_PROGRAM_DIR} ${DESTDIR}${EXECDIR}
	${INSTALL_DATA_DIR} ${DESTDIR}${DOCDIR}
	${INSTALL_DATA_DIR} ${DESTDIR}${EXECDIR}/support

post-install:
	${INSTALL_DATA} files/README.pkgsrc ${DESTDIR}${DOCDIR}
	cd ${WRKSRC} && for i in ${DOCFILELIST}; do \
		${INSTALL_DATA} $$i ${DESTDIR}${DOCDIR}/; \
	done
	cd ${WRKSRC}/doc && for i in \
	    mailman-*.ps mailman-*.pdf mailman-*.txt; do \
		${INSTALL_DATA} $$i ${DESTDIR}${DOCDIR}/; \
	done
	${INSTALL_DATA_DIR} ${DESTDIR}${EGDIR}
	${INSTALL_DATA} ${WRKDIR}/mailman.conf.dist ${DESTDIR}${EGDIR}/mailman.conf
	${INSTALL_DATA} ${WRKSRC}/cron/crontab.in ${DESTDIR}${EGDIR}/crontab.in
	${CHMOD} -R g+w ${DESTDIR}${EXECDIR}
	${CHMOD} g+s ${DESTDIR}${EXECDIR}/cgi-bin/*
	${PY_COMPILE_ALL} ${DESTDIR}${PREFIX}/lib/mailman/bin ${DESTDIR}${PREFIX}/lib/mailman/cron ${DESTDIR}${PREFIX}/lib/mailman/scripts

.include "../../lang/python/application.mk"
.include "../../mk/bsd.pkg.mk"
