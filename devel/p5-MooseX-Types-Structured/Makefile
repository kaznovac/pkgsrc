# $NetBSD: Makefile,v 1.33 2024/11/16 12:04:47 wiz Exp $
#

DISTNAME=	MooseX-Types-Structured-0.36
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	7
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=MooseX/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/MooseX-Types-Structured
COMMENT=	Perl 5 module providing structured type constraints for Moose
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-Devel-PartialDump>=0.13:../../devel/p5-Devel-PartialDump
DEPENDS+=	p5-Moose>=1.08:../../devel/p5-Moose
DEPENDS+=	p5-MooseX-Types>=0.22:../../devel/p5-MooseX-Types
DEPENDS+=	p5-Sub-Exporter>=0.982:../../devel/p5-Sub-Exporter

# For test target
TOOL_DEPENDS+=		p5-DateTime-[0-9]*:../../time/p5-DateTime
TOOL_DEPENDS+=		p5-MooseX-Types-DateTime-[0-9]*:../../time/p5-MooseX-Types-DateTime
TOOL_DEPENDS+=		p5-Class-Tiny-[0-9]*:../../devel/p5-Class-Tiny
TOOL_DEPENDS+=		p5-Package-DeprecationManager-[0-9]*:../../devel/p5-Package-DeprecationManager
TOOL_DEPENDS+=		p5-Test-Exception>=0.27:../../devel/p5-Test-Exception
TOOL_DEPENDS+=		p5-Test-Requires-[0-9]*:../../devel/p5-Test-Requires
#TOOL_DEPENDS+=	{perl>=5.11.1,p5-Test-Simple>=0.94}:../../devel/p5-Test-Simple

USE_LANGUAGES=		# empty
PERL5_MODULE_TYPE=	Module::Install::Bundled
PERL5_PACKLIST=		auto/MooseX/Types/Structured/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
