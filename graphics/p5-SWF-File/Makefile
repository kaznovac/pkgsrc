# $NetBSD: Makefile,v 1.32 2024/11/16 12:05:45 wiz Exp $
#

DISTNAME=	SWF-File-0.42
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	18
CATEGORIES=	graphics www perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=../../authors/id/Y/YS/YSAS/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/SWF-File
COMMENT=	Manipulating Flash movie (SWF) files

DEPENDS+=	p5-Data-TemporaryBag-[0-9]*:../../devel/p5-Data-TemporaryBag
#DEPENDS+=	{perl>=5.9.3,p5-IO-Compress>=2.017}:../../devel/p5-IO-Compress	# Compress::Zlib

PERL5_PACKLIST=		auto/SWF/File/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
