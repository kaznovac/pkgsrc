# $NetBSD: Makefile,v 1.20 2024/11/16 12:07:33 wiz Exp $

DISTNAME=	Catalyst-Plugin-Authentication-Store-RDBO-0.002
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	17
CATEGORIES=	www databases perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Catalyst/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/pod/Catalyst::Plugin::Authentication::Store::RDBO
COMMENT=	Authentication and authorization against a Rose::DB::Object

DEPENDS+=	p5-Catalyst-Plugin-Authentication>=0:../../www/p5-Catalyst-Plugin-Authentication
DEPENDS+=	p5-Rose-DB-Object>=0:../../databases/p5-Rose-DB-Object
DEPENDS+=	p5-Set-Object>=0:../../devel/p5-Set-Object

USE_LANGUAGES=	# empty
PERL5_PACKLIST=	auto/Catalyst/Plugin/Authentication/Store/RDBO/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
