# $NetBSD: Makefile,v 1.29 2024/11/16 12:06:50 wiz Exp $

DISTNAME=	Pod-Elemental-0.103006
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	2
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Pod/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Pod-Elemental
COMMENT=	Perl5 module to work with nestable Pod elements
LICENSE=	${PERL5_LICENSE}

#DEPENDS+=	{perl>=5.10.1,p5-Encode-[0-9]*}:../../textproc/p5-Encode
DEPENDS+=	p5-Mixin-Linewise-[0-9]*:../../devel/p5-Mixin-Linewise
DEPENDS+=	p5-Moose>=0.90:../../devel/p5-Moose
DEPENDS+=	p5-MooseX-Types-[0-9]*:../../devel/p5-MooseX-Types
DEPENDS+=	p5-Pod-Eventual-[0-9]*:../../textproc/p5-Pod-Eventual
DEPENDS+=	p5-String-RewritePrefix-[0-9]*:../../textproc/p5-String-RewritePrefix
DEPENDS+=	p5-String-Truncate-[0-9]*:../../textproc/p5-String-Truncate
DEPENDS+=	p5-Sub-Exporter-[0-9]*:../../devel/p5-Sub-Exporter
DEPENDS+=	p5-Sub-Exporter-ForMethods-[0-9]*:../../devel/p5-Sub-Exporter-ForMethods
DEPENDS+=	p5-namespace-autoclean-[0-9]*:../../devel/p5-namespace-autoclean

TOOL_DEPENDS+=	p5-Test-Deep-[0-9]*:../../devel/p5-Test-Deep
TOOL_DEPENDS+=	p5-Test-Differences-[0-9]*:../../devel/p5-Test-Differences
TOOL_DEPENDS+=	p5-Text-Diff-[0-9]*:../../textproc/p5-Text-Diff
# for make test
TOOL_DEPENDS+=	p5-Package-DeprecationManager-[0-9]*:../../devel/p5-Package-DeprecationManager

PERL5_PACKLIST=		auto/Pod/Elemental/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
