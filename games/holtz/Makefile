# $NetBSD: Makefile,v 1.73 2024/12/29 15:09:48 adam Exp $

DISTNAME=	holtz-1.5.0
PKGREVISION=	13
CATEGORIES=	games
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=holtz/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://holtz.sourceforge.io/
COMMENT=	Engine for the abstract strategy games Zèrtz and Dvonn
LICENSE=	gnu-gpl-v2

GNU_CONFIGURE=		yes
USE_LANGUAGES=		c c++
USE_TOOLS+=		gmake

.include "../../devel/boost-libs/buildlink3.mk"
.include "../../x11/wxGTK32/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
