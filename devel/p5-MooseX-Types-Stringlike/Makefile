# $NetBSD: Makefile,v 1.18 2024/11/16 12:04:47 wiz Exp $
#

DISTNAME=	MooseX-Types-Stringlike-0.003
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	10
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=MooseX/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/MooseX-Types-Stringlike
COMMENT=	Commonly-used type constraints that do not ship with Moose by default
LICENSE=	apache-2.0

DEPENDS+=	p5-MooseX-Types-[0-9]*:../../devel/p5-MooseX-Types
# for make test
TOOL_DEPENDS+=	p5-Package-DeprecationManager-[0-9]*:../../devel/p5-Package-DeprecationManager

USE_LANGUAGES=		# empty
PERL5_PACKLIST=		auto/MooseX/Types/Stringlike/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
