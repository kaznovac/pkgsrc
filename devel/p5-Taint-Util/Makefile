# $NetBSD: Makefile,v 1.12 2024/11/16 12:05:09 wiz Exp $

DISTNAME=	Taint-Util-0.08
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	8
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=../../authors/id/A/AV/AVAR/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/pod/Taint::Util
COMMENT=	Perl5 test for and flip the taint flag without regex matches or eval
LICENSE=	${PERL5_LICENSE}

PERL5_PACKLIST=	auto/Taint/Util/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
