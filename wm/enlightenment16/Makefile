# $NetBSD: Makefile,v 1.40 2024/12/27 08:20:46 wiz Exp $

DISTNAME=	e16-1.0.30
PKGREVISION=	3
PKGNAME=	${DISTNAME:S/e/enlightenment/}
CATEGORIES=	wm x11
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=enlightenment/}

MAINTAINER=	gutteridge@NetBSD.org
HOMEPAGE=	https://enlightenment.org/
COMMENT=	Highly themeable and configurable window manager
LICENSE=	enlightenment16

# This looks unusual and is incomplete because there were two distinct
# enlightenment packages in different parts of the tree. This package
# went from 0.16.x to 1.0.x release numbering, while x11/enlightenment
# reflects development that continues to use 0.x release numbering.
# This package isn't intended to conflict with or supersede
# x11/enlightenment.
CONFLICTS=	enlightenment>=1.0
SUPERSEDES=	enlightenment>=1.0

USE_TOOLS+=		gmake pkg-config
USE_PKGLOCALEDIR=	YES
GNU_CONFIGURE=		YES
MAKE_ENV+=		USER=${SHAREOWN}:${SHAREGRP}

INSTALL_MAKE_FLAGS+=	sesmdir=${WRKDIR}/.tmp

CONFIGURE_ARGS.NetBSD+=	--with-sound-player="/usr/bin/audioplay -q %s"

PYTHON_VERSIONS_INCOMPATIBLE=	27

REPLACE_PYTHON+=	scripts/e_gen_menu

SUBST_CLASSES+=		paths
SUBST_STAGE.paths=	pre-configure
SUBST_FILES.paths=	scripts/e_gen_menu
SUBST_VARS.paths=	PREFIX
SUBST_VARS.paths+=	X11BASE

PLIST_VARS+=	libhack

# -Wcast-align=strict was added in GCC 8.
BUILDLINK_TRANSFORM+=	rm:-Wcast-align=strict

.include "options.mk"

.include "../../mk/bsd.prefs.mk"

.if ${OPSYS} == "DragonFly" || ${OPSYS} == "SunOS" || ${OPSYS} == "Linux" || \
    ${OPSYS} == "Darwin"
PLIST.libhack=	yes
.endif

post-install:
	${FIND} ${DESTDIR}${PREFIX}/share/e16/themes -type d -print | \
		${XARGS} ${CHMOD} ${BINMODE}
	${FIND} ${DESTDIR}${PREFIX}/share/e16/themes -type f -print | \
		${XARGS} ${CHMOD} ${SHAREMODE}
	cd ${DESTDIR}${PREFIX}/share/e16 && ${RM} -rf fonts

.include "../../converters/libiconv/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../graphics/imlib2/buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../x11/xbitmaps/buildlink3.mk"
.include "../../x11/libXcomposite/buildlink3.mk"
.include "../../x11/libXdamage/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXft/buildlink3.mk"
.include "../../x11/libXinerama/buildlink3.mk"
.include "../../x11/libXrender/buildlink3.mk"
.include "../../x11/libXrandr/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.include "../../x11/libXxf86vm/buildlink3.mk"
.include "../../mk/dlopen.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
