# $NetBSD: Makefile,v 1.9 2024/11/16 12:04:03 wiz Exp $

DISTNAME=	Devel-Caller-IgnoreNamespaces-1.1
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	7
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Devel/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Devel-Caller-IgnoreNamespaces
COMMENT=	Provide caller that ignores specific namespaces
LICENSE=	artistic OR gnu-gpl-v2

#USE_LANGUAGES=		c
PERL5_PACKLIST=		auto/Devel/Caller/IgnoreNamespaces/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
