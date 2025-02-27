# $NetBSD: Makefile,v 1.113 2024/11/11 08:18:04 wiz Exp $

# Important: UI has to be manually built when updating. See instructions below.

DISTNAME=	prometheus-2.55.1
MASTER_SITES=	${MASTER_SITE_GITHUB:=prometheus/}
CATEGORIES=	databases
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://prometheus.io/
COMMENT=	The Prometheus monitoring system and time series database
LICENSE=	apache-2.0

# How to rebuild UI after bumping version:
# 1. install lang/nodejs (for the npm binary)
# 2. comment out the DISTFILES=... line
# 3. run "make distinfo extract update-ui"
# 4. publish the resulting distfile on MASTER_SITE_LOCAL
# 5. uncomment the DISTFILES=... line and regen distinfo
.PHONY: update-ui
update-ui:
	cd ${WRKSRC}/web/ui &&							\
	npm install &&								\
	npm run build &&							\
	${CHMOD} -x static/react/favicon.ico static/react/manifest.json &&	\
	cd ../../.. &&								\
	${TOOLS_PLATFORM.tar} -czf ${REACT_UI_DIST} ${DISTNAME}/web/ui/static/react &&		\
	${CP} ${REACT_UI_DIST} ${DISTDIR}/${REACT_UI_DIST} &&			\
	${ECHO} "UI built. Run this command:" &&				\
	${ECHO} "# scp ${DISTDIR}/${REACT_UI_DIST} ftp.netbsd.org:/pub/pkgsrc/distfiles/LOCAL_PORTS/."

REACT_UI_DIST=		${DISTNAME}-react-ui.tar.gz
SITES.${REACT_UI_DIST}=	${MASTER_SITE_LOCAL}
# comment out this when running make update-ui
DISTFILES=		${DEFAULT_DISTFILES} ${REACT_UI_DIST}
# go modules only extracts some files, but we need the react GUI extracted for installation
GO_MODULE_EXTRACT=	${REACT_UI_DIST}

.include "go-modules.mk"

GO_DIST_BASE=	${DISTNAME}
GO_SRCPATH=	github.com/prometheus/prometheus

GO_BUILD_DATE_cmd=	${DATE} "+%Y-%m-%d"
GO_XFLAG_PREFIX=	-X github.com/prometheus/common/version

GO_LDFLAGS=	-s
GO_LDFLAGS+=	${GO_XFLAG_PREFIX}.Branch=release-${PKGVERSION_NOREV:R}
GO_LDFLAGS+=	${GO_XFLAG_PREFIX}.BuildDate=${GO_BUILD_DATE_cmd:sh}
GO_LDFLAGS+=	${GO_XFLAG_PREFIX}.BuildUser=pkgsrc
GO_LDFLAGS+=	${GO_XFLAG_PREFIX}.Revision=${GITHUB_TAG}
GO_LDFLAGS+=	${GO_XFLAG_PREFIX}.Version=${PKGVERSION_NOREV}

PKG_SYSCONFSUBDIR=	prometheus

USE_TOOLS+=	pax
BUILD_DEFS+=	VARBASE PKG_SYSCONFDIR

SUBST_CLASSES+=		paths
SUBST_FILES.paths+=	cmd/prometheus/main.go
SUBST_STAGE.paths=	post-configure
SUBST_VARS.paths=	PKG_SYSCONFDIR VARBASE

SUBST_CLASSES+=		webui
SUBST_FILES.webui=	web/ui/ui.go
SUBST_STAGE.webui=	post-configure
SUBST_VARS.webui=	WEBUI_DIR

MAKE_DIRS+=	${PKG_SYSCONFDIR}/consoles ${PKG_SYSCONFDIR}/console_libraries
EXAMPLE_DIR=	share/examples/prometheus
EXAMPLE_FILES=	prometheus.yml
EXAMPLE_FILES+=	consoles/index.html.example consoles/node-cpu.html \
		consoles/node-disk.html consoles/node-overview.html \
		consoles/node.html consoles/prometheus-overview.html \
		consoles/prometheus.html
EXAMPLE_FILES+=	console_libraries/menu.lib console_libraries/prom.lib
WEBUI_DIR=	${PREFIX}/share/prometheus

DATADIR=	${VARBASE}/lib/prometheus
LOGDIR=		${VARBASE}/log/prometheus

BUILD_DEFS+=		PROMETHEUS_USER PROMETHEUS_GROUP
FILES_SUBST+=		PROMETHEUS_USER=${PROMETHEUS_USER:Q}
FILES_SUBST+=		PROMETHEUS_GROUP=${PROMETHEUS_GROUP:Q}
FILES_SUBST+=		DATADIR=${DATADIR:Q}
FILES_SUBST+=		LOGDIR=${LOGDIR:Q}

PROMETHEUS_USER?=	prometheus
PROMETHEUS_GROUP?=	prometheus
OWN_DIRS_PERMS+=	${DATADIR} ${PROMETHEUS_USER} ${PROMETHEUS_GROUP} 0700
OWN_DIRS_PERMS+=	${LOGDIR} ${PROMETHEUS_USER} ${PROMETHEUS_GROUP} 0700
PKG_USERS_VARS+=	PROMETHEUS_USER
PKG_GROUPS_VARS+=	PROMETHEUS_GROUP
PKG_GROUPS=		${PROMETHEUS_GROUP}
PKG_USERS=		${PROMETHEUS_USER}:${PROMETHEUS_GROUP}
RCD_SCRIPTS=		prometheus

INSTALLATION_DIRS+=	${EXAMPLE_DIR} ${WEBUI_DIR}

.for f in ${EXAMPLE_FILES}
CONF_FILES+=	${EXAMPLE_DIR}/${f} ${PKG_SYSCONFDIR}/${f}
.endfor

do-build:
.for f in prometheus promtool
	${RUN} cd ${WRKSRC} && ${_ULIMIT_CMD} ${PKGSRC_SETENV} ${MAKE_ENV} \
		${GO} install -v -ldflags ${GO_LDFLAGS:Q} ./cmd/${f}/...
.endfor

post-install:
	${INSTALL_DATA} ${WRKSRC}/documentation/examples/prometheus.yml \
		${DESTDIR}${PREFIX}/${EXAMPLE_DIR}
.for f in consoles console_libraries
	cd ${WRKSRC} && ${PAX} -rw ${f} ${DESTDIR}${PREFIX}/${EXAMPLE_DIR}
.endfor
	cd ${WRKSRC}/web/ui && ${PAX} -rw static ${DESTDIR}${WEBUI_DIR}
	${CHMOD} -R g-w ${DESTDIR}${WEBUI_DIR}/static
.for f in ${EXAMPLE_FILES}
	${CHMOD} ${NONBINMODE} ${DESTDIR}${PREFIX}/${EXAMPLE_DIR}/${f}
.endfor

.include "../../lang/go/go-module.mk"
.include "../../mk/bsd.pkg.mk"
