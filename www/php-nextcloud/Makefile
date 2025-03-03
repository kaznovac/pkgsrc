# $NetBSD: Makefile,v 1.79 2024/11/11 03:47:28 ryoon Exp $
#

# The nextcloud update process only works from one version to the
# next; one cannot update e.g from 16 to 18.  It is a requirement for
# stable branch users, if they update every stable branch, to have
# automatic updates work.  Therefore a major update can only be
# committed to pkgsrc-current if it is one higher than the major
# version in the previous stable branch.  As an example, if 2020Q1
# contained 18.0.2, then during April to June it is ok to update to
# later 18.x.y, to 19.0.0, and to later 19.x.y, but it is not ok to
# update to 20.
DISTNAME=	nextcloud-30.0.2
PKGNAME=	${PHP_PKG_PREFIX}-${DISTNAME}
CATEGORIES=	www
MASTER_SITES=	https://download.nextcloud.com/server/releases/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	ryoon@NetBSD.org
HOMEPAGE=	https://nextcloud.com/
COMMENT=	File sharing web service server
LICENSE=	gnu-agpl-v3

DEPENDS+=	${PHP_PKG_PREFIX}-gd>=8.0.0:../../graphics/php-gd
DEPENDS+=	${PHP_PKG_PREFIX}-iconv>=8.0.0:../../converters/php-iconv
DEPENDS+=	${PHP_PKG_PREFIX}-mbstring>=8.0.0:../../converters/php-mbstring
DEPENDS+=	${PHP_PKG_PREFIX}-zip>=8.0.0:../../archivers/php-zip
DEPENDS+=	${PHP_PKG_PREFIX}-zlib>=8.0.0:../../archivers/php-zlib
DEPENDS+=	${PHP_PKG_PREFIX}-pdo>=8.0.0:../../databases/php-pdo
DEPENDS+=	${PHP_PKG_PREFIX}-posix>=8.0.0:../../devel/php-posix
DEPENDS+=	${PHP_PKG_PREFIX}-curl>=8.0.0:../../www/php-curl
DEPENDS+=	${PHP_PKG_PREFIX}-intl>=8.0.0:../../textproc/php-intl
DEPENDS+=	${PHP_PKG_PREFIX}-sodium>=8.0.0:../../security/php-sodium
DEPENDS+=	${PHP_PKG_PREFIX}-exif>=8.0.0:../../graphics/php-exif
DEPENDS+=	${PHP_PKG_PREFIX}-sysvsem>=8.0.0:../../devel/php-sysvsem

.include "options.mk"

WRKSRC=		${WRKDIR}/nextcloud
USE_LANGUAGES=	# none

NO_BUILD=	yes

USE_TOOLS+=	bash:run pax perl:run

NC_DIR=		share/nextcloud
INSTALLATION_DIRS=	${NC_DIR}

# Nextcloud "documents" in lib/versioncheck.php that:
#   nextcloud requires at least PHP 8.0
#   nextcloud it not compatible with PHP 8.3 or higher
PHP_VERSIONS_INCOMPATIBLE=	56 74

# for php interpreter
CHECK_INTERPRETER_SKIP+=	${NC_DIR}/3rdparty/doctrine/dbal/bin/doctrine-dbal
CHECK_INTERPRETER_SKIP+=	${NC_DIR}/3rdparty/dompdf/load_font.php
CHECK_INTERPRETER_SKIP+=	${NC_DIR}/3rdparty/phpdocx/pdf/load_font.php
CHECK_INTERPRETER_SKIP+=	${NC_DIR}/3rdparty/sabre/vobject/bin/*
CHECK_INTERPRETER_SKIP+=	${NC_DIR}/apps/contacts/vendor/blueimp-tmpl/js/compile.js
CHECK_INTERPRETER_SKIP+=	${NC_DIR}/occ

.include "../../mk/bsd.prefs.mk"

APACHE_USER?=	nginx
APACHE_GROUP?=	nginx
PKG_GROUPS=	${APACHE_GROUP}
PKG_USERS=	${APACHE_USER}:${APACHE_GROUP}

PKG_USERS_VARS=		APACHE_USER
PKG_GROUPS_VARS=	APACHE_GROUP

BUILD_DEFS+=	APACHE_GROUP APACHE_USER
FILES_SUBST+=	WWWGRP=${APACHE_GROUP} WWWOWN=${APACHE_USER} \
		NC_DIR=${NC_DIR}

do-install:
	cd ${WRKDIR} && ${FIND} nextcloud -type f \! -name '*.orig' -print | \
		pax -rw -pmp ${DESTDIR}${PREFIX}/share

.include "../../lang/php/json.mk"
.include "../../lang/python/application.mk"
.include "../../mk/bsd.pkg.mk"
