# $NetBSD: Makefile,v 1.38 2024/11/14 22:18:38 wiz Exp $

MODNAME=		zip
CATEGORIES+=		archivers
COMMENT=		PHP extension for ZIP archive handling
PKGREVISION=		16

CONFLICTS=		php-zip-[0-9]*

CONFIGURE_ARGS+=	--enable-zip
CONFIGURE_ARGS+=	--with-zlib-dir=${BUILDLINK_PREFIX.zlib}
CONFIGURE_ARGS+=	--with-libzip=${BUILDLINK_PREFIX.libzip}

USE_PHP_EXT_PATCHES=	yes

.include "../../lang/php/ext.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../archivers/libzip/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
