# $NetBSD: Makefile,v 1.46 2025/01/08 10:30:03 jperkin Exp $

DISTNAME=		mkfontscale-1.2.3
CATEGORIES=		fonts x11
MASTER_SITES=		${MASTER_SITE_XORG:=app/}
EXTRACT_SUFX=		.tar.xz

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		https://xorg.freedesktop.org/
COMMENT=		X11 Scalable Font Index Generator

GNU_CONFIGURE=		yes
USE_TOOLS+=		pkg-config
USE_FEATURES+=		vsnprintf

CONFIGURE_ENV+=		APP_MAN_SUFFIX=1
CONFIGURE_ARGS+=	--with-bzip2

CONFLICTS+=		mkfontdir-[0-9]*
SUPERSEDES+=		mkfontdir-[0-9]*

.include "../../devel/zlib/buildlink3.mk"
.include "../../archivers/bzip2/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../fonts/libfontenc/buildlink3.mk"
.include "../../x11/xorgproto/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
