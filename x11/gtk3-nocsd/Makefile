# $NetBSD: Makefile,v 1.12 2024/12/27 08:20:56 wiz Exp $

DISTNAME=	gtk3-nocsd-3.0.8
PKGREVISION=	11
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_GITHUB:=ZaWertun/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/ZaWertun/gtk3-nocsd
COMMENT=	Hack to disable GTK+ 3 client side window decorations
LICENSE=	gnu-lgpl-v2.1

USE_TOOLS+=	gmake pkg-config

INSTALLATION_DIRS+=	bin lib
INSTALLATION_DIRS+=	${PKGMANDIR}/man1
INSTALLATION_DIRS+=	share/bash-completion/completions

do-install:
	${INSTALL_LIB} ${WRKSRC}/libgtk3-nocsd.so.0 \
	    ${DESTDIR}${PREFIX}/lib/libgtk3-nocsd.so.0
	${INSTALL_SCRIPT} ${WRKSRC}/gtk3-nocsd \
	    ${DESTDIR}${PREFIX}/bin/gtk3-nocsd
	${INSTALL_MAN} ${WRKSRC}/gtk3-nocsd.1 \
	    ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/gtk3-nocsd.1
	${INSTALL_DATA} ${WRKSRC}/gtk3-nocsd.bash-completion \
	    ${DESTDIR}${PREFIX}/share/bash-completion/completions/gtk3-nocsd

.include "../../devel/gobject-introspection/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../mk/dlopen.buildlink3.mk"
BUILDLINK_TRANSFORM+=	opt:-ldl:${BUILDLINK_LDADD.dl:Q}
.include "../../mk/bsd.pkg.mk"
