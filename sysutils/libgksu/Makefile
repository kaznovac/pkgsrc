# $NetBSD: Makefile,v 1.66 2024/12/27 08:20:39 wiz Exp $

DISTNAME=	libgksu-2.0.12
PKGREVISION=	31
CATEGORIES=	sysutils
MASTER_SITES=	http://people.debian.org/~kov/gksu/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.nongnu.org/gksu/
COMMENT=	Library that provides a GTK+ frontend to su and sudo
LICENSE=	gnu-lgpl-v2

GNU_CONFIGURE=	yes

CONFIGURE_ARGS+=	--disable-gtk-doc
CONFIGURE_ENV+=		GCONF_SCHEMA_FILE_DIR=${PREFIX}/share/gconf/schemas/
MAKE_ENV+=		GCONF_SCHEMA_FILE_DIR=${PREFIX}/share/gconf/schemas/

USE_LIBTOOL=	yes
USE_TOOLS+=	gmake intltool pkg-config msgfmt

BUILDLINK_TRANSFORM.SunOS+=	rm:-Wl,-O1
BUILDLINK_TRANSFORM.SunOS+=	rm:-lutil

GCONF_SCHEMAS+=		gksu.schemas
PKGCONFIG_OVERRIDE+=	libgksu/libgksu2.pc.in

SUBST_CLASSES+=		xauth
SUBST_SED.xauth+=	-e "s,/usr/bin/xauth,${LOCALBASE}/bin/xauth,g"
SUBST_MESSAGE.xauth=	Fixing path to xauth executable.
SUBST_STAGE.xauth=	post-extract
SUBST_FILES.xauth=	libgksu/gksu-run-helper.c libgksu/libgksu.c

.include "../../devel/GConf/schemas.mk"
.include "../../security/libgnome-keyring/buildlink3.mk"
.include "../../sysutils/libgtop/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../x11/startup-notification/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/bsd.pkg.mk"
