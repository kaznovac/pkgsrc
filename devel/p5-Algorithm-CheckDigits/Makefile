# $NetBSD: Makefile,v 1.27 2024/11/16 12:03:36 wiz Exp $

DISTNAME=	Algorithm-CheckDigits-v1.3.6
PKGNAME=	p5-${DISTNAME:S/-v/-/}
PKGREVISION=	2
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Algorithm/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Algorithm-CheckDigits
COMMENT=	Perl extension to generate and test check digits
LICENSE=	${PERL5_LICENSE}

TOOL_DEPENDS+=	p5-Probe-Perl-[0-9]*:../../devel/p5-Probe-Perl

USE_LANGUAGES=	# empty
PERL5_PACKLIST=	auto/Algorithm/CheckDigits/.packlist

PERL5_MODULE_TYPE=	Module::Build

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
