# $NetBSD: Makefile,v 1.34 2024/11/16 12:04:48 wiz Exp $
#

DISTNAME=	Net-CIDR-0.21
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	3
CATEGORIES=	devel net perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Net/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Net-CIDR
COMMENT=	Perl5 module to manipulate IPv4/IPv6 netblocks in CIDR notation
LICENSE=	${PERL5_LICENSE}

USE_LANGUAGES=		# empty
PERL5_PACKLIST=		auto/Net/CIDR/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
