# $NetBSD: Makefile,v 1.27 2024/11/14 22:21:59 wiz Exp $
#

DISTNAME=	task-2.6.2
PKGNAME=	${DISTNAME:S/task/taskwarrior/}
PKGREVISION=	8
CATEGORIES=	time
MASTER_SITES=	http://www.taskwarrior.org/download/

MAINTAINER=	esg@sdf.lonestar.org
HOMEPAGE=	https://taskwarrior.org/
COMMENT=	Open source, command-line, TODO list manager
LICENSE=	mit

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

USE_CXX_FEATURES+=	c++17

INSTALLATION_DIRS+=	${PKGMANDIR}/man1 ${PKGMANDIR}/man5

CMAKE_CONFIGURE_ARGS+=	-DTASK_MAN1DIR=${PREFIX}/${PKGMANDIR}/man1
CMAKE_CONFIGURE_ARGS+=	-DTASK_MAN5DIR=${PREFIX}/${PKGMANDIR}/man5
CMAKE_CONFIGURE_ARGS+=	-DCMAKE_BUILD_TYPE=release

LDFLAGS.SunOS+=	-lsocket -lnsl

.include "options.mk"

.include "../../devel/libuuid/buildlink3.mk"
.include "../../security/gnutls/buildlink3.mk"
.include "../../mk/termcap.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
