# $NetBSD: Makefile,v 1.23 2024/11/16 12:04:16 wiz Exp $

DISTNAME=	File-Save-Home-0.11
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	7
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=File/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/File-Save-Home
COMMENT=	Place file safely under user home directory
LICENSE=	${PERL5_LICENSE}

# TEST_DEPENDS
TOOL_DEPENDS+=	p5-String-Random-[0-9]*:../../security/p5-String-Random

PERL5_PACKLIST=		auto/File/Save/Home/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
