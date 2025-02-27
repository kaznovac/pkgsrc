# $NetBSD: Makefile,v 1.42 2024/12/27 08:19:18 wiz Exp $

DISTNAME=	Mixer-0.4.1
PKGNAME=	deforaos-mixer-0.4.1
PKGREVISION=	11
CATEGORIES=	audio
MASTER_SITES=	https://ftp.defora.org/pub/DeforaOS/Apps/Desktop/src/Mixer/

MAINTAINER=	khorben@defora.org
HOMEPAGE=	https://www.defora.org/
COMMENT=	DeforaOS desktop volume mixer

LICENSE=	2-clause-bsd

USE_TOOLS+=	pkg-config
USE_TOOLS+=	xgettext

TOOL_DEPENDS+=	libxslt-[0-9]*:../../textproc/libxslt
TOOL_DEPENDS+=	docbook-xsl-[0-9]*:../../textproc/docbook-xsl

CFLAGS+=	-fPIC

MAKE_FLAGS+=	DESTDIR=${DESTDIR}
MAKE_FLAGS+=	PREFIX=${PREFIX}
MAKE_FLAGS+=	CFLAGS=${CFLAGS:Q}
MAKE_FLAGS+=	LDFLAGS=${LDFLAGS:Q}
AUTO_MKDIRS=	yes

.include "../../mk/bsd.prefs.mk"

.if ${PKGMANDIR} != "share/man"
post-install:
	${MV} ${DESTDIR}${PREFIX}/share/man/html1/mixer.html ${DESTDIR}${PREFIX}/${PKGMANDIR}/html1/mixer.html
	${MV} ${DESTDIR}${PREFIX}/share/man/man1/mixer.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/mixer.1
	${RMDIR} ${DESTDIR}${PREFIX}/share/man/html1
	${RMDIR} ${DESTDIR}${PREFIX}/share/man/man1
	${RMDIR} ${DESTDIR}${PREFIX}/share/man
.endif

.include "options.mk"

.include "../../devel/deforaos-configure/deforaos-configure.mk"
.include "../../x11/deforaos-libdesktop/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/bsd.pkg.mk"
