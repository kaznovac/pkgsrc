# $NetBSD: Makefile,v 1.23 2024/07/10 08:07:48 nia Exp $
#

DISTNAME=	adtool-1.3.3
PKGREVISION=	3
CATEGORIES=	sysutils
MASTER_SITES=	http://gp2x.org/adtool/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://gp2x.org/adtool/
COMMENT=	Active Directory administration utility for Unix
LICENSE=	gnu-gpl-v2

GNU_CONFIGURE=		yes
USE_LIBTOOL=		yes
USE_PKGLOCALEDIR=	yes
PTHREAD_OPTS+=		require

.include "../../mk/bsd.prefs.mk"
.if ${OPSYS} != "DragonFly"
LIBS+=			-lresolv
.endif

CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR:Q}

EGDIR=			${PREFIX}/share/examples/adtool
CONF_FILES=		${EGDIR}/adtool.cfg.dist ${PKG_SYSCONFDIR}/adtool.cfg
INSTALLATION_DIRS=	${EGDIR}

post-install:
	${MV} ${DESTDIR}${PKG_SYSCONFDIR}/adtool.cfg.dist ${DESTDIR}${EGDIR}

.include "../../databases/openldap-client/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
