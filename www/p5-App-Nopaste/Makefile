# $NetBSD: Makefile,v 1.40 2024/11/16 12:07:27 wiz Exp $

DISTNAME=	App-Nopaste-1.013
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	5
CATEGORIES=	www perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=App/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/App-Nopaste
COMMENT=	Perl 5 module providing easy access to any pastebin
LICENSE=	${PERL5_LICENSE}

USE_LANGUAGES=	# empty
PERL5_PACKLIST=	auto/App/Nopaste/.packlist

REPLACE_PERL+=	script/nopaste

DEPENDS+=	p5-WWW-Mechanize-[0-9]*:../../www/p5-WWW-Mechanize

# Recommended dependencies
DEPENDS+=	p5-Browser-Open-[0-9]*:../../www/p5-Browser-Open
DEPENDS+=	p5-Clipboard-[0-9]*:../../x11/p5-Clipboard
DEPENDS+=	p5-Config-INI-[0-9]*:../../devel/p5-Config-INI
DEPENDS+=	p5-WWW-Pastebin-PastebinCom-Create-[0-9]*:../../www/p5-WWW-Pastebin-PastebinCom-Create
DEPENDS+=	p5-YAML-[0-9]*:../../textproc/p5-YAML

# for make test
TEST_DEPENDS+=	p5-JSON-MaybeXS-[0-9]*:../../converters/p5-JSON-MaybeXS
TEST_DEPENDS+=	p5-Module-Pluggable-[0-9]*:../../devel/p5-Module-Pluggable
TEST_DEPENDS+=	p5-Test-Deep-[0-9]*:../../devel/p5-Test-Deep

PERL5_MODULE_TYPE=	Module::Install::Bundled

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
