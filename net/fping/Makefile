# $NetBSD: Makefile,v 1.26 2025/01/03 13:43:12 adam Exp $

DISTNAME=	fping-5.3
CATEGORIES=	net
MASTER_SITES=	http://fping.org/dist/

MAINTAINER=	abs@NetBSD.org
HOMEPAGE=	https://www.fping.org/
COMMENT=	Quickly ping many hosts w/o flooding the network

USE_CC_FEATURES=	c99
USE_LANGUAGES=		c
GNU_CONFIGURE=		yes

SPECIAL_PERMS+=	sbin/fping ${SETUID_ROOT_PERMS}

CFLAGS.SunOS+=	-Dn_time=uint32_t -D_XOPEN_SOURCE=600 -D__EXTENSIONS__

.include "options.mk"

.include "../../mk/bsd.pkg.mk"
