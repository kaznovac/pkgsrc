# $NetBSD: Makefile,v 1.34 2024/11/16 12:04:15 wiz Exp $

DISTNAME=	File-Flat-1.07
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	4
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=File/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/File-Flat
COMMENT=	Implements a flat file system
LICENSE=	${PERL5_LICENSE}

TOOL_DEPENDS+=	p5-Test-ClassAPI>=1.02:../../devel/p5-Test-ClassAPI
DEPENDS+=	p5-File-Remove>=0.21:../../sysutils/p5-File-Remove
#DEPENDS+=	{perl>=5.6.2,p5-File-Temp>=0.14}:../../devel/p5-File-Temp
DEPENDS+=	p5-File-Copy-Recursive>=0.28:../../sysutils/p5-File-Copy-Recursive
DEPENDS+=	p5-prefork>=0.02:../../devel/p5-prefork

PERL5_PACKLIST=		auto/File/Flat/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
