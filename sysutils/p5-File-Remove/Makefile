# $NetBSD: Makefile,v 1.40 2024/11/16 12:06:38 wiz Exp $

DISTNAME=	File-Remove-1.61
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	2
CATEGORIES=	sysutils perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=File/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/File-Remove
COMMENT=	Remove files and directories
LICENSE=	${PERL5_LICENSE}

PERL5_PACKLIST=	auto/File/Remove/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
