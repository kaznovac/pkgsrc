# $NetBSD: Makefile,v 1.44 2024/11/16 12:03:17 wiz Exp $

DISTNAME=	JSON-XS-4.03
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	4
CATEGORIES=	converters perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=JSON/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/JSON-XS
COMMENT=	JSON serialising/deserialising, done correctly and fast
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-common-sense>=0:../../devel/p5-common-sense
DEPENDS+=	p5-Canary-Stability>=0:../../devel/p5-Canary-Stability
DEPENDS+=	p5-Types-Serialiser>=0:../../devel/p5-Types-Serialiser

PERL5_PACKLIST=	auto/JSON/XS/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
