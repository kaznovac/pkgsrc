# $NetBSD: Makefile,v 1.24 2024/11/16 12:04:57 wiz Exp $

DISTNAME=	Perl6-Slurp-0.051005
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	10
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Perl6/}

MAINTAINER=	abs@absd.org
HOMEPAGE=	https://metacpan.org/release/Perl6-Slurp
COMMENT=	Implements the Perl 6 'slurp' built-in
LICENSE=	${PERL5_LICENSE}

USE_LANGUAGES=	# empty
PERL5_PACKLIST=	auto/Perl6/Slurp/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
