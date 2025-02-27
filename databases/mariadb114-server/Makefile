# $NetBSD: Makefile,v 1.8 2024/12/29 15:09:43 adam Exp $

PKGNAME=	${DISTNAME:S/-/-server-/}
PKGREVISION=	1
COMMENT=	MariaDB 11.4, a free MySQL compatible database (server)

CONFLICTS=	mysql-server-[0-9]*

.include "../../databases/mariadb114-client/Makefile.common"

BUILD_DEFS+=		VARBASE
PLIST_VARS+=		disks

.include "../../mk/bsd.fast.prefs.mk"

# Requires getmntinfo
.if ${OPSYS} != "SunOS"
PLIST.disks=		yes
.endif

MARIADB_USER?=		${MYSQL_USER:Umariadb}
MARIADB_GROUP?=		${MYSQL_GROUP:Umariadb}

PKG_USERS_VARS+=	MARIADB_USER
PKG_GROUPS_VARS+=	MARIADB_GROUP

PKG_GROUPS=		${MARIADB_GROUP}
PKG_USERS=		${MARIADB_USER}:${MARIADB_GROUP}

PKG_GECOS.${MARIADB_USER}=	MariaDB administrator
PKG_HOME.${MARIADB_USER}=	${MARIADB_DATADIR}
PKG_SHELL.${MARIADB_USER}=	${SH}

RCD_SCRIPTS=		mariadb
SMF_NAME=		mariadb
SMF_METHODS=		${RCD_SCRIPTS}

CMAKE_CONFIGURE_ARGS+=		-DCONNECT_WITH_MONGO=NO
CMAKE_CONFIGURE_ARGS+=		-DHAVE_LIBCRACK=OFF
CMAKE_CONFIGURE_ARGS+=		-DWITH_SYSTEMD=no

FILES_SUBST+=		HOSTNAME_CMD=${HOSTNAME_CMD:Q}
FILES_SUBST+=		MARIADB_DATADIR=${MARIADB_DATADIR}
FILES_SUBST+=		MARIADB_USER=${MARIADB_USER} MARIADB_GROUP=${MARIADB_GROUP}
BUILD_DEFS+=		MARIADB_DATADIR

OWN_DIRS_PERMS+=	${MARIADB_DATADIR} ${MARIADB_USER} ${MARIADB_GROUP} 0700
OWN_DIRS_PERMS+=	${VARBASE}/log/mariadb ${MARIADB_USER} ${MARIADB_GROUP} 0700

USE_TOOLS+=		bash:run perl:run
REPLACE_BASH+=		scripts/wsrep_sst_*.sh
REPLACE_BASH+=		scripts/mariadb-service-convert

.include "options.mk"
.include "../../databases/mariadb114-client/buildlink3.mk"
.include "../../devel/libexecinfo/buildlink3.mk"
.include "../../security/tcp_wrappers/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
