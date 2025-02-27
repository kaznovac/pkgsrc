# $NetBSD: Makefile,v 1.24 2024/11/14 22:20:04 wiz Exp $

DISTNAME=	colord-1.3.5
PKGREVISION=	19
CATEGORIES=	graphics gnome
MASTER_SITES=	https://www.freedesktop.org/software/colord/releases/
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	youri@NetBSD.org
HOMEPAGE=	https://www.freedesktop.org/software/colord/
COMMENT=	Device color profile management daemon
LICENSE=	gnu-gpl-v2

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config gmake intltool autoconf aclocal automake msgfmt

COLORD_USER=	colord
COLORD_GROUP=	colord
PKG_GROUPS+=	${COLORD_GROUP}
PKG_USERS+=	${COLORD_USER}:${COLORD_GROUP}
BUILD_DEFS+=	VARBASE

PKGCONFIG_OVERRIDE+=	lib/colorhug/colorhug.pc.in
PKGCONFIG_OVERRIDE+=	lib/colord/colord.pc.in

# XXX dependency for man pages missing from pkgsrc
CONFIGURE_ENV+=		ac_cv_path_DOCBOOK2MAN=no

CONFIGURE_ARGS+=	--disable-gusb
CONFIGURE_ARGS+=	--disable-udev
CONFIGURE_ARGS+=	--disable-bash-completion
CONFIGURE_ARGS+=	--disable-systemd-login
CONFIGURE_ARGS+=	--disable-argyllcms-sensor # XXX not useful?
CONFIGURE_ARGS+=	--disable-print-profiles
CONFIGURE_ARGS+=	--with-daemon-user=colord
CONFIGURE_ARGS+=	--localstatedir=${VARBASE}

PKGCONFIG_OVERRIDE+=	lib/colorhug/colorhug.pc.in
PKGCONFIG_OVERRIDE+=	lib/colord/colord.pc.in

CONF_DIR=	${PREFIX}/share/examples/colord
CONF_FILES+=	${CONF_DIR}/org.freedesktop.ColorManager.conf \
		${PKG_SYSCONFDIR}/dbus-1/system.d/org.freedesktop.ColorManager.conf

SUBST_CLASSES+=		prefix
SUBST_MESSAGE.prefix=	Fix prefix
SUBST_STAGE.prefix=	pre-configure
SUBST_FILES.prefix=	lib/colord/cd-icc-store.c
SUBST_FILES.prefix+=	src/cd-main.c
SUBST_FILES.prefix+=	client/cd-util.c
SUBST_VARS.prefix=	PREFIX VARBASE

INSTALLATION_DIRS+=	share/vala/vapi

pre-configure:
	cd ${WRKSRC} && autoreconf

TOOL_DEPENDS+=	gtk-doc-[0-9]*:../../textproc/gtk-doc

post-install:
	${INSTALL_DATA} ${WRKSRC}/lib/colord/colord.vapi ${DESTDIR}${PREFIX}/share/vala/vapi/

.include "../../devel/glib2/schemas.mk"
.include "../../devel/gobject-introspection/buildlink3.mk"
.include "../../graphics/lcms2/buildlink3.mk"
.include "../../databases/sqlite3/buildlink3.mk"
.include "../../security/polkit/buildlink3.mk"
.include "../../sysutils/dbus/buildlink3.mk"
.include "../../sysutils/consolekit/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
