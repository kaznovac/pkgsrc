# $NetBSD: Makefile,v 1.45 2024/11/19 22:46:10 adam Exp $

DISTNAME=	qtcharts-everywhere-opensource-src-${QTVERSION}
PKGNAME=	qt5-qtcharts-${QTVERSION}
COMMENT=	Qt5 module for charts framework

BUILD_TARGET=		sub-src
INSTALL_ENV+=		INSTALL_ROOT=${DESTDIR}
INSTALLATION_DIRS+=	lib/pkgconfig

.include "../../x11/qt5-qtbase/Makefile.common"

post-install:
.for i in Qt5Charts.pc
	cd ${DESTDIR}${PREFIX}/lib/pkgconfig && \
	${LN} -f -s ${QTPREFIX}/lib/pkgconfig/${i} ${i}
.endfor

.include "../../x11/qt5-qtdeclarative/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
