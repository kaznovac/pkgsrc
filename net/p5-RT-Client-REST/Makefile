# $NetBSD: Makefile,v 1.29 2024/11/16 12:06:20 wiz Exp $

DISTNAME=	RT-Client-REST-0.60
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	4
CATEGORIES=	net devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=RT/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/RT-Client-REST
COMMENT=	Perl 5 module to talk to RT using REST protocol
LICENSE=	artistic

USE_LANGUAGES=		# empty
PERL5_PACKLIST=		auto/RT/Client/REST/.packlist

DEPENDS+=	p5-DateTime-Format-DateParse-[0-9]*:../../time/p5-DateTime-Format-DateParse
DEPENDS+=	p5-DateTime-[0-9]*:../../time/p5-DateTime
DEPENDS+=	p5-DateTime-Locale>=0:../../time/p5-DateTime-Locale
DEPENDS+=	p5-Error-[0-9]*:../../devel/p5-Error
DEPENDS+=	p5-Exception-Class-[0-9]*:../../devel/p5-Exception-Class
DEPENDS+=	p5-Params-Validate-[0-9]*:../../devel/p5-Params-Validate
DEPENDS+=	p5-libwww-[0-9]*:../../www/p5-libwww

# TEST_DEPENDS
TOOL_DEPENDS+=	p5-CGI-[0-9]*:../../www/p5-CGI
TOOL_DEPENDS+=	p5-HTTP-Server-Simple-[0-9]*:../../www/p5-HTTP-Server-Simple
TOOL_DEPENDS+=	p5-Test-Exception-[0-9]*:../../devel/p5-Test-Exception

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
