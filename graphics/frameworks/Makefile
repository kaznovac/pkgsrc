# $NetBSD: Makefile,v 1.63 2024/12/27 08:19:54 wiz Exp $
#

DISTNAME=		frameworks-0.3.7
PKGREVISION=		55
CATEGORIES=		graphics
MASTER_SITES=		http://frameworks.polycrystal.org/release/
SITES.frameworks.png=	http://frameworks.polycrystal.org/images/
DISTFILES=		${DISTNAME}${EXTRACT_SUFX} frameworks.png

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://frameworks.polycrystal.org/release/
COMMENT=	Stop-motion animation frame capture software

GNU_CONFIGURE=	yes
USE_TOOLS+=	pkg-config gmake autoconf
LDFLAGS+=	-lm    # Explicit for binutils 2.22 linker

SUBST_CLASSES=		xdg
SUBST_STAGE.xdg=	pre-configure
SUBST_MESSAGE.xdg=	Fixing paths in xdg menu entries.
SUBST_FILES.xdg=	frameworks.desktop
SUBST_VARS.xdg=		PREFIX

INSTALLATION_DIRS=	share/applications share/icons/hicolor/48x48/apps

post-extract:
	cp ${FILESDIR}/frameworks.desktop.in ${WRKSRC}/frameworks.desktop

pre-configure:
	cd ${WRKSRC} && autoconf

post-install:
	${INSTALL_DATA} ${DISTDIR}/frameworks.png \
	    ${DESTDIR}${PREFIX}/share/icons/hicolor/48x48/apps/frameworks.png
	${INSTALL_DATA} ${WRKSRC}/frameworks.desktop \
	    ${DESTDIR}${PREFIX}/share/applications/frameworks.desktop

.include "../../devel/libglade/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../graphics/libv4l/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/bsd.pkg.mk"
