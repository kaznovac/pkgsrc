# $NetBSD: Makefile,v 1.69 2024/11/14 22:22:09 wiz Exp $

DISTNAME=	otter-browser-1.0.03
PKGREVISION=	17
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=OtterBrowser/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://otter-browser.org/
COMMENT=	Project aiming to recreate classic Opera (12.x) UI using Qt5
LICENSE=	gnu-gpl-v3

USE_LANGUAGES=	c c++

CMAKE_CONFIGURE_ARGS+=	-DENABLE_QTWEBENGINE=ON
CMAKE_CONFIGURE_ARGS+=	-DENABLE_QTWEBKIT=OFF

NOT_PAX_MPROTECT_SAFE+=	bin/otter-browser

SUBST_CLASSES+=			fix-paths
SUBST_STAGE.fix-paths=		pre-configure
SUBST_MESSAGE.fix-paths=	Fixing (some) absolute paths to hunspell dictionaries.
SUBST_FILES.fix-paths=		3rdparty/sonnet/src/plugins/hunspell/hunspellclient.cpp
SUBST_SED.fix-paths=		-e 's,"/usr/local,"${PREFIX},g'

.include "../../devel/cmake/build.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../textproc/hunspell/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../x11/qt5-qtlocation/buildlink3.mk"
.include "../../x11/qt5-qtmultimedia/buildlink3.mk"
.include "../../x11/qt5-qtwebchannel/buildlink3.mk"
.include "../../x11/qt5-qtwebengine/buildlink3.mk"
.include "../../x11/qt5-qtsvg/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
