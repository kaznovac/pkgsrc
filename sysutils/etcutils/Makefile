# $NetBSD: Makefile,v 1.5 2024/07/25 05:41:52 wiz Exp $

DISTNAME=	etcutils-0.1
PKGREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	ftp://ftp.NetBSD.org/pub/NetBSD/misc/jmmv/etcutils/0.1/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.NetBSD.org/~jmmv/etcutils/
COMMENT=	Utilities to programmatically edit configuration files
LICENSE=	2-clause-bsd

GNU_CONFIGURE=		yes

CONFIGURE_ARGS+=	--sysconfdir=/etc SH=${SH}

PKG_OPTIONS_VAR=	PKG_OPTIONS.etcutils
PKG_SUPPORTED_OPTIONS=	tests

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mtests)
CONFIGURE_ARGS+=	--with-atf
DEPENDS+=		atf-[0-9]*:../../devel/atf
PLIST_SUBST+=		TESTS=
.else
CONFIGURE_ARGS+=	--without-atf
PLIST_SUBST+=		TESTS="@comment"
.endif

.include "../../mk/bsd.pkg.mk"
