# $NetBSD: Makefile,v 1.62 2024/11/14 22:18:45 wiz Exp $

DISTNAME=	qmmp-1.6.5
PKGREVISION=	12
CATEGORIES=	audio
MASTER_SITES=	https://qmmp.ylsoftware.com/files/qmmp/${PKGVERSION_NOREV:R}/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://qmmp.ylsoftware.com/
COMMENT=	Audio player similar to Winamp/XMMS using Qt5
LICENSE=	gnu-gpl-v2

USE_CMAKE=	yes
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c c++

TOOL_DEPENDS+=	qt5-qttools-[0-9]*:../../x11/qt5-qttools

# using mpg123 instead, it's better maintained
CMAKE_CONFIGURE_ARGS+=	-DUSE_MAD=OFF

# ??? seems to break playing some files
CMAKE_CONFIGURE_ARGS+=	-DUSE_MPLAYER=OFF

CMAKE_CONFIGURE_ARGS+=	-DUSE_PIPEWIRE=OFF

.include "../../mk/oss.buildlink3.mk"

.if ${OSS_TYPE} != "none"
PLIST_VARS+=		oss oss4
.  if ${OPSYS} == "FreeBSD" || ${OPSYS} == "SunOS"
PLIST.oss4=		yes
CMAKE_CONFIGURE_ARGS+=		-DUSE_OSS=OFF
CMAKE_CONFIGURE_ARGS+=		-DUSE_OSS4=ON
.  else
PLIST.oss=		yes
CMAKE_CONFIGURE_ARGS+=		-DUSE_OSS=ON
CMAKE_CONFIGURE_ARGS+=		-DUSE_OSS4=OFF
LDFLAGS+=		${LIBOSSAUDIO}
.  endif
SUBST_CLASSES+=		oss
SUBST_STAGE.oss=	pre-build
SUBST_MESSAGE.oss=	Correcting the path to OSS device.
SUBST_FILES.oss+=	src/plugins/Output/oss/outputoss.cpp
SUBST_FILES.oss+=	src/plugins/Output/oss/settingsdialog.cpp
SUBST_FILES.oss+=	src/plugins/Output/oss4/outputoss4.h
SUBST_SED.oss+=		-e "s,/dev/dsp,${DEVOSSAUDIO},g"
SUBST_VARS.oss+=	LIBOSSAUDIO
.endif

.include "options.mk"
.include "../../audio/faad2/buildlink3.mk"
.include "../../audio/flac/buildlink3.mk"
.include "../../audio/game-music-emu/buildlink3.mk"
.include "../../audio/libopus/buildlink3.mk"
.include "../../audio/libshout/buildlink3.mk"
.include "../../audio/libsndfile/buildlink3.mk"
.include "../../audio/libsoxr/buildlink3.mk"
.include "../../audio/libvorbis/buildlink3.mk"
.include "../../audio/libwildmidi/buildlink3.mk"
.include "../../audio/libxmp/buildlink3.mk"
.include "../../audio/mpg123/buildlink3.mk"
.include "../../audio/opusfile/buildlink3.mk"
.include "../../audio/taglib/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../x11/qt5-qtmultimedia/buildlink3.mk"
.include "../../x11/qt5-qtx11extras/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
