# $NetBSD: Makefile,v 1.3 2024/12/14 16:02:51 rillig Exp $

DISTNAME=	Hash-Ordered-0.014
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Hash/}

MAINTAINER=	wen@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Hash-Ordered
COMMENT=	Fast, pure-Perl ordered hash class
LICENSE=	${PERL5_LICENSE}

TEST_DEPENDS+=	p5-Test-Deep>=0:../../devel/p5-Test-Deep
TEST_DEPENDS+=	p5-Test-FailWarnings>=0:../../devel/p5-Test-FailWarnings
TEST_DEPENDS+=	p5-Test-Fatal>=0:../../devel/p5-Test-Fatal

USE_LANGUAGES=	# empty
PERL5_PACKLIST=	auto/Hash/Ordered/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
