# $NetBSD: Makefile,v 1.65 2024/11/16 12:06:23 wiz Exp $

DISTNAME=	Net-CUPS-0.64
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	36
CATEGORIES=	print net perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Net/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Net-CUPS
COMMENT=	Common Unix Printing System Interface
LICENSE=	${PERL5_LICENSE}

USE_LANGUAGES=	c

PERL5_PACKLIST=	auto/Net/CUPS/.packlist

EXTRACT_USING=	bsdtar

.include "../../converters/libiconv/buildlink3.mk"
.include "../../print/cups-base/buildlink3.mk"
BUILDLINK_DEPMETHOD.cups-filters= build # image.h
.include "../../print/cups-filters/buildlink3.mk"
.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
