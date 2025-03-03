# $NetBSD: Makefile,v 1.120 2024/09/12 21:48:43 gutteridge Exp $

PKGREVISION=	2
.include "../../print/texlive/Makefile.common"

PKGNAME=	luatex-1.18.0
CATEGORIES=	print

HOMEPAGE=	https://www.tug.org/web2c/
COMMENT=	Extended version of pdfTeX using Lua
LICENSE=	gnu-gpl-v2

EXTRACT_ELEMENTS+=	${DISTNAME}/libs/lua53
EXTRACT_ELEMENTS+=	${DISTNAME}/libs/luajit
EXTRACT_ELEMENTS+=	${DISTNAME}/libs/potrace
EXTRACT_ELEMENTS+=	${DISTNAME}/libs/pplib
EXTRACT_ELEMENTS+=	${DISTNAME}/texk/web2c

USE_LANGUAGES=		c c++
USE_CC_FEATURES=	c99
USE_CXX_FEATURES=	c++11
USE_TOOLS+=		gmake gsed lex perl yacc
GNU_CONFIGURE_STRICT=	no # libs
CONFIGURE_ARGS+=	--disable-aleph
CONFIGURE_ARGS+=	--disable-eptex
CONFIGURE_ARGS+=	--disable-etex
CONFIGURE_ARGS+=	--disable-euptex
CONFIGURE_ARGS+=	--disable-hitex
CONFIGURE_ARGS+=	--disable-mf
CONFIGURE_ARGS+=	--disable-mf-nowin
CONFIGURE_ARGS+=	--disable-luajittex
CONFIGURE_ARGS+=	--disable-luajithbtex
CONFIGURE_ARGS+=	--disable-mfluajit
CONFIGURE_ARGS+=	--disable-mp
CONFIGURE_ARGS+=	--disable-pdftex
CONFIGURE_ARGS+=	--disable-pmp
CONFIGURE_ARGS+=	--disable-ptex
CONFIGURE_ARGS+=	--disable-upmp
CONFIGURE_ARGS+=	--disable-uptex
CONFIGURE_ARGS+=	--disable-web-progs
CONFIGURE_ARGS+=	--disable-xetex
CONFIGURE_ARGS+=	--enable-luatex
CONFIGURE_ARGS+=	--enable-web2c
CONFIGURE_ARGS+=	--with-fontconfig-includes=${BUILDLINK_PREFIX.fontconfig}/include
CONFIGURE_ARGS+=	--with-fontconfig-libdir=${BUILDLINK_PREFIX.fontconfig}/lib
CONFIGURE_ARGS+=	--with-system-kpathsea
CONFIGURE_ARGS+=	--with-system-zlib
CONFIGURE_ARGS+=	--with-zlib-includes=${BUILDLINK_PREFIX.zlib}/include
CONFIGURE_ARGS+=	--with-zlib-libdir=${BUILDLINK_PREFIX.zlib}/lib
CONFIGURE_ARGS+=	--with-system-cairo
CONFIGURE_ARGS+=	--with-system-graphite2
CONFIGURE_ARGS+=	--with-system-harfbuzz
CONFIGURE_ARGS+=	--with-system-pixman
CONFIGURE_ARGS+=	--with-system-libpng
CONFIGURE_ARGS+=	--with-system-freetype2
CONFIGURE_ARGS+=	--with-system-zziplib
CONFIGURE_ARGS+=	--with-system-mpfr
CONFIGURE_ARGS+=	--with-mpfr-includes=${BUILDLINK_PREFIX.mpfr}/include
CONFIGURE_ARGS+=	--with-mpfr-libdir=${BUILDLINK_PREFIX.mpfr}/lib
CONFIGURE_ARGS+=	--with-system-gmp
CONFIGURE_ARGS+=	--with-gmp-includes=${BUILDLINK_PREFIX.gmp}/include
CONFIGURE_ARGS+=	--with-gmp-libdir=${BUILDLINK_PREFIX.gmp}/lib
CONFIGURE_ARGS+=	--without-x

CONFIGURE_DIRS=		libs/lua53
CONFIGURE_DIRS+=	libs/potrace
CONFIGURE_DIRS+=	libs/pplib
CONFIGURE_DIRS+=	texk/web2c

INSTALLATION_DIRS+=	bin lib

SUBST_CLASSES+=		prefix
SUBST_STAGE.prefix=	post-configure
SUBST_FILES.prefix=	libs/lua53/lua53-src/src/luaconf.h
SUBST_VARS.prefix=	PREFIX

CPPFLAGS.SunOS+=	-D_XOPEN_SOURCE_EXTENDED=0

do-install:
	${LIBTOOL} --mode=install ${INSTALL_LIB} ${WRKSRC}/libs/lua53/libtexlua53.la ${DESTDIR}${PREFIX}/lib
	${LIBTOOL} --mode=install ${INSTALL_PROGRAM} ${WRKSRC}/texk/web2c/luatex ${DESTDIR}${PREFIX}/bin
	${LN} -f -s luatex ${DESTDIR}${PREFIX}/bin/texlua
	${LN} -f -s luatex ${DESTDIR}${PREFIX}/bin/texluac
	${LIBTOOL} --mode=install ${INSTALL_PROGRAM} ${WRKSRC}/texk/web2c/luahbtex ${DESTDIR}${PREFIX}/bin
	${LIBTOOL} --mode=install ${INSTALL_PROGRAM} ${WRKSRC}/texk/web2c/mflua ${DESTDIR}${PREFIX}/bin

.include "../../archivers/zziplib/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../fonts/harfbuzz/buildlink3.mk"
.include "../../graphics/cairo/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../math/mpfr/buildlink3.mk"
BUILDLINK_API_DEPENDS.kpathsea+= kpathsea>=6.4.0
.include "../../print/kpathsea/buildlink3.mk"
.include "../../x11/pixman/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
