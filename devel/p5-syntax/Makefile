# $NetBSD: Makefile,v 1.16 2024/11/16 12:05:35 wiz Exp $
#

DISTNAME=	syntax-0.004
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	13
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=../../authors/id/P/PH/PHAYLON/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/syntax
COMMENT=	Perl 5 pragma to activate syntax extensions
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-Data-OptList>=0.104:../../devel/p5-Data-OptList
DEPENDS+=	p5-namespace-clean-[0-9]*:../../devel/p5-namespace-clean

USE_LANGUAGES=	# empty
PERL5_PACKLIST=	auto/syntax/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
