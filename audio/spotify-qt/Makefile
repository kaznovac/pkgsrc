# $NetBSD: Makefile,v 1.33 2024/12/12 07:30:26 pin Exp $

DISTNAME=	spotify-qt-3.12
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_GITHUB:=kraxarn/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	pin@NetBSD.org
HOMEPAGE=	https://github.com/kraxarn/spotify-qt/
COMMENT=	Lightweight Spotify client using Qt
LICENSE=	gnu-gpl-v3

USE_LANGUAGES=	c c++

CMAKE_CONFIGURE_ARGS+=	-DCMAKE_BUILD_TYPE=Release
CMAKE_CONFIGURE_ARGS+=	-DCMAKE_INSTALL_PREFIX=${PREFIX}

DEPENDS+=	librespot-[0-9]*:../../audio/librespot

.include "options.mk"

.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../devel/cmake/build.mk"
.include "../../mk/bsd.pkg.mk"
