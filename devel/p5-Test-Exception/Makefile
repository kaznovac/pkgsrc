# $NetBSD: Makefile,v 1.37 2024/11/16 12:05:16 wiz Exp $

DISTNAME=		Test-Exception-0.43
PKGNAME=		p5-${DISTNAME}
PKGREVISION=		9
CATEGORIES=		devel perl5
MASTER_SITES=		${MASTER_SITE_PERL_CPAN:=Test/}

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		https://metacpan.org/release/Test-Exception
COMMENT=		Test exception based code
LICENSE=		${PERL5_LICENSE}

DEPENDS+=		p5-Sub-Uplevel>=0.18:../../devel/p5-Sub-Uplevel

USE_LANGUAGES=		# empty
PERL5_PACKLIST=		auto/Test/Exception/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
