# $NetBSD: Makefile,v 1.15 2024/11/16 12:05:55 wiz Exp $
#

DISTNAME=	Test-Email-0.07
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	12
CATEGORIES=	mail
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=../../authors/id/J/JA/JAMES/}

MAINTAINER=	ryoon@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Test-Email
COMMENT=	Test Email contents and POP3 delivery

DEPENDS+=	p5-MIME-tools-[0-9]*:../../mail/p5-MIME-tools
DEPENDS+=	p5-Mail-POP3Client>=2:../../mail/p5-Mail-POP3Client
DEPENDS+=	p5-Mail-Sendmail>=0.79:../../mail/p5-Mail-Sendmail

PERL5_PACKLIST=	auto/Test/Email/.packlist
USE_LANGUAGES=	# none

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
