# $NetBSD: Makefile,v 1.27 2024/11/16 12:07:20 wiz Exp $

DISTNAME=	DateTimeX-Easy-0.091
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	2
CATEGORIES=	time perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=DateTimeX/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/pod/DateTimeX::Easy
COMMENT=	Parse a date/time string using the best method available
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-DateTime-[0-9]*:../../time/p5-DateTime
DEPENDS+=	p5-DateTime-Format-Flexible-[0-9]*:../../time/p5-DateTime-Format-Flexible
DEPENDS+=	p5-DateTime-Format-ICal-[0-9]*:../../time/p5-DateTime-Format-ICal
DEPENDS+=	p5-DateTime-Format-Natural-[0-9]*:../../time/p5-DateTime-Format-Natural
#DEPENDS+=	{perl>=5.10,p5-Scalar-List-Utils-[0-9]*}:../../devel/p5-Scalar-List-Utils
DEPENDS+=	p5-TimeDate-[0-9]*:../../time/p5-TimeDate

TOOL_DEPENDS+=	p5-Test-Most>0:../../devel/p5-Test-Most

PERL5_MODULE_TYPE=	Module::Install::Bundled
USE_LANGUAGES=		#

PERL5_PACKLIST=	auto/DateTimeX/Easy/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
