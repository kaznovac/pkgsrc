# $NetBSD: Makefile,v 1.34 2024/11/16 12:03:19 wiz Exp $

DISTNAME=	Unicode-String-2.10
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	8
CATEGORIES=	converters perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Unicode/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Unicode-String
COMMENT=	Perl5 modules to handle various Unicode issues
LICENSE=	${PERL5_LICENSE}

#DEPENDS+=	{perl>=5.7.3,p5-MIME-Base64-[0-9]*}:../../converters/p5-MIME-Base64

PERL5_PACKLIST=		auto/Unicode/String/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
