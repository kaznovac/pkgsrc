# $NetBSD: Makefile,v 1.123 2024/12/27 08:21:09 wiz Exp $

DISTNAME=	zenity-4.0.1
PKGREVISION=	4
CATEGORIES=	x11 gnome
MASTER_SITES=	${MASTER_SITE_GNOME:=sources/zenity/${PKGVERSION_NOREV:R}/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.gnome.org/
COMMENT=	Display GNOME dialogs from the command line
LICENSE=	gnu-lgpl-v2.1 # or later

CONFLICTS=	zenity3-[0-9]*

TOOL_DEPENDS+=		help2man-[0-9]*:../../converters/help2man

USE_TOOLS+=		itstool msgfmt pkg-config

# "error: 'for' loop initial declarations are only allowed in C99 mode"
FORCE_C_STD=		c99

CPPFLAGS.SunOS+=	-D__EXTENSIONS__

.include "../../devel/meson/build.mk"

.include "../../x11/gtk4/buildlink3.mk"
.include "../../devel/gettext-tools/msgfmt-desktop.mk"
.include "../../devel/glib2/buildlink3.mk"
BUILDLINK_API_DEPENDS.libadwaita+=	libadwaita>=1.2
.include "../../devel/libadwaita/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
