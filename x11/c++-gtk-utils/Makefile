# $NetBSD: Makefile,v 1.34 2024/12/27 08:20:51 wiz Exp $

DISTNAME=	c++-gtk-utils-2.2.19
PKGREVISION=	13
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=cxx-gtk-utils/}

MAINTAINER=	ryoon@NetBSD.org
HOMEPAGE=	http://cxx-gtk-utils.sourceforge.net/
COMMENT=	Lightweight library for programming GTK+ programs using C++
LICENSE=	gnu-lgpl-v2.1

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c c++

PKGCONFIG_OVERRIDE+=	c++-gtk-utils-3-2.2.pc.in

.include "../../devel/glib2/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
