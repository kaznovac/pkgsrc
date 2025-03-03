# $NetBSD: Makefile,v 1.18 2025/01/07 13:55:08 sborrill Exp $

VERSION=	6.12
DISTNAME=	squid-${VERSION}

CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=squid-cache/}squid/releases/download/SQUID_${VERSION:S/./_/g}/
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.squid-cache.org/
COMMENT=	Post-Harvest_cached WWW proxy cache and accelerator
LICENSE=	gnu-gpl-v2

# GCC 7 fails even with c++17
# src/ipc/TypedMsgHdr.h fails with
# static_assert(std::is_trivially_copyable<Pod>::value, "getPod() used for a POD")
USE_CXX_FEATURES+=	c++17
USE_LANGUAGES+=		c c++
GCC_REQD+=		10

USE_TOOLS+=		perl:run gmake
GNU_CONFIGURE=		yes
GNU_CONFIGURE_STRICT=	no # has sub-configure in libltdl
CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR}
CONFIGURE_ARGS+=	--localstatedir=${SQUID_DATADIR}
CONFIGURE_ARGS+=	--datarootdir=${PREFIX}/share/squid
CONFIGURE_ARGS+=	--disable-arch-native
CONFIGURE_ARGS+=	--enable-cachemgr-hostname=localhost
CONFIGURE_ARGS+=	--enable-delay-pools
CONFIGURE_ARGS+=	--enable-icap-client
CONFIGURE_ARGS+=	--enable-icmp
CONFIGURE_ARGS+=	--enable-poll
CONFIGURE_ARGS+=	--enable-removal-policies=lru,heap
CONFIGURE_ARGS+=	--enable-storeio=${SQUID_BACKENDS:Q}
CONFIGURE_ARGS+=	--enable-translation
CONFIGURE_ARGS+=	--with-aio
CONFIGURE_ARGS+=	--with-default-user=${SQUID_USER}
CONFIGURE_ARGS+=	--with-pidfile=${VARBASE}/run/squid.pid

BUILD_DEFS=		VARBASE

# Let 'purge' find correct config file by default.
CPPFLAGS+=		-DDEFAULT_SQUID_CONF=\"${PKG_SYSCONFDIR}/squid.conf\"

BUILDLINK_TRANSFORM+=	rm:-Werror

MAKE_ENV+=		INSTALL_SCRIPT=${INSTALL_SCRIPT:Q}
MAKE_ENV+=		PKG_PREFIX=${PREFIX} VARBASE=${VARBASE}
REPLACE_PERL+=		contrib/url-normalizer.pl contrib/user-agents.pl \
			scripts/AnnounceCache.pl scripts/access-log-matrix.pl \
			scripts/cache-compare.pl scripts/cachetrace.pl \
			scripts/calc-must-ids.pl scripts/check_cache.pl \
			scripts/fileno-to-pathname.pl scripts/find-alive.pl \
			scripts/flag_truncs.pl scripts/icp-test.pl \
			scripts/icpserver.pl scripts/tcp-banger.pl \
			scripts/trace-job.pl scripts/trace-master.pl \
			scripts/udp-banger.pl scripts/upgrade-1.0-store.pl \
			tools/helper-ok-dying.pl tools/helper-ok.pl
EGFILES=		src/mime.conf.default src/squid.conf.default \
			errors/errorpage.css tools/cachemgr.conf
EGDIR=			share/examples/squid
.for f in cachemgr.conf errorpage.css mime.conf squid.conf
CONF_FILES+=		${PREFIX}/${EGDIR}/${f} ${PKG_SYSCONFDIR}/${f}
.endfor
OWN_DIRS=		${SQUID_DATADIR}
OWN_DIRS_PERMS+=	${SQUID_DATADIR}/cache ${SQUID_USER} ${SQUID_GROUP} 0750 \
			${SQUID_DATADIR}/logs ${SQUID_USER} ${SQUID_GROUP} 0750

.include "Makefile.common"
.include "options.mk"

# Incorrect check for <netinet/ip_icmp.h> on FreeBSD:
CONFIGURE_ENV.FreeBSD+=	ac_cv_header_netinet_ip_icmp_h=yes

INSTALLATION_DIRS=	${EGDIR}

SPECIAL_PERMS+=		libexec/pinger ${SETUID_ROOT_PERMS}

RCD_SCRIPTS=		squid
RCD_SCRIPT_SRC.squid=	files/squid.sh
SMF_NAME=		squid

SUBST_CLASSES+=		confs
SUBST_STAGE.confs=	pre-configure
SUBST_FILES.confs=	src/cf.data.pre
SUBST_SED.confs=	-e "s/@DEFAULT_CACHE_EFFECTIVE_USER@/${SQUID_USER}/"
SUBST_MESSAGE.confs=	Fixing configuration files.

post-build:
	cd ${WRKSRC}/src && ${CP} -pf squid.conf.documented squid.conf.default

post-install:
.for f in ${EGFILES}
	${INSTALL_DATA}	${WRKSRC}/${f} \
		${DESTDIR}${PREFIX}/${EGDIR}/`basename ${f} .default`
.endfor

.include "../../devel/libltdl/buildlink3.mk"
.include "../../mk/atomic64.mk"
.include "../../mk/bsd.pkg.mk"
