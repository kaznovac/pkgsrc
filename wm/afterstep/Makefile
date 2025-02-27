# $NetBSD: Makefile,v 1.110 2024/12/27 08:20:45 wiz Exp $

DISTNAME=	AfterStep-2.2.12
PKGNAME=	${DISTNAME:S/AfterStep/afterstep/}
PKGREVISION=	11
CATEGORIES=	wm
MASTER_SITES=	ftp://ftp.afterstep.org/stable/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.afterstep.org/
COMMENT=	Window manager based on the look and feel of the NeXTStep interface
LICENSE=	mit

MAKE_JOBS_SAFE=	no

WRKSRC=		${WRKDIR}/afterstep-devel-${PKGVERSION_NOREV}

USE_TOOLS+=		bash:run gmake perl:run pkg-config
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--disable-send-postcard-to-developer
REPLACE_PERL+=		tools/ascommand.pl tools/installastheme.pl.in tools/makeastheme.pl.in
REPLACE_BASH+=		tools/importasmenu

INSTALLATION_DIRS+=	share/gnome/wm-properties

.include "../../mk/bsd.prefs.mk"

# for backtrace
.if ${OPSYS} == "NetBSD" && exists(/usr/include/execinfo.h)
LIBS+=		-lexecinfo
MAKE_ENV+=	EXTRA_LIBRARIES=-lexecinfo
.endif

.include "../../graphics/MesaLib/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../graphics/giflib/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../graphics/tiff/buildlink3.mk"
.include "../../sysutils/dbus/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../x11/libSM/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXinerama/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
