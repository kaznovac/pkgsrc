# $NetBSD: Makefile,v 1.27 2024/11/16 12:04:43 wiz Exp $

DISTNAME=	MooseX-Emulate-Class-Accessor-Fast-0.009032
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	7
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=MooseX/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/MooseX-Emulate-Class-Accessor-Fast
COMMENT=	Emulate Class::Accessor::Fast behavior using Moose attributes
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-Moose>=0.84:../../devel/p5-Moose
DEPENDS+=	p5-namespace-clean-[0-9]*:../../devel/p5-namespace-clean

TOOL_DEPENDS+=	p5-Test-Exception-[0-9]*:../../devel/p5-Test-Exception

PERL5_PACKLIST=		auto/MooseX/Emulate/Class/Accessor/Fast/.packlist
PERL5_MODULE_TYPE=	Module::Install::Bundled

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
