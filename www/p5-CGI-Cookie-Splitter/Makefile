# $NetBSD: Makefile,v 1.23 2024/11/16 12:07:28 wiz Exp $

DISTNAME=	CGI-Cookie-Splitter-0.05
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	9
CATEGORIES=	www perl5
MASTER_SITES+=	${MASTER_SITE_PERL_CPAN:=CGI/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/CGI-Cookie-Splitter
COMMENT=	Perl5 module for splitting big cookies into smaller ones
LICENSE=	${PERL5_LICENSE}

USE_LANGUAGES=	# empty
PERL5_PACKLIST=	auto/CGI/Cookie/Splitter/.packlist

DEPENDS+=	p5-CGI-Simple-[0-9]*:../../www/p5-CGI-Simple

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
