# $NetBSD: Makefile,v 1.34 2024/11/16 12:04:42 wiz Exp $
#

DISTNAME=	MooseX-ClassAttribute-0.29
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	9
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=MooseX/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/MooseX-ClassAttribute
COMMENT=	Perl 5 module to declare class attributes Moose-style
LICENSE=	artistic-2.0

USE_LANGUAGES=	# empty
PERL5_PACKLIST=	auto/MooseX/ClassAttribute/.packlist

DEPENDS+=	p5-Moose>=2.00:../../devel/p5-Moose
DEPENDS+=	p5-namespace-autoclean>=0.11:../../devel/p5-namespace-autoclean

#TOOL_DEPENDS+=	{perl>=5.10.1,p5-Test-Simple>=0.88}:../../devel/p5-Test-Simple
# for make test
#TOOL_DEPENDS+=	p5-MooseX-Role-Strict-[0-9]*:../../devel/p5-MooseX-Role-Strict 
TOOL_DEPENDS+=		p5-Package-DeprecationManager-[0-9]*:../../devel/p5-Package-DeprecationManager
TOOL_DEPENDS+=		p5-Test-Requires-[0-9]*:../../devel/p5-Test-Requires

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
