# $NetBSD: Makefile,v 1.9 2024/11/16 12:04:55 wiz Exp $

DISTNAME=	Path-Iter-0.2
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	7
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=../../authors/id/D/DM/DMUEY/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Path-Iter
COMMENT=	Perl module for simple efficient path iteration
LICENSE=	${PERL5_LICENSE}

PERL5_PACKLIST=		auto/Path/Iter/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
