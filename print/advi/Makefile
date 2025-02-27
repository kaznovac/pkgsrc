# $NetBSD: Makefile,v 1.153 2024/12/27 08:20:31 wiz Exp $

DISTNAME=		advi-1.10.2
PKGREVISION=		67
CATEGORIES=		print
MASTER_SITES=		http://gallium.inria.fr/advi/

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://gallium.inria.fr/advi/
COMMENT=		Active-DVI Presenter
LICENSE=		gnu-lgpl-v2

TOOL_DEPENDS+=		ImageMagick-[0-9]*:../../graphics/ImageMagick
TOOL_DEPENDS+=		ocaml>=3.04:../../lang/ocaml
TOOL_DEPENDS+=		ocaml-findlib>=1.2.6:../../devel/ocaml-findlib
DEPENDS+=		camlimages>=4.0.0:../../graphics/camlimages

# "Scripts installed by texlive-tetex have been moved to tex-fontinst,
# tex-pstools, and tex-cyrillic-bin in TeX Live 2013."
#DEPENDS+=		texlive-tetex>=2010:../../print/texlive-tetex
DEPENDS+=		tex-fontinst>=1.933:../../fonts/tex-fontinst
DEPENDS+=		tex-texlive-scripts-extra-[0-9]*:../../print/tex-texlive-scripts-extra
DEPENDS+=		tex-cyrillic-bin>=2013:../../print/tex-cyrillic-bin
DEPENDS+=		hevea-[0-9]*:../../textproc/hevea
TOOL_DEPENDS+=		vera-ttf-[0-9]*:../../fonts/vera-ttf

USE_PKGLOCALEDIR=	yes
GNU_CONFIGURE=		yes
USE_TOOLS+=		gmake gs:run
GNU_CONFIGURE_LIBDIR=	${PREFIX}/share/texmf-dist
CONFIGURE_ARGS+=	--with-gs=${PREFIX}/bin/gs

GRAPHICS_PREFIX=	${BUILDLINK_PREFIX.ocaml-graphics}
GRAPHICS_DIR=		${GRAPHICS_PREFIX}/lib/ocaml/site-lib/graphics
MAKE_ENV+=		OCAMLGRAPHICS_INCLUDES=-I\ ${GRAPHICS_DIR}
# For reasons best known to itself the preexisting makefiles already include
# the library but not the includes.
#MAKE_ENV+=		OCAMLGRAPHICS_LIBS_BYTE=${GRAPHICS_DIR}/graphics.cma
#MAKE_ENV+=		OCAMLGRAPHICS_LIBS_NATIVE=${GRAPHICS_DIR}/graphics.cmxa

INSTALL_UNSTRIPPED=	yes

SUBST_CLASSES+=		gs
SUBST_STAGE.gs=		post-configure
SUBST_FILES.gs=		src/config.ml.in
SUBST_SED.gs=		-e 's,@GS@,gs,'
SUBST_MESSAGE.gs=	Fixing hard-coded path to gs

INSTALLATION_DIRS=	share/doc/advi

post-extract:
	${CP} ${WRKSRC}/tex/*.eps ${WRKSRC}/doc
	${MKDIR} ${WRKSRC}/doc.orig
	${CP} ${WRKSRC}/doc/*.dvi ${WRKSRC}/doc.orig

post-install:
	cd ${WRKSRC}/doc && ${INSTALL_DATA} *.ps *.pdf \
		${DESTDIR}${PREFIX}/share/doc/advi
	cd ${WRKSRC}/doc.orig && ${INSTALL_DATA} *.dvi \
		${DESTDIR}${PREFIX}/share/doc/advi
	cd ${WRKSRC}/doc && ${INSTALL_DATA} *.html *.gif \
		${DESTDIR}${PREFIX}/share/doc/advi

.include "../../print/kpathsea/texmf.mk"
.include "../../lang/ocaml/buildlink3.mk"
.include "../../graphics/camlimages/buildlink3.mk"
.include "../../mk/jpeg.buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../graphics/tiff/buildlink3.mk"
.include "../../devel/nspr/buildlink3.mk"
.include "../../graphics/giflib/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../x11/ocaml-lablgtk/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../x11/libXpm/buildlink3.mk"
.include "../../x11/libXinerama/buildlink3.mk"
.include "../../x11/ocaml-graphics/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
