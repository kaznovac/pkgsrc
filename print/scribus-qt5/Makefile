# $NetBSD: Makefile,v 1.81 2024/12/29 15:09:58 adam Exp $

DISTNAME=	scribus-1.6.2
PKGREVISION=	11
CATEGORIES=	print
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=scribus/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	ryoon@NetBSD.org
HOMEPAGE=	https://www.scribus.net/
COMMENT=	Publishing layout with graphical interface (Qt5 port)
LICENSE=	gnu-gpl-v2

USE_LANGUAGES=	c c++
USE_TOOLS+=	pkg-config

USE_CXX_FEATURES+=	c++17
CMAKE_CONFIGURE_ARGS+=		-DWANT_CPP17=ON

.include "../../devel/cmake/build.mk"
.include "../../converters/libcdr/buildlink3.mk"
.include "../../converters/libfreehand/buildlink3.mk"
.include "../../converters/libmspub/buildlink3.mk"
.include "../../converters/libpagemaker/buildlink3.mk"
.include "../../converters/libqxp/buildlink3.mk"
.include "../../converters/librevenge/buildlink3.mk"
.include "../../converters/libvisio/buildlink3.mk"
.include "../../converters/libwpg/buildlink3.mk"
.include "../../converters/libzmf/buildlink3.mk"
.include "../../devel/boost-headers/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../fonts/fontconfig/buildlink3.mk"
.include "../../fonts/harfbuzz/buildlink3.mk"
.include "../../fonts/harfbuzz-icu/buildlink3.mk"
.include "../../mk/jpeg.buildlink3.mk"
.include "../../graphics/cairo/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../graphics/lcms2/buildlink3.mk"
.include "../../graphics/osg/buildlink3.mk"
.include "../../graphics/tiff/buildlink3.mk"
.include "../../print/libcups/buildlink3.mk"
.include "../../print/podofo/buildlink3.mk"
.include "../../print/poppler-cpp/buildlink3.mk"
.include "../../print/poppler-includes/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../textproc/hunspell/buildlink3.mk"
.include "../../textproc/icu/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../x11/qt5-qttools/buildlink3.mk"
.include "../../mk/dlopen.buildlink3.mk"
BUILDLINK_TRANSFORM+=	opt:-ldl:${BUILDLINK_LDADD.dl:Q}
.include "../../mk/pthread.buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../mk/bsd.pkg.mk"
