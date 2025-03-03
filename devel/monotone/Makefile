# $NetBSD: Makefile,v 1.131 2024/11/14 22:19:33 wiz Exp $

DISTNAME=	monotone-1.1
PKGREVISION=	37
CATEGORIES=	devel scm
MASTER_SITES=	https://www.monotone.ca/downloads/1.1/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://monotone.ca/
COMMENT=	Free distributed version control system
LICENSE=	gnu-gpl-v2 OR gnu-gpl-v3 # OR newer

GNU_CONFIGURE=		yes
INFO_FILES=		yes
TEST_TARGET=		check
UNLIMIT_RESOURCES+=	datasize
USE_TOOLS+=		gmake makeinfo pax perl:run pkg-config
USE_LANGUAGES=		c c++
USE_PKGLOCALEDIR=	yes

INSTALL_MAKE_FLAGS+=	bashcompdir=${PREFIX:Q}/share/examples/monotone

PKG_OPTIONS_VAR=	PKG_OPTIONS.monotone
PKG_SUPPORTED_OPTIONS=	inet6
PKG_SUGGESTED_OPTIONS=	inet6

CHECK_INTERPRETER_SKIP+=	share/monotone/contrib/*
CHECK_PORTABILITY_SKIP+=	debian/*

REPLACE_PERL=			extra/bin/mtn-cleanup
REPLACE_SH=			src/util/mtnopt.in
# The following are optional scripts for hooks.  We do not replace their
# interpreter because we want to avoid a dependency on them.  (Ideally they
# should be in separate packages with appropriate dependencies.)
CHECK_INTERPRETER_SKIP=		share/monotone/scripts/monotone-ciabot.py
CHECK_INTERPRETER_SKIP+=	share/monotone/scripts/monotone-mail-notify

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Minet6)
CONFIGURE_ARGS+=	--enable-ipv6
.else
CONFIGURE_ARGS+=	--disable-ipv6
.endif

INSTALLATION_DIRS+=	share/monotone

BUILDLINK_API_DEPENDS.pcre+=	pcre>=7.6

.include "../../converters/libiconv/buildlink3.mk"
.include "../../databases/sqlite3/buildlink3.mk"
.include "../../devel/boost-headers/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/libidn/buildlink3.mk"
.include "../../devel/pcre/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../lang/lua/buildlink3.mk"
.include "../../security/botan1/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
