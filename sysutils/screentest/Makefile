# $NetBSD: Makefile,v 1.72 2024/12/27 08:20:40 wiz Exp $

DISTNAME=	screentest-2.0
PKGREVISION=	53
CATEGORIES=	sysutils x11
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=screentest/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://screentest.sourceforge.io/
COMMENT=	CRT/LCD screen testing utility using GTK+

GNU_CONFIGURE=		yes
USE_TOOLS+=		pkg-config msgfmt
USE_PKGLOCALEDIR=	yes

INSTALLATION_DIRS+=	share/doc/screentest

post-install:
.for f in AUTHORS ChangeLog NEWS README
	${INSTALL_DATA} ${WRKSRC}/${f} ${DESTDIR}${PREFIX}/share/doc/screentest
.endfor

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/libglade/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
