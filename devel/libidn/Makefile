# $NetBSD: Makefile,v 1.113 2024/05/01 22:32:15 cheusov Exp $

DISTNAME=	libidn-1.42
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU:=libidn/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.gnu.org/software/libidn/
COMMENT=	Internationalized Domain Names command line tool
LICENSE=	gnu-gpl-v3 AND gnu-lgpl-v2.1

USE_LIBTOOL=		yes
USE_PKGLOCALEDIR=	yes
USE_TOOLS+=		makeinfo pkg-config perl:build gsed
USE_TOOLS+=		msgfmt msgmerge xgettext
TEXINFO_REQD+=		4.7
GNU_CONFIGURE=		yes
INFO_FILES=		yes
CONFIGURE_ENV+=		EMACS=${FALSE:Q}
CONFIGURE_ARGS+=	--disable-csharp --disable-java
CONFIGURE_ARGS+=	--with-packager=pkgsrc
CONFIGURE_ARGS+=	--with-packager-bug-reports=http://www.NetBSD.org/cgi-bin/sendpr.cgi?gndb=netbsd

CONFIGURE_ARGS.Interix+=	--disable-ld-version-script

PKGCONFIG_OVERRIDE+=	lib/libidn.pc.in
TEST_TARGET=		check

.include "../../mk/bsd.prefs.mk"
.include "options.mk"

.include "../../converters/libiconv/buildlink3.mk"
.include "../../devel/libgetopt/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
