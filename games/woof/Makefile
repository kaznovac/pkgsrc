# $NetBSD: Makefile,v 1.51 2024/08/25 06:18:47 wiz Exp $

DISTNAME=	woof_14.3.0
PKGNAME=	${DISTNAME:S/_/-/}
CATEGORIES=	games
MASTER_SITES=	${MASTER_SITE_GITHUB:=fabiangreffrath/}
GITHUB_TAG=	${DISTNAME}
EXTRACT_USING=	bsdtar

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/fabiangreffrath/woof/
COMMENT=	Continuation of Lee Killough's Doom source port MBF
LICENSE=	gnu-gpl-v2

USE_CC_FEATURES=	c99

USE_CMAKE=	yes
USE_TOOLS+=	pkg-config
CMAKE_CONFIGURE_ARGS+=	-G "Unix Makefiles" ..
CONFIGURE_DIRS=	build
WRKSRC=		${WRKDIR}/woof-${DISTNAME}

# DOOMWADDIR is intentionally shared with other Doom packages
DOOMWADDIR=	share/doom

# Add DOOMWADDIR to search path
SUBST_CLASSES+=		waddir
SUBST_STAGE.waddir=	pre-configure
SUBST_MESSAGE.waddir=	Preparing src/d_iwad.c file ...
SUBST_FILES.waddir=	src/d_iwad.c
SUBST_SED.waddir=	-e 's,PKGSRC_PREFIX,"${PREFIX}",'
SUBST_SED.waddir+=	-e 's,PKGSRC_DOOMWADDIR,"/${DOOMWADDIR}",'

# Process INSTALL.pkgsrc
SUBST_CLASSES+=		install
SUBST_STAGE.install=	do-configure
SUBST_MESSAGE.install=	Preparing INSTALL.pkgsrc file ...
SUBST_FILES.install=	${WRKDIR}/INSTALL.pkgsrc
SUBST_SED.install=	-e 's,DOOMWADDIR,${PREFIX}/${DOOMWADDIR},'

pre-configure:
	cd ${WRKSRC}; mkdir build
	${CP} ${FILESDIR}/INSTALL.pkgsrc ${WRKDIR}

post-install:
	${INSTALL_DATA} ${WRKDIR}/INSTALL.pkgsrc \
		${DESTDIR}${PREFIX}/share/doc/woof/INSTALL.pkgsrc
	${MV} ${DESTDIR}${PREFIX}/share/applications/io.github.fabiangreffrath.woof-setup.desktop \
		${DESTDIR}${PREFIX}/share/applications/woof-setup.desktop
	${MV} ${DESTDIR}${PREFIX}/share/applications/io.github.fabiangreffrath.woof.desktop \
		${DESTDIR}${PREFIX}/share/applications/woof.desktop
	${MV} ${DESTDIR}${PREFIX}/share/metainfo/io.github.fabiangreffrath.woof.metainfo.xml \
		${DESTDIR}${PREFIX}/share/metainfo/woof.metainfo.xml

BUILDLINK_API_DEPENDS.fluidsynth+=	fluidsynth>=2.2.0
.include "../../audio/fluidsynth/buildlink3.mk"
BUILDLINK_API_DEPENDS.libsndfile+=	libsndfile>=1.1.0
.include "../../audio/libsndfile/buildlink3.mk"
.include "../../audio/libxmp/buildlink3.mk"
.include "../../audio/openal-soft/buildlink3.mk"
BUILDLINK_API_DEPENDS.SDL2+=		SDL2>=2.0.18
.include "../../devel/SDL2/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../net/SDL2_net/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"

.include "../../mk/bsd.pkg.mk"
