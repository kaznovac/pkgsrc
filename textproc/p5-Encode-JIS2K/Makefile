# $NetBSD: Makefile,v 1.11 2024/11/16 12:06:44 wiz Exp $

DISTNAME=	Encode-JIS2K-0.05
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Encode/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Encode-JIS2K
COMMENT=	JIS X 0212 (aka JIS 2000) Encodings
LICENSE=	${PERL5_LICENSE}

PERL5_PACKLIST=		auto/Encode/JIS2K/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
