# $NetBSD: Makefile,v 1.10 2024/04/06 08:05:44 wiz Exp $

DISTNAME=	FNA3D-22.05
PKGNAME=	${DISTNAME:tl}
PKGREVISION=	5
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_GITHUB:=FNA-XNA/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://fna-xna.github.io/
COMMENT=	3D graphics library for FNA
LICENSE=	zlib

USE_CMAKE=	yes

# No upstream install target
INSTALLATION_DIRS=      lib include
do-install:
	${INSTALL_DATA} ${WRKSRC}/include/*.h ${DESTDIR}${PREFIX}/include/
	${INSTALL_DATA} ${WRKSRC}/libFNA3D.so* ${DESTDIR}${PREFIX}/lib/

.include "../../devel/SDL2/buildlink3.mk"
.include "../../graphics/vulkan-headers/buildlink3.mk"
.include "../../graphics/mojoshader/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
