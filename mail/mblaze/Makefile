# $NetBSD: Makefile,v 1.13 2024/09/13 17:08:49 schmonz Exp $

DISTNAME=	mblaze-1.3
CATEGORIES=	mail
MASTER_SITES=	${MASTER_SITE_GITHUB:=leahneukirchen/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	sunil@nimmagadda.net
HOMEPAGE=	https://github.com/leahneukirchen/mblaze/
COMMENT=	Set of Maildir utilities
LICENSE=	public-domain

NO_CONFIGURE=	yes
USE_TOOLS+=	gmake perl:test
MAKE_FILE=	GNUmakefile
MAKE_FLAGS+=	PREFIX=${PREFIX:Q} BINDIR=${PREFIX:Q}/bin MANDIR=${PREFIX:Q}/${PKGMANDIR}

TEST_TARGET=	check

.include "../../converters/libiconv/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
