# $NetBSD: Makefile,v 1.2 2024/11/16 12:03:58 wiz Exp $

DISTNAME=	Data-Float-0.013
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Data/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/pod/Data::Float
COMMENT=	Perl module for floating point data
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-Carp>=0:../../devel/p5-Carp

PERL5_MODULE_TYPE=	Module::Build
PERL5_PACKLIST=		auto/Data/Float/.packlist
USE_LANGUAGES=		# none

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
