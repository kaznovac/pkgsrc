# $NetBSD: Makefile,v 1.20 2024/11/14 22:18:49 wiz Exp $

DISTNAME=	carbons-purple-0.2.1
PKGREVISION=	18
CATEGORIES=	chat
MASTER_SITES=	${MASTER_SITE_GITHUB:=gkdr/}
GITHUB_PROJECT=	carbons
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/gkdr/carbons
COMMENT=	XEP-0280: Message Carbons plugin for libpurple
LICENSE=	gnu-gpl-v2

EXTRACT_USING=	bsdtar
USE_TOOLS+=	gmake pkg-config

MAKE_FLAGS+=	PURPLE_PLUGIN_DIR=${DESTDIR}${PREFIX}/lib/purple-2

.include "../../chat/libpurple/buildlink3.mk"
.include "../../mk/dlopen.buildlink3.mk"
BUILDLINK_TRANSFORM+=	opt:-ldl:${BUILDLINK_LDADD.dl:Q}
.include "../../mk/bsd.pkg.mk"
