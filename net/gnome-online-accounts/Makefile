# $NetBSD: Makefile,v 1.63 2024/12/27 08:20:27 wiz Exp $

DISTNAME=	gnome-online-accounts-3.36.0
PKGREVISION=	25
CATEGORIES=	net gnome
MASTER_SITES=	${MASTER_SITE_GNOME:=sources/gnome-online-accounts/3.36/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://wiki.gnome.org/Projects/GnomeOnlineAccounts
COMMENT=	Service that allows online accounts to be used with GNOME
LICENSE=	gnu-lgpl-v2

GNU_CONFIGURE=		yes
USE_LIBTOOL=		yes
USE_TOOLS+=		pkg-config gmake
USE_TOOLS+=		msgfmt msgmerge xgettext
USE_TOOLS+=		gdbus-codegen

CONFIGURE_ENV+=	GLIB_COMPILE_SCHEMAS=glib-compile-schemas

PKGCONFIG_OVERRIDE+=	src/goabackend/goa-backend-1.0.pc.in
PKGCONFIG_OVERRIDE+=	src/goa/goa-1.0.pc.in

.include "../../chat/telepathy-glib/buildlink3.mk"
.include "../../devel/glib2/schemas.mk"
.include "../../devel/gobject-introspection/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../net/libsoup/buildlink3.mk"
.include "../../security/libsecret/buildlink3.mk"
.include "../../sysutils/dbus-glib/buildlink3.mk"
.include "../../textproc/json-glib/buildlink3.mk"
.include "../../www/librest07/buildlink3.mk"
.include "../../www/webkit-gtk/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
