# $NetBSD: Makefile,v 1.23 2024/11/16 12:03:29 wiz Exp $

DISTNAME=	MARC-XML-1.0.4
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	7
CATEGORIES=	converters perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=../../authors/id/G/GM/GMCHARLT/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/MARC-XML
COMMENT=	Work with MARC data encoded as XML, SAX handler for parsing MARCXML
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-XML-LibXML-[0-9]*:../../textproc/p5-XML-LibXML
DEPENDS+=	p5-XML-SAX>=0.12:../../textproc/p5-XML-SAX
DEPENDS+=	p5-MARC-Record>=2.0:../../databases/p5-MARC-Record
DEPENDS+=	p5-MARC-Charset>=0.98:../../converters/p5-MARC-Charset

# TEST_DEPENDS
TOOL_DEPENDS+=	p5-Test-Warn-[0-9]*:../../devel/p5-Test-Warn

USE_LANGUAGES=	# empty
PERL5_PACKLIST=	auto/MARC-XML/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
