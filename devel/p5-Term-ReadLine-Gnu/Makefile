# $NetBSD: Makefile,v 1.9 2024/11/16 12:05:11 wiz Exp $

DISTNAME=	Term-ReadLine-Gnu-1.46
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Term/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Term-ReadLine-Gnu
COMMENT=	Perl extension for the GNU Readline/History Library
LICENSE=	${PERL5_LICENSE}

PERL5_PACKLIST=		auto/Term/ReadLine/Gnu/.packlist

.include "../../lang/perl5/module.mk"
# does not accept editline
.include "../../devel/readline/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
