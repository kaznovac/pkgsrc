# $NetBSD: Makefile,v 1.24 2024/11/16 12:05:18 wiz Exp $

DISTNAME=	Test-LeakTrace-0.17
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	4
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Test/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Test-LeakTrace
COMMENT=	Perl 5 module to trace memory leaks
LICENSE=	${PERL5_LICENSE}

PERL5_PACKLIST=		auto/Test/LeakTrace/.packlist
PERL5_MODULE_TYPE=	Module::Install::Bundled

post-extract:
	${FIND} ${WRKSRC} -name "*.pm" -type f -exec ${CHMOD} -x {} \;

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
