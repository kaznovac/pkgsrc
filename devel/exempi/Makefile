# $NetBSD: Makefile,v 1.50 2024/12/29 15:09:43 adam Exp $

DISTNAME=	exempi-2.5.2
PKGREVISION=	9
CATEGORIES=	devel graphics
MASTER_SITES=	https://libopenraw.pages.freedesktop.org/download/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://libopenraw.pages.freedesktop.org/exempi/
COMMENT=	XMP (Extensible Metadata Platform) library
LICENSE=	modified-bsd

GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	ac_cv_tls=none
USE_LIBTOOL=	yes
USE_TOOLS+=	gmake pkg-config
USE_LANGUAGES=	c c++

USE_CXX_FEATURES+=	c++11

CONFIGURE_ARGS+=	LIBS=${BUILDLINK_LDADD.iconv:Q}

PTHREAD_AUTO_VARS=	yes

PKGCONFIG_OVERRIDE+=	exempi/exempi-2.0.pc.in

.include "options.mk"

.include "../../devel/zlib/buildlink3.mk"
.include "../../converters/libiconv/buildlink3.mk"
.include "../../textproc/expat/buildlink3.mk"
.include "../../mk/dlopen.buildlink3.mk"
BUILDLINK_TRANSFORM+= opt:-ldl:${BUILDLINK_LDADD.dl:Q}
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
