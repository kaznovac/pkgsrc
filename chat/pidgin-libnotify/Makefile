# $NetBSD: Makefile,v 1.84 2024/12/27 08:19:27 wiz Exp $
#

DISTNAME=	pidgin-libnotify-0.14
PKGREVISION=	79
CATEGORIES=	chat
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=gaim-libnotify/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://gaim-libnotify.sourceforge.net/
COMMENT=	Pidgin plugin that adds popup support
LICENSE=	gnu-gpl-v3

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config gmake perl msgfmt intltool

.include "../../chat/libpurple/buildlink3.mk"
.include "../../chat/pidgin/buildlink3.mk"
.include "../../sysutils/libnotify/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
