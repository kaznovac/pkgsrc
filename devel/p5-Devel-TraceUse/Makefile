# $NetBSD: Makefile,v 1.26 2024/11/16 12:04:08 wiz Exp $

DISTNAME=	Devel-TraceUse-2.097
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	2
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Devel/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Devel-TraceUse
COMMENT=	Show the modules your Perl program loads, recursively
LICENSE=	${PERL5_LICENSE}

PERL5_PACKLIST=		auto/Devel/TraceUse/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
