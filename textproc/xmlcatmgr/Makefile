# $NetBSD: Makefile,v 1.40 2024/07/25 05:41:53 wiz Exp $

DISTNAME=	xmlcatmgr-2.2
PKGREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=xmlcatmgr/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://xmlcatmgr.sourceforge.net/
COMMENT=	XML and SGML catalog manager
LICENSE=	modified-bsd

GNU_CONFIGURE=	YES

CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR:Q}

OWN_DIRS=	${PKG_SYSCONFDIR}/sgml ${PKG_SYSCONFDIR}/xml
EGDIR=		${PREFIX}/share/examples/xmlcatmgr
CONF_FILES=	${EGDIR}/catalog.etc.sgml ${PKG_SYSCONFDIR}/sgml/catalog
CONF_FILES+=	${EGDIR}/catalog.etc.xml ${PKG_SYSCONFDIR}/xml/catalog
CONF_FILES+=	${EGDIR}/catalog.share.sgml ${PREFIX}/share/sgml/catalog
CONF_FILES+=	${EGDIR}/catalog.share.xml ${PREFIX}/share/xml/catalog
REQD_DIRS=	${PREFIX}/share/sgml ${PREFIX}/share/xml

INSTALLATION_DIRS+=	share/examples/xmlcatmgr

.include "../../mk/bsd.prefs.mk"

.if ${USE_CROSS_COMPILE:tl} != "yes"
XMLCATMGR=	${WRKSRC}/xmlcatmgr
.else
TOOL_DEPENDS+=	${PKGNAME}:../../${PKGPATH}
XMLCATMGR=	${TOOLBASE}/bin/xmlcatmgr
.endif

post-build:
	@${STEP_MSG} "Creating SGML catalogs..."
	${RUN}${XMLCATMGR} -sc ${WRKDIR}/catalog.etc.sgml create
	${RUN}${XMLCATMGR} -sc ${WRKDIR}/catalog.sgml create
	${RUN}${XMLCATMGR} -sc ${WRKDIR}/catalog.etc.sgml add \
		CATALOG ${PREFIX}/share/sgml/catalog
	@${STEP_MSG} "Creating XML catalogs..."
	${RUN}${XMLCATMGR} -c ${WRKDIR}/catalog.etc.xml create
	${RUN}${XMLCATMGR} -c ${WRKDIR}/catalog.xml create
	${RUN}${XMLCATMGR} -c ${WRKDIR}/catalog.etc.xml add \
		nextCatalog ${PREFIX}/share/xml/catalog

post-install:
	${INSTALL_DATA} ${WRKDIR}/catalog.etc.sgml ${DESTDIR}${EGDIR}/catalog.etc.sgml
	${INSTALL_DATA} ${WRKDIR}/catalog.etc.xml ${DESTDIR}${EGDIR}/catalog.etc.xml
	${INSTALL_DATA} ${WRKDIR}/catalog.sgml ${DESTDIR}${EGDIR}/catalog.share.sgml
	${INSTALL_DATA} ${WRKDIR}/catalog.xml ${DESTDIR}${EGDIR}/catalog.share.xml

.include "../../mk/bsd.pkg.mk"
