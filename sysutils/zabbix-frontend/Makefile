# $NetBSD: Makefile,v 1.11 2025/01/13 17:17:18 taca Exp $

PKGREVISION= 3
.include "../../sysutils/zabbix/Makefile.common"

PKGNAME=	${DISTNAME:S/-/-frontend-/}
COMMENT=	Zabbix PHP frontend

PHP_VERSIONS_ACCEPTED=	56

USE_TOOLS+=		pax
NO_BUILD=		yes

do-configure:
	${DO_NADA}

REPLACE_SH+=	frontends/php/locale/*.sh

.include "../../mk/bsd.prefs.mk"

BUILD_DEFS+=		APACHE_GROUP APACHE_USER
PKG_GROUPS_VARS+=	${APACHE_GROUP}
PKG_USERS_VARS=		${APACHE_USER}

DEPENDS+=	${PHP_PKG_PREFIX}-bcmath>=5.4.0:../../math/php-bcmath
DEPENDS+=	${PHP_PKG_PREFIX}-gd>=5.4.0:../../graphics/php-gd
DEPENDS+=	${PHP_PKG_PREFIX}-gettext>=5.4.0:../../devel/php-gettext
DEPENDS+=	${PHP_PKG_PREFIX}-ldap>=5.4.0:../../databases/php-ldap
DEPENDS+=	${PHP_PKG_PREFIX}-mbstring>=5.4.0:../../converters/php-mbstring
DEPENDS+=	${PHP_PKG_PREFIX}-mysqli>=5.4.0:../../databases/php-mysqli
DEPENDS+=	${PHP_PKG_PREFIX}-pgsql>=5.4.0:../../databases/php-pgsql
DEPENDS+=	${PHP_PKG_PREFIX}-sockets>=5.4.0:../../net/php-sockets
DEPENDS+=	${PHP_PKG_PREFIX}-sysvsem>=5.4.0:../../devel/php-sysvsem

INSTALLATION_DIRS+=	share/zabbix/frontend

do-install:
	rm -f ${WRKSRC}/frontends/php/locale/*.orig
	cd ${WRKSRC}/frontends; ${PAX} -rw php ${DESTDIR}${PREFIX}/share/zabbix/

.include "../../lang/php/json.mk"
.include "../../mk/bsd.pkg.mk"
