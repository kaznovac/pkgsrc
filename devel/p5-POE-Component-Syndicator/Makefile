# $NetBSD: Makefile,v 1.17 2024/11/16 12:04:51 wiz Exp $

DISTNAME=	POE-Component-Syndicator-0.06
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	13
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=POE/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/POE-Component-Syndicator
COMMENT=	POE component base class which implements the Observer pattern
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-POE>=1.311:../../devel/p5-POE
DEPENDS+=	p5-Object-Pluggable>=1.29:../../devel/p5-Object-Pluggable

USE_LANGUAGES=	# empty
PERL5_PACKLIST=	auto/POE/Component/Syndicator/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
