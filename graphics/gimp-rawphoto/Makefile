# $NetBSD: Makefile,v 1.86 2025/01/06 21:49:21 ktnb Exp $

DISTNAME=		rawphoto-200410220928
PKGNAME=		gimp-rawphoto-1.19
PKGREVISION=		77
CATEGORIES=		graphics
MASTER_SITES=		#
EXTRACT_SUFX=		.tgz

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://web.archive.org/web/20060207024636/http://ptj.rozeta.com.pl/Soft/RawPhoto
COMMENT=		Digicam RAW file importer for GIMP

WRKSRC=			${WRKDIR}/rawphoto-200410220910/src
BUILD_TARGET=		build
INSTALLATION_DIRS=	lib/gimp/2.0/plug-ins

USE_TOOLS+=		pkg-config

pre-build:
	${LN} -sf ${LOCALBASE}/bin/gimptool-2.0 \
		${BUILDLINK_DIR}/bin/gimptool

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/rawphoto \
		${DESTDIR}${PREFIX}/lib/gimp/2.0/plug-ins

.include "../../graphics/gimp/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
