# $NetBSD: Makefile,v 1.42 2024/11/16 12:06:05 wiz Exp $
#

DISTNAME=		Locale-Maketext-Lexicon-1.00
PKGNAME=		p5-${DISTNAME}
PKGREVISION=		10
CATEGORIES=		misc perl5
MASTER_SITES=		${MASTER_SITE_PERL_CPAN:=Locale/}

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		https://metacpan.org/release/Locale-Maketext-Lexicon
COMMENT=		Use other catalog formats in Maketext
LICENSE=		mit

#DEPENDS+=		{perl>=5.8.0,p5-Locale-Maketext-[0-8]*}:../../misc/p5-Locale-Maketext

USE_LANGUAGES=		# empty
PERL5_PACKLIST=		auto/Locale/Maketext/Lexicon/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
