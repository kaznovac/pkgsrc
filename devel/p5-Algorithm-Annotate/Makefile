# $NetBSD: Makefile,v 1.30 2024/11/16 12:03:36 wiz Exp $

DISTNAME=	Algorithm-Annotate-0.10
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	20
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Algorithm/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Algorithm-Annotate
COMMENT=	Perl module that provides cvs-annotate-like functionality

DEPENDS+=	p5-Algorithm-Diff>=1.15:../../devel/p5-Algorithm-Diff

PERL5_PACKLIST=		auto/Algorithm/Annotate/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
