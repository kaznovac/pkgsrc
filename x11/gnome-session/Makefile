# $NetBSD: Makefile,v 1.228 2024/12/27 08:20:53 wiz Exp $

DISTNAME=		gnome-session-40.1.1
PKGREVISION=		21
CATEGORIES=		x11 gnome
MASTER_SITES=		${MASTER_SITE_GNOME:=sources/${PKGBASE}/${PKGVERSION_NOREV:R:R}/}
EXTRACT_SUFX=		.tar.xz

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		https://gitlab.gnome.org/GNOME/gnome-session
COMMENT=		GNOME3 session management utilities
LICENSE=		gnu-gpl-v2

TOOL_DEPENDS+=		libxslt-[0-9]*:../../textproc/libxslt
TOOL_DEPENDS+=		xmlto-[0-9]*:../../textproc/xmlto

USE_TOOLS+=		pkg-config msgfmt xgettext
USE_TOOLS+=		gdbus-codegen

.include "../../graphics/MesaLib/features.mk"

PLIST_VARS+=		gles2
.if ${MESALIB_SUPPORTS_GLESv2} == "no"
MESON_ARGS+=		-Dgles2=false
.else
PLIST.gles2=		yes
.endif

MESON_ARGS+=		-Dsystemd=false
MESON_ARGS+=		-Dsystemd_session=disable
MESON_ARGS+=		-Dsystemd_journal=false
MESON_ARGS+=		-Dconsolekit=true

PYTHON_FOR_BUILD_ONLY=	tool

.include "../../devel/meson/build.mk"
.include "../../graphics/MesaLib/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/gettext-tools/msgfmt-desktop.mk"
BUILDLINK_API_DEPENDS.glib2+=	glib2>=2.16.0
.include "../../devel/glib2/schemas.mk"
.include "../../devel/pango/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../graphics/libepoxy/buildlink3.mk"
.include "../../textproc/libxslt/buildlink3.mk"
.include "../../sysutils/dbus/buildlink3.mk"
BUILDLINK_API_DEPENDS.dbus-glib+=	dbus-glib>=0.76
.include "../../sysutils/dbus-glib/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../devel/dconf/database.mk"
.include "../../sysutils/gsettings-desktop-schemas/buildlink3.mk"
.include "../../sysutils/gnome-settings-daemon/buildlink3.mk"
.include "../../textproc/json-glib/buildlink3.mk"
.include "../../x11/gnome-desktop3/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../x11/libSM/buildlink3.mk"
.include "../../x11/libXau/buildlink3.mk"
.include "../../x11/libXrender/buildlink3.mk"
.include "../../x11/startup-notification/buildlink3.mk"
.include "../../x11/xtrans/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
