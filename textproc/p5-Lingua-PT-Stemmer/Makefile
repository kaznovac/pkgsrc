# $NetBSD: Makefile,v 1.19 2024/11/16 12:06:46 wiz Exp $

DISTNAME=	Lingua-PT-Stemmer-0.02
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	8
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Lingua/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Lingua-PT-Stemmer
COMMENT=	Perl5 modules for Galician and Portuguese language stemming
LICENSE=	${PERL5_LICENSE}

PERL5_PACKLIST=	auto/Lingua/PT/Stemmer/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
