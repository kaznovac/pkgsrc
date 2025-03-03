# $NetBSD: Makefile,v 1.24 2024/07/25 05:41:51 wiz Exp $

PKGNAME=		autoswc-1.6
CATEGORIES=		pkgtools sysutils

MAINTAINER=		pkgsrc-users@NetBSD.org
COMMENT=		Generates system wide cache files for GNU autoconf
LICENSE=		modified-bsd

DEPENDS+=		autoconf>=2.59:../../devel/autoconf
DEPENDS+=		automake>=1.8.2:../../devel/automake
DEPENDS+=		libtool-base>=1.5.2:../../devel/libtool-base

NO_CONFIGURE=		YES
WRKSRC=			${WRKDIR}

PKG_SYSCONFSUBDIR=	autoswc
CACHEDIR=		/var/db/autoswc
MKCONF=			/etc/mk.conf
OWN_DIRS=		${CACHEDIR}

SUBST_CLASSES+=		build
SUBST_MESSAGE.build=	Building autoswc.
SUBST_STAGE.build=	do-build
SUBST_FILES.build=	autoswc
SUBST_FILES.build+=	autoswc.8
SUBST_FILES.build+=	autoswc.mk
SUBST_FILES.build+=	config.site
SUBST_SED.build=	-e 's|@ACLOCAL@|${LOCALBASE}/bin/aclocal|g'
SUBST_SED.build+=	-e 's|@AUTOCONF@|${LOCALBASE}/bin/autoconf|g'
SUBST_SED.build+=	-e 's|@AUTOMAKE@|${LOCALBASE}/bin/automake|g'
SUBST_VARS.build=	CACHEDIR
SUBST_SED.build+=	-e 's|@LIBTOOLIZE@|${LOCALBASE}/bin/libtoolize|g'
SUBST_VARS.build+=	MACHINE_GNU_PLATFORM
SUBST_VARS.build+=	MAKE
SUBST_VARS.build+=	MKCONF
SUBST_VARS.build+=	PREFIX
SUBST_VARS.build+=	SH
SUBST_SED.build+=	-e 's|@SYSCONFDIR@|${PKG_SYSCONFDIR}|g'

INSTALLATION_DIRS=	${PKGMANDIR}/man8 sbin share/autoswc

do-extract:
	${CP} ${FILESDIR}/autoswc.8 ${WRKSRC}
	${CP} ${FILESDIR}/autoswc.mk ${WRKSRC}
	${CP} ${FILESDIR}/autoswc.sh ${WRKSRC}/autoswc
	${CP} ${FILESDIR}/config.site ${WRKSRC}

do-build:
	@${DO_NADA}

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/autoswc ${DESTDIR}${PREFIX}/sbin
	${INSTALL_DATA} ${WRKSRC}/autoswc.8 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man8
	${INSTALL_DATA} ${WRKSRC}/autoswc.mk ${DESTDIR}${PREFIX}/share/autoswc
	${INSTALL_DATA} ${WRKSRC}/config.site ${DESTDIR}${PREFIX}/share/autoswc
	${INSTALL_DATA} ${FILESDIR}/configure.ac ${DESTDIR}${PREFIX}/share/autoswc

.include "../../mk/bsd.pkg.mk"
