# $NetBSD: Makefile,v 1.41 2024/11/16 12:06:56 wiz Exp $

DISTNAME=	Text-Autoformat-1.75
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	6
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Text/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Text-Autoformat
COMMENT=	Perl module for text wrapping and reformatting
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-Text-Reform>=1.11:../../textproc/p5-Text-Reform

PERL5_PACKLIST=		auto/Text/Autoformat/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
