# $NetBSD: Makefile,v 1.61 2024/11/16 12:07:10 wiz Exp $

DISTNAME=	XML-RSS-1.62
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	4
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=XML/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/XML-RSS
COMMENT=	XML-RSS helps to create and update RSS files
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-DateTime-[0-9]*:../../time/p5-DateTime
DEPENDS+=	p5-DateTime-Format-Mail-[0-9]*:../../time/p5-DateTime-Format-Mail
DEPENDS+=	p5-DateTime-Format-W3CDTF-[0-9]*:../../time/p5-DateTime-Format-W3CDTF
DEPENDS+=	p5-HTML-Parser-[0-9]*:../../www/p5-HTML-Parser
DEPENDS+=	p5-XML-Parser>=2.23:../../textproc/p5-XML-Parser

TOOL_DEPENDS+=	p5-Test-Manifest>=0.9:../../devel/p5-Test-Manifest
TOOL_DEPENDS+=	p5-Test-Differences-[0-9]*:../../devel/p5-Test-Differences

PERL5_PACKLIST=		auto/XML/RSS/.packlist
PERL5_MODULE_TYPE=	Module::Build

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
