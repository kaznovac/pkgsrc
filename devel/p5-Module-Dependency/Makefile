# $NetBSD: Makefile,v 1.31 2024/11/16 12:04:35 wiz Exp $
#

DISTNAME=	Module-Dependency-1.86
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	15
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Module/}

MAINTAINER=	pkgsrc-users@NetBSD.org
COMMENT=	Build perl program/module dependency graph
LICENSE=	gnu-gpl-v2 # OR artistic

DEPENDS+=	p5-GD>=1.32nb1:../../graphics/p5-GD
DEPENDS+=	p5-PostScript-Simple-[0-9]*:../../print/p5-PostScript-Simple
DEPENDS+=	p5-SVG-[0-9]*:../../graphics/p5-SVG

REPLACE_PERL+=	pmd_dump.pl pmd_indexer.plx pmd_grapher.plx

PERL5_PACKLIST=		auto/Module/Dependency/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
