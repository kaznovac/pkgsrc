# $NetBSD: Makefile,v 1.12 2024/11/16 12:04:30 wiz Exp $

DISTNAME=	Log-Any-Adapter-Callback-0.102
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Log/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Log-Any-Adapter-Callback/
COMMENT=	Perl5 module to send Log::Any logs to a subroutine
LICENSE=	${PERL5_LICENSE}

TEST_DEPENDS+=	p5-Log-Any-[0-9]*:../../devel/p5-Log-Any

PERL5_PACKLIST=		auto/Log/Any/Adapter/Callback/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
