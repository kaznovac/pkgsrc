# $NetBSD: Makefile,v 1.32 2024/11/14 22:22:30 wiz Exp $

DISTNAME=		qt5ct-1.8
PKGREVISION=		3
CATEGORIES=		x11
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=qt5ct/}
EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		https://sourceforge.net/projects/qt5ct/files/
COMMENT=		Tool for customizing Qt5-apps outside KDE
LICENSE=		2-clause-bsd

USE_TOOLS=		pkg-config
USE_LANGUAGES=		c c++

INSTALL_MAKE_FLAGS+=	INSTALL_ROOT=${DESTDIR}

do-configure:
	cd ${WRKSRC} && \
	${SETENV} ${CONFIGURE_ENV} \
	${QTDIR}/bin/qmake -o Makefile PREFIX=${PREFIX}

TOOL_DEPENDS+=		qt5-qttools-[0-9]*:../../x11/qt5-qttools

.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../x11/qt5-qtsvg/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
