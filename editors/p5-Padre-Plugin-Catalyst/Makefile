# $NetBSD: Makefile,v 1.23 2024/11/16 12:05:36 wiz Exp $

DISTNAME=	Padre-Plugin-Catalyst-0.13
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	7
CATEGORIES=	editors perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Padre/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Padre-Plugin-Catalyst
COMMENT=	Catalyst helper interface for Padre
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-Catalyst-Devel>=1:../../www/p5-Catalyst-Devel
DEPENDS+=	p5-Catalyst-Runtime>=5.70000:../../www/p5-Catalyst-Runtime
DEPENDS+=	p5-Padre>=0.51:../../editors/p5-Padre
DEPENDS+=	p5-Task-CatInABox>=0.03:../../www/p5-Task-CatInABox
DEPENDS+=	p5-Task-Catalyst-Tutorial>=0.06:../../www/p5-Task-Catalyst-Tutorial

TOOL_DEPENDS+=	p5-Locale-Msgfmt>=0.14:../../devel/p5-Locale-Msgfmt
TOOL_DEPENDS+=	p5-Module-Pluggable>=3.9:../../devel/p5-Module-Pluggable

PERL5_PACKLIST=		auto/Padre/Plugin/Catalyst/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
