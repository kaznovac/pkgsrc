# $NetBSD: Makefile,v 1.147 2024/09/18 14:25:50 taca Exp $

DISTNAME=	squirrelmail-webmail-1.4.23pre15028
PKGNAME=	${PHP_PKG_PREFIX}-${DISTNAME:S/-webmail//}
CATEGORIES=	mail www
MASTER_SITES=	${MASTER_SITE_LOCAL}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	taca@NetBSD.org
HOMEPAGE=	http://www.squirrelmail.org/
COMMENT=	PHP webmail package
LICENSE=	gnu-gpl-v2

CONFLICTS=	sq-attachment-handlers-[0-9]*
CONFLICTS+=	sq-squirrelspell-[0-9]*
CONFLICTS+=	ja-squirrelspell-[0-9]*
CONFLICTS+=	ja-squirrelmail-[0-9]*

DEPENDS+=	${PHP_PKG_PREFIX}-gettext>=${PHP_BASE_VERS}:../../devel/php-gettext

USE_LANGUAGES=	# empty
NO_BUILD=	yes
USE_TOOLS+=	pax perl:run
REPLACE_PERL+=	config/conf.pl

PKG_GROUPS_VARS+=	APACHE_GROUP
PKG_USERS_VARS+=	APACHE_USER
BUILD_DEFS+=		VARBASE

.include "../../mk/bsd.prefs.mk"

PKG_SYSCONFSUBDIR?=	httpd
MESSAGE_SUBST+=		PKG_SYSCONFDIR=${PKG_SYSCONFDIR}

ATTACHMENTS_DIR=	${DATADIR}/attachments
USER_PREFS_DIR=		${DATADIR}/data

CONF_FILES=		${SMDIR}/config/config_default.php \
			${SMDIR}/config/config.php
CONF_FILES+=		${SMDIR}/data/default_pref \
			${DATADIR}/data/default_pref
CONF_FILES+=		${EGDIR}/squirrelmail.conf \
			${PKG_SYSCONFDIR}/squirrelmail.conf
CONF_FILES+=		${EGDIR}/data/.htaccess ${DATADIR}/data/.htaccess
CONF_FILES+=		${EGDIR}/data/index.php ${DATADIR}/data/index.php
CONF_FILES+=		${EGDIR}/data/.htaccess ${USER_PREFS_DIR}/.htaccess
CONF_FILES+=		${EGDIR}/data/index.php ${USER_PREFS_DIR}/index.php

REQD_DIRS+=		${SMDIR} ${SMDIR}/config

OWN_DIRS+=		${DATADIR}
OWN_DIRS_PERMS+=	${ATTACHMENTS_DIR} ${REAL_ROOT_USER} ${APACHE_GROUP} 730
OWN_DIRS_PERMS+=	${USER_PREFS_DIR} ${APACHE_USER} ${APACHE_GROUP} 755

SUBST_CLASSES+=		paths
SUBST_FILES.paths=	${WRKDIR}/squirrelmail.conf.dist
SUBST_FILES.paths+=	config/config_default.php
SUBST_VARS.paths=	PREFIX
SUBST_VARS.paths+=	ATTACHMENTS_DIR
SUBST_VARS.paths+=	USER_PREFS_DIR
SUBST_SED.paths+=	-e 's,@SMDIR@,${PREFIX}/${SMDIR},g'
SUBST_STAGE.paths=	pre-configure

DATA_FILES=		.htaccess index.php
INSTALLATION_DIRS=	${PKGMANDIR}/man8 ${EGDIR}/data ${SMDIR}

post-extract:
	${CP} ${FILESDIR}/squirrelmail.conf.dist \
		${WRKDIR}/squirrelmail.conf.dist
	${CP} -p ${WRKSRC}/contrib/conf.pl.8 ${WRKDIR}/squirrelmail-conf.pl.8

pre-install:
	${FIND} ${WRKSRC} \( -name '*.orig*' -o -name '.cvsignore' \) \
		-exec rm -f {} \;
	${FIND} ${WRKSRC} -type d -exec chmod ${PKGDIRMODE} {} \;
	${FIND} ${WRKSRC} -type f -exec chmod ${SHAREMODE} {} \;
	${CHMOD} 0555 ${WRKSRC}/config/conf.pl
	${RM} -f ${WRKSRC}/contrib/conf.pl.8

do-install:
	${INSTALL_DATA} ${WRKDIR}/squirrelmail.conf.dist \
		${DESTDIR}${PREFIX}/${EGDIR}/squirrelmail.conf
.for f in ${DATA_FILES}
	${INSTALL_DATA} ${WRKSRC}/data/${f} ${DESTDIR}${PREFIX}/${EGDIR}/data
.endfor
	cd ${WRKSRC}; pax -rw -pp . ${DESTDIR}${PREFIX}/${SMDIR}
	${INSTALL_DATA} ${WRKDIR}/squirrelmail-conf.pl.8 \
		${DESTDIR}${PREFIX}/${PKGMANDIR}/man8

.include "../../mail/squirrelmail/squirrelmail.mk"
.include "../../lang/php/phpversion.mk"
.include "../../mk/bsd.pkg.mk"
