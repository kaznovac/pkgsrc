# $NetBSD: Makefile,v 1.5 2024/11/16 12:05:26 wiz Exp $

DISTNAME=		Tie-CPHash-2.000
PKGNAME=		p5-${DISTNAME}
PKGREVISION=		4
CATEGORIES=		devel perl5
MASTER_SITES=		${MASTER_SITE_PERL_CPAN:=Tie/}

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		https://metacpan.org/release/Tie-CPHash/
COMMENT=		Case preserving but case insensitive hash table
LICENSE=		${PERL5_LICENSE}

PERL5_PACKLIST=		auto/Tie/CPHash/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
