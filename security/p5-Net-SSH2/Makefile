# $NetBSD: Makefile,v 1.4 2024/11/16 12:06:35 wiz Exp $

DISTNAME=	Net-SSH2-0.73
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	3
CATEGORIES=	security net perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=../../authors/id/R/RK/RKITOVER/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Net-SSH2
COMMENT=	Perl implementations of the SSH2 protocol
LICENSE=	${PERL5_LICENSE}

PERL5_PACKLIST=	auto/Net/SSH2/.packlist

.include "../../security/libssh2/buildlink3.mk"
.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
