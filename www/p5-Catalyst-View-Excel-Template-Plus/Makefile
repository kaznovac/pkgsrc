# $NetBSD: Makefile,v 1.22 2024/11/16 12:07:35 wiz Exp $

DISTNAME=	Catalyst-View-Excel-Template-Plus-0.04
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	9
CATEGORIES=	www perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Catalyst/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Catalyst-View-Excel-Template-Plus
COMMENT=	Catalyst View for Excel::Template::Plus
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-Catalyst-Runtime-[0-9]*:../../www/p5-Catalyst-Runtime
DEPENDS+=	p5-Excel-Template-Plus>=0.05:../../math/p5-Excel-Template-Plus
TOOL_DEPENDS+=	p5-Test-Exception>=0.21:../../devel/p5-Test-Exception

USE_LANGUAGES=	# empty
PERL5_PACKLIST=	auto/Catalyst/View/Excel/Template/Plus/.packlist

PERL5_MODULE_TYPE=	Module::Build

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
