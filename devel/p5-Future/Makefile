# $NetBSD: Makefile,v 1.31 2024/11/16 12:04:19 wiz Exp $

DISTNAME=	Future-0.51
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=../../authors/id/P/PE/PEVANS/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Future
COMMENT=	Represent an operation awaiting completion
LICENSE=	${PERL5_LICENSE}

TEST_DEPENDS+=	p5-Test2-Suite-[0-9]*:../../devel/p5-Test2-Suite

USE_LANGUAGES=		#empty
PERL5_MODULE_TYPE=	Module::Build
PERL5_PACKLIST=		auto/Future/.packlist
PERL5_REQD+=		5.10.1	# Test::More >= 0.88

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
