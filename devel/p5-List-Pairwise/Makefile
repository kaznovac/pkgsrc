# $NetBSD: Makefile,v 1.13 2024/11/16 12:04:29 wiz Exp $
#

DISTNAME=	List-Pairwise-1.03
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	10
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=List/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/List-Pairwise
COMMENT=	(Perl Module) List::Pairwise - map/grep arrays and hashes pairwise
LICENSE=	${PERL5_LICENSE}

MAKE_ENV+=	PERL_USE_UNSAFE_INC=1
PERL5_PACKLIST=	auto/List/Pairwise/.packlist
USE_LANGUAGES=	# none

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
