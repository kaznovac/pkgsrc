# $NetBSD: Makefile,v 1.38 2024/11/14 22:19:38 wiz Exp $

VERSION=	1.3.0
DISTNAME=	FeatherNotes-V${VERSION}
PKGNAME=	feathernotes-${VERSION}
PKGREVISION=	3
CATEGORIES=	editors
MASTER_SITES=	${MASTER_SITE_GITHUB:=tsujan/}
GITHUB_TAG=	V${PKGVERSION_NOREV}

MAINTAINER=	pin@NetBSD.org
HOMEPAGE=	https://github.com/tsujan/FeatherNotes/
COMMENT=	Lightweight Qt6 hierarchical notes-manager
LICENSE=	gnu-gpl-v3

WRKSRC=		${WRKDIR}/FeatherNotes-${VERSION}
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c c++

CMAKE_CONFIGURE_ARGS+=	-DCMAKE_INSTALL_PREFIX=${PREFIX}

TOOL_DEPENDS+=	qt6-qttools-[0-9]*:../../devel/qt6-qttools
.include "../../x11/qt6-qtbase/buildlink3.mk"
.include "../../graphics/qt6-qtsvg/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../textproc/hunspell/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../devel/cmake/build.mk"
.include "../../mk/bsd.pkg.mk"
