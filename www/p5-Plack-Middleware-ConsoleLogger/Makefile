# $NetBSD: Makefile,v 1.26 2024/11/16 12:07:56 wiz Exp $

DISTNAME=	Plack-Middleware-ConsoleLogger-0.05
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	9
CATEGORIES=	www perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Plack/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Plack-Middleware-ConsoleLogger
COMMENT=	Plack middleware to write logs to Firebug or Webkit Inspector
LICENSE=	${PERL5_LICENSE}

USE_LANGUAGES=		# empty
PERL5_PACKLIST=		auto/Plack/Middleware/ConsoleLogger/.packlist
PERL5_MODULE_TYPE=	Module::Build::Tiny

TOOL_DEPENDS+=	p5-Test-Requires-[0-9]*:../../devel/p5-Test-Requires
DEPENDS+=	p5-Plack>=0.99:../../www/p5-Plack
#DEPENDS+=	{perl>=5.10.1,p5-parent-[0-9]*}:../../devel/p5-parent
DEPENDS+=	p5-JavaScript-Value-Escape-[0-9]*:../../www/p5-JavaScript-Value-Escape

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
