# $NetBSD: Makefile,v 1.17 2024/11/16 12:07:35 wiz Exp $

DISTNAME=	Catalyst-Plugin-StatusMessage-1.002000
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	10
CATEGORIES=	www perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Catalyst/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Catalyst-Plugin-StatusMessage
COMMENT=	Handle passing of status messages between screens of a web application
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-Catalyst-Runtime>=5.71001:../../www/p5-Catalyst-Runtime

USE_LANGUAGES=		# empty
PERL5_PACKLIST=		auto/Catalyst/Plugin/StatusMessage/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
