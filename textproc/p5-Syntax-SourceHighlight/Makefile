# $NetBSD: Makefile,v 1.39 2024/12/29 15:10:00 adam Exp $

DISTNAME=	Syntax-SourceHighlight-2.1.3
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	5
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=../../authors/id/M/MA/MATLIB/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Syntax-SourceHighlight
COMMENT=	Perl binding to GNU source-highlight
LICENSE=	public-domain

TOOL_DEPENDS+=	p5-ExtUtils-PkgConfig>=1.12:../../devel/p5-ExtUtils-PkgConfig

PERL5_PACKLIST=	auto/Syntax/SourceHighlight/.packlist

USE_TOOLS+=	pkg-config

.include "../../lang/perl5/module.mk"
.include "../../textproc/source-highlight/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
