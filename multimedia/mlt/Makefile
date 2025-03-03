# $NetBSD: Makefile,v 1.146 2024/12/27 08:20:24 wiz Exp $

DISTNAME=	mlt-7.18.0
PKGREVISION=	16
CATEGORIES=	multimedia
MASTER_SITES=	${MASTER_SITE_GITHUB:=mltframework/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.mltframework.org/
COMMENT=	Open source multimedia framework
LICENSE=	gnu-gpl-v2

USE_TOOLS+=	pkg-config gmake
USE_LANGUAGES=	c c++

CFLAGS.NetBSD+=		-DHAVE_LOCALE_H -DHAVE_STRTOD_L -D__SETLOCALE_SOURCE__

SUBST_CLASSES+=		frei0r
SUBST_STAGE.frei0r=	pre-configure
SUBST_FILES.frei0r=	src/modules/frei0r/factory.c
SUBST_SED.frei0r=	-e 's^/usr/lib/frei0r-1.*:^${BUILDLINK_PREFIX.frei0r}/lib/frei0r-1:^'

PKGCONFIG_OVERRIDE+=	mlt++.pc.in
PKGCONFIG_OVERRIDE+=	mlt-framework.pc.in

.include "../../devel/cmake/build.mk"
.include "../../audio/alsa-lib/buildlink3.mk"
.include "../../audio/jack/buildlink3.mk"
.include "../../audio/ladspa/buildlink3.mk"
.include "../../audio/libebur128/buildlink3.mk"
.include "../../audio/libsamplerate/buildlink3.mk"
.include "../../audio/sox/buildlink3.mk"
.include "../../mk/bsd.prefs.mk"
.if !empty(PKGSRC_COMPILER:M*gcc*)
.  include "../../devel/libatomic/buildlink3.mk"
.endif
.include "../../devel/SDL2/buildlink3.mk"
.include "../../devel/pango/buildlink3.mk"
.include "../../graphics/gdk-pixbuf2/buildlink3.mk"
.include "../../graphics/libexif/buildlink3.mk"
.include "../../multimedia/ffmpeg5/buildlink3.mk"
.include "../../multimedia/frei0r/buildlink3.mk"
.include "../../multimedia/libdv/buildlink3.mk"
.include "../../multimedia/movit/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../x11/qt5-qtsvg/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
