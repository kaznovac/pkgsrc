# $NetBSD: Makefile,v 1.7 2024/11/16 12:04:34 wiz Exp $

DISTNAME=		Metrics-Any-0.10
PKGNAME=		p5-${DISTNAME}
PKGREVISION=		1
CATEGORIES=		devel perl5
MASTER_SITES=		${MASTER_SITE_PERL_CPAN:=../../authors/id/P/PE/PEVANS/}

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		https://metacpan.org/pod/Metrics::Any
COMMENT=		Abstract collection of monitoring metrics
LICENSE=		${PERL5_LICENSE}

TEST_DEPENDS+=		p5-Test-Fatal-[0-9]*:../../devel/p5-Test-Fatal

USE_LANGUAGES=		# empty
PERL5_PACKLIST=		auto/Metrics/Any/.packlist
PERL5_MODULE_TYPE=	Module::Build

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
