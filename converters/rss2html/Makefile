# $NetBSD: Makefile,v 1.54 2024/11/14 22:18:58 wiz Exp $

DISTNAME=		rss2html-0.8.2
PKGREVISION=		34
CATEGORIES=		converters
MASTER_SITES=		# ftp://ftp.nopcode.org/prj/rss2html/

MAINTAINER=		pkgsrc-users@NetBSD.org
#HOMEPAGE=		http://www.nopcode.org/blog/rss2html.html
COMMENT=		RSS to HTML converter

GNU_CONFIGURE=	YES
USE_TOOLS+=	gmake

INSTALLATION_DIRS+=	bin ${PKGMANDIR}/man1 share/doc/rss2html

LIBS.SunOS+=		-lnsl -lsocket
MAKE_ENV+=		LIBS=${LIBS:M*:Q}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/rss2html ${DESTDIR}${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/doc/rss2html.links ${DESTDIR}${PREFIX}/share/doc/rss2html/
	${INSTALL_DATA} ${WRKSRC}/doc/usage.example ${DESTDIR}${PREFIX}/share/doc/rss2html/
	${INSTALL_DATA} ${WRKSRC}/doc/rss2html.template ${DESTDIR}${PREFIX}/share/doc/rss2html/
	${INSTALL_DATA} ${WRKSRC}/README	${DESTDIR}${PREFIX}/share/doc/rss2html/
	${INSTALL_MAN} ${WRKSRC}/doc/rss2html.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1

.include "../../www/curl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
