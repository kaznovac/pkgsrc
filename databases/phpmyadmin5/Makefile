# $NetBSD: Makefile,v 1.4 2024/04/17 10:38:33 wiz Exp $

DISTNAME=	phpMyAdmin-5.1.3-all-languages
PKGNAME=	${PHP_PKG_PREFIX}-${DISTNAME:S/-all-languages//:tl}
CATEGORIES=	databases www
MASTER_SITES=	https://files.phpmyadmin.net/phpMyAdmin/${PKGVERSION_NOREV}/
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	tm@NetBSD.org
HOMEPAGE=	https://www.phpmyadmin.net/
COMMENT=	Set of PHP-scripts to adminstrate MySQL over the WWW
LICENSE=	gnu-gpl-v2

# Required
DEPENDS+=	${PHP_PKG_PREFIX}-iconv>=7.2.5:../../converters/php-iconv
DEPENDS+=	${PHP_PKG_PREFIX}-mysqli>=7.2.5:../../databases/php-mysqli

# Suggest
DEPENDS+=	${PHP_PKG_PREFIX}-zlib>=7.2.5:../../archivers/php-zlib
DEPENDS+=	${PHP_PKG_PREFIX}-bz2>=7.2.5:../../archivers/php-bz2
DEPENDS+=	${PHP_PKG_PREFIX}-zip>=7.2.5:../../archivers/php-zip
DEPENDS+=	${PHP_PKG_PREFIX}-mbstring>=7.2.5:../../converters/php-mbstring
DEPENDS+=	${PHP_PKG_PREFIX}-gettext>=7.2.5:../../devel/php-gettext
DEPENDS+=	${PHP_PKG_PREFIX}-gd>=7.2.5:../../graphics/php-gd

PHP_VERSIONS_INCOMPATIBLE=	56

.include "../../lang/php/phpversion.mk"

USE_LANGUAGES=	# none
USE_TOOLS+=	pax

APACHE_USER?=	www
APACHE_GROUP?=	www

PKG_GROUPS=	${APACHE_GROUP}
PKG_USERS=	${APACHE_USER}:${APACHE_GROUP}
BUILD_DEFS+=	APACHE_USER APACHE_GROUP VARBASE

PKG_USERS_VARS=		APACHE_USER
PKG_GROUPS_VARS=	APACHE_GROUP

PKG_SYSCONFSUBDIR=	phpmyadmin

FILES_SUBST+=	APACHE_GROUP=${APACHE_GROUP} APACHE_USER=${APACHE_USER}
FILES_SUBST+=	PMCONFDIR=${PMCONFDIR} PMVARDIR=${PMVARDIR}
MESSAGE_SUBST+=	PMCONFDIR=${PMCONFDIR} PMCONFFILE=${PMCONFFILE}

DOC_FILES=	ChangeLog CONTRIBUTING.md LICENSE \
		README RELEASE-DATE-${PKGVERSION_NOREV}

EXDIR=		${PREFIX}/share/examples/phpmyadmin
PMCONFDIR=	${PKG_SYSCONFDIR}
PMCONFFILE=	${PKG_SYSCONFDIR}/config.inc.php
PMDIR=		${PREFIX}/share/phpmyadmin
PMVARDIR=	${VARBASE}/phpmyadmin

CONF_FILES+=	${EXDIR}/apache.conf ${PKG_SYSCONFDIR}/apache.conf

SRCS=		*.css *.ico *.php *.txt doc js libraries locale setup \
		sql templates themes vendor

NO_BUILD=		yes

SUBST_CLASSES+=		paths
SUBST_FILES.paths+=	${WRKDIR}/phpmyadmin.conf
SUBST_FILES.paths+=	libraries/vendor_config.php
SUBST_VARS.paths=	PMDIR
SUBST_VARS.paths+=	PMVARDIR
SUBST_SED.paths+=	-e "s|@PMCONFDIR@|${PMCONFDIR}/|g"
SUBST_STAGE.paths=	post-configure

INSTALLATION_DIRS+=	${PREFIX}/share/doc/phpmyadmin \
			${PREFIX}/share/examples/phpmyadmin

post-extract:
	${CP} ${FILESDIR}/phpmyadmin.conf ${WRKDIR}

do-install:
	${RM} -f ${WRKSRC}/libraries/vendor_config.php.orig
	cd ${WRKSRC} && pax -rw ${SRCS} ${DESTDIR}${PMDIR}
	${INSTALL_DATA} ${WRKSRC}/config.sample.inc.php ${DESTDIR}${EXDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/* ${DESTDIR}${EXDIR}
	${LN} -fs ${EXDIR} ${DESTDIR}${PMDIR}/examples
	cd ${WRKSRC} && \
		${INSTALL_DATA} ${DOC_FILES} \
			${DESTDIR}${PREFIX}/share/doc/phpmyadmin
	${INSTALL_DATA} ${WRKDIR}/phpmyadmin.conf ${DESTDIR}${EXDIR}/apache.conf

.include "../../lang/php/json.mk"
.include "../../mk/bsd.pkg.mk"
