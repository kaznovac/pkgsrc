# $NetBSD: Makefile,v 1.19 2024/11/16 12:03:26 wiz Exp $

DISTNAME=	DBIx-Class-Loader-0.21
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	16
CATEGORIES=	databases perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=DBIx/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/DBIx-Class-Loader
COMMENT=	Dynamic definition of DBIx::Class sub classes

DEPENDS+=	p5-DBI>=1.3:../../databases/p5-DBI
DEPENDS+=	p5-DBIx-Class>=0.04001:../../databases/p5-DBIx-Class
DEPENDS+=	p5-Lingua-EN-Inflect>=0:../../textproc/p5-Lingua-EN-Inflect
DEPENDS+=	p5-Text-Balanced>=0:../../textproc/p5-Text-Balanced
DEPENDS+=	p5-UNIVERSAL-require>=0.10:../../devel/p5-UNIVERSAL-require

USE_LANGUAGES=	# empty
PERL5_PACKLIST=	auto/DBIx/Class/Loader/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
