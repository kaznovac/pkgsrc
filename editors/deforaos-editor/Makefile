# $NetBSD: Makefile,v 1.41 2024/12/27 08:19:38 wiz Exp $
#

DISTNAME=	Editor-0.4.1
PKGNAME=	deforaos-editor-0.4.1
PKGREVISION=	15
CATEGORIES=	editors
MASTER_SITES=	https://ftp.defora.org/pub/DeforaOS/Apps/Desktop/src/Editor/

MAINTAINER=	khorben@defora.org
HOMEPAGE=	https://www.defora.org/
COMMENT=	DeforaOS desktop text editor

LICENSE=	2-clause-bsd

USE_TOOLS+=	pkg-config
USE_TOOLS+=	xgettext

MAKE_FLAGS+=	DESTDIR=${DESTDIR}
MAKE_FLAGS+=	PREFIX=${PREFIX}
MAKE_FLAGS+=	CFLAGS=${CFLAGS:Q}
MAKE_FLAGS+=	LDFLAGS=${LDFLAGS:Q}
AUTO_MKDIRS=	yes

.include "../../mk/bsd.prefs.mk"

.if ${PKGMANDIR} != "share/man"
post-install:
	${MV} ${DESTDIR}${PREFIX}/share/man/html1/editor.html ${DESTDIR}${PREFIX}/${PKGMANDIR}/html1/editor.html
	${MV} ${DESTDIR}${PREFIX}/share/man/html1/filter.html ${DESTDIR}${PREFIX}/${PKGMANDIR}/html1/filter.html
	${MV} ${DESTDIR}${PREFIX}/share/man/man1/editor.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/editor.1
	${MV} ${DESTDIR}${PREFIX}/share/man/man1/filter.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/filter.1
	${RMDIR} ${DESTDIR}${PREFIX}/share/man/html1
	${RMDIR} ${DESTDIR}${PREFIX}/share/man/man1
	${RMDIR} ${DESTDIR}${PREFIX}/share/man
.endif

.include "options.mk"

TOOL_DEPENDS+=	docbook-xsl-[0-9]*:../../textproc/docbook-xsl
TOOL_DEPENDS+=	libxslt-[0-9]*:../../textproc/libxslt

.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../textproc/libxslt/xsltproc-nonet.mk"
.include "../../x11/deforaos-libdesktop/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
