# $NetBSD: Makefile,v 1.33 2024/12/27 08:21:00 wiz Exp $

DISTNAME=	lxterminal-0.4.0
PKGREVISION=	12
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=lxde/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	youri@NetBSD.org
HOMEPAGE=	https://www.lxde.org/
COMMENT=	Desktop-independent VTE-based terminal emulator with tabs
LICENSE=	gnu-gpl-v2

GNU_CONFIGURE=	yes
USE_TOOLS+=	gmake intltool pkg-config msgfmt

LDFLAGS.SunOS+=	-lsocket

.include "options.mk"

.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/bsd.pkg.mk"
