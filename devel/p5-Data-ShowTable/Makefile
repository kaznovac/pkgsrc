# $NetBSD: Makefile,v 1.36 2024/11/16 12:04:00 wiz Exp $

DISTNAME=	Data-ShowTable-4.6
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	10
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Data/}

MAINTAINER=	bad@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Data-ShowTable
COMMENT=	Perl module to print arrays of data in nicely formatted listings
LICENSE=	gnu-gpl-v2

PERL5_PACKLIST=		auto/Data/ShowTable/.packlist
REPLACE_PERL+=		showtable

pre-configure:
	${FIND} ${WRKSRC} -name "*.orig" -type f -exec ${RM} {} \;

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
