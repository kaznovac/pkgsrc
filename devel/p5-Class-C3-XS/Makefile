# $NetBSD: Makefile,v 1.24 2024/11/16 12:03:48 wiz Exp $

DISTNAME=	Class-C3-XS-0.15
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	devel perl5
PKGREVISION=	8
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Class/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Class-C3-XS
COMMENT=	XS speedups for Class::C3
LICENSE=	${PERL5_LICENSE}

USE_LANGUAGES=		c
PERL5_PACKLIST=		auto/Class/C3/XS/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
