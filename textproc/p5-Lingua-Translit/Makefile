# $NetBSD: Makefile,v 1.11 2024/11/16 12:06:47 wiz Exp $

DISTNAME=	Lingua-Translit-0.29
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	2
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=../../authors/id/A/AL/ALINKE/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Lingua-Translit
COMMENT=	Transliterates text between writing systems
LICENSE=	${PERL5_LICENSE}

USE_LANGUAGES=	# none

PERL5_PACKLIST=		auto/Lingua/Translit/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
