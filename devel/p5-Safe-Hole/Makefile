# $NetBSD: Makefile,v 1.34 2024/11/16 12:05:02 wiz Exp $

DISTNAME=	Safe-Hole-0.14
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	7
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Safe/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Safe-Hole
COMMENT=	Exec subs in the original package from within a Safe object
LICENSE=	${PERL5_LICENSE}

PERL5_PACKLIST=		auto/Safe/Hole/.packlist
PERL5_MODULE_TYPE=	Module::Build

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
