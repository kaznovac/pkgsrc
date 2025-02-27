# $NetBSD: Makefile,v 1.51 2024/08/25 06:18:31 wiz Exp $

DISTNAME=	allegro-4.4.3.1
PKGREVISION=	7
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=liballeg/}
GITHUB_PROJECT=	allegro5
GITHUB_RELEASE=	${PKGVERSION_NOREV}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://liballeg.org/
COMMENT=	Cross-platform library aimed at video game programming (4.x branch)
#LICENSE=	# TODO: (see mk/license.mk)

USE_CMAKE=	yes
USE_TOOLS+=	pkg-config makeinfo
USE_LANGUAGES=	c c++

INFO_FILES=	yes
CMAKE_CONFIGURE_ARGS+=	-DINFODIR=${PKGINFODIR:Q}

PLIST_SUBST+=	ALLEG_VER=${PKGVERSION_NOREV:R}

.include "../../mk/oss.buildlink3.mk"

.if ${OSS_TYPE} != "none"
SUBST_CLASSES+=		oss
SUBST_STAGE.oss=	pre-configure
SUBST_MESSAGE.oss=	Correcting the path to the OSS device.
SUBST_FILES.oss+=	src/unix/uoss.c
SUBST_SED.oss+=		-e "s,/dev/dsp,${DEVOSSAUDIO},g"
.endif

SUBST_CLASSES.NetBSD+=	ossmidi
SUBST_CLASSES.SunOS+=	ossmidi
SUBST_STAGE.ossmidi=	pre-configure
SUBST_MESSAGE.ossmidi=	OS does not have full OSS MIDI support.
SUBST_FILES.ossmidi=	CMakeLists.txt
SUBST_SED.ossmidi=	-e 's/ALLEGRO_WITH_OSSMIDI 1/ALLEGRO_WITH_OSSMIDI 0/'

PKGCONFIG_OVERRIDE+=	misc/logg.pc.in
PKGCONFIG_OVERRIDE+=	misc/loadpng.pc.in
PKGCONFIG_OVERRIDE+=	misc/allegrogl.pc.in
PKGCONFIG_OVERRIDE+=	misc/jpgalleg.pc.in
PKGCONFIG_OVERRIDE+=	misc/allegro.pc.in

INSTALLATION_DIRS=	share/aclocal

post-install:
	${INSTALL_DATA} ${WRKSRC}/misc/allegro.m4 ${DESTDIR}${PREFIX}/share/aclocal

.include "options.mk"
.include "../../audio/libvorbis/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../graphics/glu/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../multimedia/libogg/buildlink3.mk"
.include "../../x11/libICE/buildlink3.mk"
.include "../../x11/libSM/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXcursor/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXpm/buildlink3.mk"
.include "../../x11/libXxf86dga/buildlink3.mk"
.include "../../x11/libXxf86vm/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
