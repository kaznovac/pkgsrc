# $NetBSD: Makefile,v 1.88 2024/11/14 22:18:45 wiz Exp $

DISTNAME=	qsynth-0.6.3
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=qsynth/}
PKGREVISION=	23
CATEGORIES=	audio

MAINTAINER=	adam@NetBSD.org
HOMEPAGE=	https://qsynth.sourceforge.io/qsynth-index.html
COMMENT=	Qt GUI Interface to FluidSynth
LICENSE=	gnu-gpl-v2

TOOL_DEPENDS+=	qt5-qttools-[0-9]*:../../x11/qt5-qttools

USE_CMAKE=	yes
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c c++

LDFLAGS.SunOS+=	-lsocket

.include "../../audio/fluidsynth/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
