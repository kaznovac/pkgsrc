# $NetBSD: Makefile,v 1.76 2024/12/29 15:09:53 adam Exp $

PKGNAME=	gnuradio-zeromq-${VERSION}
PKGREVISION=	13
COMMENT=	All of the zeromq blocks, utilities, and examples

.include "../../ham/gnuradio-core/Makefile.common"
.include "../../ham/gnuradio-core/Nocore.mk"

CMAKE_CONFIGURE_ARGS+=	-DENABLE_DEFAULT=OFF
CMAKE_CONFIGURE_ARGS+=	-DENABLE_GR_ZEROMQ=ON
CMAKE_CONFIGURE_ARGS+=	-DZEROMQ_INCLUDE_DIRS=${PREFIX}/include
CMAKE_CONFIGURE_ARGS+=	-DENABLE_GRC=ON

PLIST_MINUS+=	companion

.include "../../net/zeromq/buildlink3.mk"
.include "../../net/cppzmq/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
