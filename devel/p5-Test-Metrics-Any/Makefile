# $NetBSD: Makefile,v 1.5 2024/11/16 12:05:19 wiz Exp $

DISTNAME=		Test-Metrics-Any-0.01
PKGNAME=		p5-${DISTNAME}
PKGREVISION=		4
CATEGORIES=		devel perl5
MASTER_SITES=		${MASTER_SITE_PERL_CPAN:=Test/}

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		https://metacpan.org/pod/Test::Metrics::Any
COMMENT=		Assert that code produces metrics via Metrics::Any
LICENSE=		${PERL5_LICENSE}

DEPENDS+=		p5-Metrics-Any-[0-9]*:../../devel/p5-Metrics-Any

USE_LANGUAGES=		# empty
PERL5_PACKLIST=		auto/Test/Metrics/Any/.packlist
PERL5_MODULE_TYPE=	Module::Build

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
