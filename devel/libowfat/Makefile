# $NetBSD: Makefile,v 1.14 2024/12/08 23:08:15 hgutch Exp $

DISTNAME=	libowfat-0.34
PKGREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	${HOMEPAGE}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	schmonz@NetBSD.org
HOMEPAGE=	https://www.fefe.de/libowfat/
COMMENT=	Library of general purpose APIs
LICENSE=	gnu-gpl-v2

MAKE_FILE=	GNUmakefile
MAKE_JOBS_SAFE=	no
USE_TOOLS+=	gmake

post-extract:
	cd ${WRKSRC}; \
	${MV} tai/tai_now.3 tai/tai_now_libowfat.3; \
	${MV} tai/tai_pack.3 tai/tai_pack_libowfat.3; \
	${MV} taia/taia_now.3 taia/taia_now_libowfat.3; \
	${MV} taia/taia_pack.3 taia/taia_pack_libowfat.3

.include "../../mk/bsd.pkg.mk"
