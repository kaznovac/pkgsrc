# $NetBSD: Makefile,v 1.18 2024/11/16 12:05:23 wiz Exp $

DISTNAME=	Test-Spelling-0.25
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	5
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Test/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/SARTAK/Test-Spelling-0.20
COMMENT=	Test::Spelling - check for spelling errors in POD files
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-Module-Install-GithubMeta-[0-9]*:../../devel/p5-Module-Install-GithubMeta
DEPENDS+=	p5-Module-Manifest-Skip-[0-9]*:../../devel/p5-Module-Manifest-Skip
DEPENDS+=	p5-Pod-Spell-[0-9]*:../../textproc/p5-Pod-Spell

# for make test:
TOOL_DEPENDS+=	p5-Path-Tiny-[0-9]*:../../filesystems/p5-Path-Tiny
TOOL_DEPENDS+=	p5-IPC-Run3-[0-9]*:../../devel/p5-IPC-Run3

USE_LANGUAGES=	# empty
PERL5_PACKLIST=	auto/Test/Spelling/.packlist

MAKE_ENV+=	PERL_USE_UNSAFE_INC=1

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
