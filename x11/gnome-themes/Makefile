# $NetBSD: Makefile,v 1.121 2024/12/27 08:20:54 wiz Exp $
#

DISTNAME=		gnome-themes-2.32.1
PKGREVISION=		38
CATEGORIES=		x11
MASTER_SITES=		${MASTER_SITE_GNOME:=sources/gnome-themes/2.32/}
EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		https://www.gnome.org/
COMMENT=		Collection of themes and icons for GNOME 2
LICENSE=		gnu-lgpl-v2.1

CONFLICTS+=		clearlooks-metacity-[0-9]*

USE_TOOLS+=		gmake intltool msgfmt pkg-config
USE_LIBTOOL=		yes
USE_PKGLOCALEDIR=	yes
GNU_CONFIGURE=		yes

.include "../../devel/gettext-lib/buildlink3.mk"
BUILDLINK_API_DEPENDS.icon-naming-utils+=	icon-naming-utils>=0.8.90
.include "../../graphics/icon-naming-utils/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
BUILDLINK_API_DEPENDS.gtk2-engines+=		gtk2-engines>=2.15.3
.include "../../x11/gtk2-engines/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
