# $NetBSD: Makefile,v 1.20 2024/11/16 12:03:52 wiz Exp $

DISTNAME=	Class-XML-0.06
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	16
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Class/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Class-XML
COMMENT=	Perl 5 module providing a simple XML abstraction
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-Class-Accessor>=0.19:../../devel/p5-Class-Accessor
DEPENDS+=	p5-Class-Data-Inheritable>=0.02:../../devel/p5-Class-Data-Inheritable
DEPENDS+=	p5-XML-XPath>=1.13:../../textproc/p5-XML-XPath

USE_LANGUAGES=		# empty
PERL5_MODULE_TYPE=	Module::Build
PERL5_PACKLIST=		auto/Class/XML/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
