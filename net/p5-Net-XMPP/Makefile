# $NetBSD: Makefile,v 1.21 2024/11/16 12:06:18 wiz Exp $
#

DISTNAME=	Net-XMPP-1.05
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	10
CATEGORIES=	chat perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Net/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/HACKER/Net-XMPP-1.02
COMMENT=	Provide a Perl Developer access to the XMPP protocol
LICENSE=	gnu-lgpl-v2.1

DEPENDS+=	p5-XML-Stream>=1.24:../../textproc/p5-XML-Stream
DEPENDS+=	p5-Digest-SHA1>=1.02:../../security/p5-Digest-SHA1

PERL5_MODULE_TYPE=	Module::Build
PERL5_PACKLIST=		auto/Net/XMPP/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
