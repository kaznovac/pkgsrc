# $NetBSD: Makefile,v 1.47 2024/09/06 18:48:41 bsiegert Exp $

GITHUB_PROJECT=	gomuks
GITHUB_TAG=	v${PKGVERSION_NOREV}
DISTNAME=	gomuks-0.3.1
PKGREVISION=	2
CATEGORIES=	chat
MASTER_SITES=	${MASTER_SITE_GITHUB:=tulir/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://maunium.net/go/gomuks/
COMMENT=	Terminal Matrix client written in Go
LICENSE=	gnu-agpl-v3

USE_LANGUAGES=	c
USE_TOOLS=	pkg-config

MAKE_ENV+=	CGO_CFLAGS="`${TOOLS_CMD.pkg-config} --cflags olm` -O2"
MAKE_ENV+=	CGO_LDFLAGS="`${TOOLS_CMD.pkg-config} pkg-config --libs olm`"

GO_BUILD_PATTERN+=	.

.include "go-modules.mk"

.include "../../lang/go/go-module.mk"
.include "../../security/olm/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
