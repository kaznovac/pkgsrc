# $NetBSD: Makefile,v 1.20 2024/11/16 12:08:04 wiz Exp $

DISTNAME=	WWW-Mechanize-GZip-0.14
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	7
CATEGORIES=	www perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=WWW/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/WWW-Mechanize-GZip
COMMENT=	Perl 5 module to fetch webpages with gzip-compression
LICENSE=	${PERL5_LICENSE}

USE_LANGUAGES=	# empty
PERL5_PACKLIST=	auto/WWW/Mechanize/GZip/.packlist

DEPENDS+=	p5-Test-WWW-Mechanize-[0-9]*:../../www/p5-Test-WWW-Mechanize

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
