# $NetBSD: Makefile,v 1.96 2024/11/16 12:03:23 wiz Exp $

DISTNAME=	DBD-Pg-3.14.2
PKGNAME=	p5-${DISTNAME:C/-Pg-/-postgresql-/}
PKGREVISION=	4
CATEGORIES=	databases perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=DBD/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/DBD-Pg
COMMENT=	Perl DBI/DBD driver for PostgreSQL databases
LICENSE=	${PERL5_LICENSE}

#DEPENDS+=	{p5-version-[0-9]*,perl>=5.10.0}:../../devel/p5-version
DEPENDS+=	p5-DBI>=1.614:../../databases/p5-DBI

PERL5_PACKLIST=	auto/DBD/Pg/.packlist

POSTGRES_INCLUDE=	${PGSQL_PREFIX}/include/postgresql
POSTGRES_LIB=		${PGSQL_PREFIX}/lib
MAKE_ENV+=		POSTGRES_INCLUDE=${POSTGRES_INCLUDE:Q}
MAKE_ENV+=		POSTGRES_LIB=${POSTGRES_LIB:Q}
REPLACE_PERL+=		testme.tmp.pl

.include "../../databases/p5-DBI/buildlink3.mk"
.include "../../lang/perl5/module.mk"
.include "../../mk/pgsql.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
