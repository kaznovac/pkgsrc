# $NetBSD: Makefile,v 1.31 2024/11/16 12:03:50 wiz Exp $

DISTNAME=	Class-Load-0.25
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	7
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Class/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Class-Load
COMMENT=	Provide a working (require "Class::Name") and more
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-Data-OptList-[0-9]*:../../devel/p5-Data-OptList
DEPENDS+=	p5-Module-Implementation>=0.04:../../devel/p5-Module-Implementation
DEPENDS+=	p5-Module-Runtime>=0.012:../../devel/p5-Module-Runtime
DEPENDS+=	p5-Package-Stash>=0.32:../../devel/p5-Package-Stash
DEPENDS+=	p5-Try-Tiny-[0-9]*:../../devel/p5-Try-Tiny

TOOL_DEPENDS+=	p5-Test-Fatal-[0-9]*:../../devel/p5-Test-Fatal
TOOL_DEPENDS+=	p5-Test-Needs-[0-9]*:../../devel/p5-Test-Needs
TOOL_DEPENDS+=	p5-Test-Requires-[0-9]*:../../devel/p5-Test-Requires

USE_LANGUAGES=		# empty
PERL5_PACKLIST=		auto/Class/Load/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
