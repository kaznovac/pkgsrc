# $NetBSD: Makefile,v 1.14 2024/04/06 08:05:17 wiz Exp $

PKGREVISION= 8
.include "Makefile.common"

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/drhelius/Gearboy
COMMENT=	Game Boy / Gameboy Color emulator
LICENSE=	gnu-gpl-v3

UNLIMIT_RESOURCES+=	datasize virtualsize

USE_TOOLS+=	gmake

# Same as platform/linux.
BUILD_DIRS=	platforms/bsd

MAKE_FLAGS+=	CXX=${CXX}
MAKE_FLAGS+=	GIT_VERSION="pkgsrc"

# Uses alloca, cannot use standard C++ on NetBSD.
FORCE_CXX_STD=	gnu++11

.include "../../mk/bsd.prefs.mk"

INSTALLATION_DIRS+=	bin share/applications share/pixmaps

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${BUILD_DIRS}/gearboy \
		${DESTDIR}${PREFIX}/bin
	${INSTALL_DATA} ${FILESDIR}/gearboy.desktop \
		${DESTDIR}${PREFIX}/share/applications
	${INSTALL_DATA} ${WRKSRC}/platforms/ios/Gearboy/Images.xcassets/AppIcon.appiconset/gb_icon_120.png \
		${DESTDIR}${PREFIX}/share/pixmaps/gearboy.png

.include "../../devel/SDL2/buildlink3.mk"
.if ${OPSYS} != "Darwin"
.  include "../../graphics/glew/buildlink3.mk"
.  include "../../graphics/MesaLib/buildlink3.mk"
.endif
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/dlopen.buildlink3.mk"
BUILDLINK_TRANSFORM+=	opt:-ldl:${BUILDLINK_LDADD.dl:Q}
.include "../../mk/bsd.pkg.mk"
