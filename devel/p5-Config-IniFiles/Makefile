# $NetBSD: Makefile,v 1.63 2024/11/16 12:03:55 wiz Exp $

DISTNAME=	Config-IniFiles-3.000003
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	5
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Config/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Config-IniFiles
COMMENT=	Perl module for reading .ini-style configuration files
LICENSE=	${PERL5_LICENSE}

DEPENDS+=		p5-IO-stringy-[0-9]*:../../devel/p5-IO-stringy
DEPENDS+=		p5-List-MoreUtils>=0.33:../../devel/p5-List-MoreUtils

PERL5_MODULE_TYPE=	Module::Build
PERL5_PACKLIST=		auto/Config/IniFiles/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
