# $NetBSD: Makefile,v 1.56 2024/12/27 08:20:18 wiz Exp $

DISTNAME=	gtklife-5.1
PKGREVISION=	42
CATEGORIES=	math
MASTER_SITES=	http://ironphoenix.org/tril/gtklife/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://ironphoenix.org/tril/gtklife/
COMMENT=	The game of life

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-gtk2
CONFIGURE_ARGS+=	--with-docdir=${PREFIX}/share/doc/gtklife
USE_TOOLS+=		gmake pkg-config
LDFLAGS+=		-lX11	# direct link required by ld v2.22

.include "../../x11/gtk2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
