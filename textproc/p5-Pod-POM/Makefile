# $NetBSD: Makefile,v 1.44 2024/11/16 12:06:50 wiz Exp $

DISTNAME=	Pod-POM-2.01
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	9
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Pod/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Pod-POM
COMMENT=	Perl module to format POD into an object format
LICENSE=	${PERL5_LICENSE}

TOOL_DEPENDS+=		p5-File-Slurper-[0-9]*:../../devel/p5-File-Slurper

USE_LANGUAGES=		# empty

PERL5_PACKLIST=		auto/Pod/POM/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
