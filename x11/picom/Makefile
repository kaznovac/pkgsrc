# $NetBSD: Makefile,v 1.12 2024/12/07 10:03:50 nia Exp $

DISTNAME=	picom-11.2
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_GITHUB:=yshui/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	nia@NetBSD.org
HOMEPAGE=	https://github.com/yshui/picom
COMMENT=	Lightweight compositor for X11 (fork of Compton)
LICENSE=	mpl-2.0 AND mit

CONFLICTS+=	compton-[0-9]*
SUPERSEDES+=	compton-[0-9]*

TOOL_DEPENDS+=	asciidoc-[0-9]*:../../textproc/asciidoc

USE_TOOLS+=		pkg-config
USE_LANGUAGES=		c c++
MESON_ARGS+=		-Dwith_docs=true
REPLACE_SH+=		bin/picom-trans
PYTHON_FOR_BUILD_ONLY=	tool
INSTALLATION_DIRS+=	share/examples/picom share/examples/picom/xdg/autostart

CONF_FILES+=	share/examples/picom/xdg/autostart/picom.desktop \
		${PKG_SYSCONFDIR}/xdg/autostart/picom.desktop
MAKE_DIRS+=	${PKG_SYSCONFDIR}/xdg/autostart

post-install:
	${INSTALL_DATA} ${WRKSRC}/picom.sample.conf ${DESTDIR}${PREFIX}/share/examples/picom/picom.sample.conf
	${MV} ${DESTDIR}${PKG_SYSCONFDIR}/xdg/autostart/picom.desktop ${DESTDIR}${PREFIX}/share/examples/picom/xdg/autostart

.include "options.mk"
.include "../../devel/meson/build.mk"
.include "../../devel/libconfig/buildlink3.mk"
.include "../../devel/libev/buildlink3.mk"
.include "../../devel/pcre2/buildlink3.mk"
.include "../../devel/uthash/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/libxcb/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/pixman/buildlink3.mk"
.include "../../x11/xcb-util/buildlink3.mk"
.include "../../x11/xcb-util-image/buildlink3.mk"
.include "../../x11/xcb-util-renderutil/buildlink3.mk"
.include "../../mk/atomic64.mk"
.include "../../mk/bsd.pkg.mk"
