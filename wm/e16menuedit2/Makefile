# $NetBSD: Makefile,v 1.80 2024/12/27 08:20:46 wiz Exp $

DISTNAME=		e16menuedit2-0.0.3
PKGREVISION=		57
CATEGORIES=		wm x11
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=enlightenment/}

MAINTAINER=		chriswareham@chriswareham.demon.co.uk
HOMEPAGE=		https://www.enlightenment.org/
COMMENT=		Menu editor for the Enlightenment window manager

DEPENDS+=		enlightenment16>=0.16:../../wm/enlightenment16

BROKEN_GETTEXT_DETECTION=	yes

GNU_CONFIGURE=		yes
USE_TOOLS+=		intltool msgfmt pkg-config
USE_PKGLOCALEDIR=	yes

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/libglade/buildlink3.mk"
.include "../../devel/popt/buildlink3.mk"
.include "../../mk/omf-scrollkeeper.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
