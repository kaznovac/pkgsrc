# $NetBSD: Makefile,v 1.18 2024/12/29 15:09:41 adam Exp $

DISTNAME=	libepubgen-0.1.1
PKGREVISION=	10
CATEGORIES=	converters
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=libepubgen/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	ryoon@NetBSD.org
HOMEPAGE=	https://sourceforge.net/projects/libepubgen/
COMMENT=	EPUB generator library for librevenge
LICENSE=	mpl-2.0

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	gmake pkg-config
USE_LANGUAGES=	c c++

CONFIGURE_ARGS+=	--disable-tests
CONFIGURE_ARGS+=	--without-docs

PKGCONFIG_OVERRIDE+=	libepubgen.pc.in

.include "../../converters/librevenge/buildlink3.mk"
.include "../../devel/boost-libs/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
