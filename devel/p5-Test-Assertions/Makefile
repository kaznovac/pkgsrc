# $NetBSD: Makefile,v 1.20 2024/11/16 12:05:13 wiz Exp $
#

DISTNAME=	Test-Assertions-1.054
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	16
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Test/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Test-Assertions
COMMENT=	Perl 5 module prodiving building blocks for unit and runtime testing
LICENSE=	gnu-gpl-v2

USE_TOOLS+=	perl	# for test target
USE_LANGUAGES=	# empty
PERL5_PACKLIST=	auto/Test/Assertions/.packlist

DEPENDS+=	p5-Log-Trace-[0-9]*:../../devel/p5-Log-Trace

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
