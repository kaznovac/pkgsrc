# $NetBSD: Makefile,v 1.47 2024/11/16 12:05:43 wiz Exp $

DISTNAME=	GraphViz-2.24
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	7
CATEGORIES=	graphics perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=../../authors/id/R/RS/RSAVAGE/}
EXTRACT_SUFX=	.tgz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/GraphViz
COMMENT=	Perl interface to the Graphviz tools set
LICENSE=	${PERL5_LICENSE}

# This is for the 'test' target
TOOL_DEPENDS+=	p5-Test-Pod-[0-9]*:../../devel/p5-Test-Pod
TOOL_DEPENDS+=	p5-File-Which-[0-9]*:../../devel/p5-File-Which

USE_TOOLS+=	pax

DEPENDS+=	p5-IPC-Run>=0.6:../../devel/p5-IPC-Run
DEPENDS+=	graphviz-[0-9]*:../../graphics/graphviz

PERL5_PACKLIST=		auto/GraphViz/.packlist
INSTALLATION_DIRS=	share/examples/p5-GraphViz

REPLACE_PERL+=	examples/*

post-install:
	cd ${WRKSRC}/examples &&	\
	  pax -pm -rw . ${DESTDIR}${PREFIX}/share/examples/p5-GraphViz

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
