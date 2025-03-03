# $NetBSD: Makefile,v 1.44 2024/11/16 12:04:50 wiz Exp $

DISTNAME=	PAR-Dist-0.53
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=PAR/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/dist/PAR-Dist
COMMENT=	Perl module toolkit to create and manipulate PAR distributions
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-Archive-Zip>1.28:../../archivers/p5-Archive-Zip
DEPENDS+=	p5-Module-Signature>=0.25:../../security/p5-Module-Signature
DEPENDS+=	p5-libwww-[0-9]*:../../www/p5-libwww

USE_LANGUAGES=		# empty
PERL5_PACKLIST=		auto/PAR/Dist/.packlist

PKG_OPTIONS_VAR=		PKG_OPTIONS.p5-PAR-Dist
PKG_OPTIONS_REQUIRED_GROUPS=	YAML
PKG_OPTIONS_GROUP.YAML=		YAML LibYAML YAML-Tiny
PKG_SUGGESTED_OPTIONS=		LibYAML

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:MYAML-Tiny)
TOOL_DEPENDS+=	p5-YAML-Tiny>=1.25:../../textproc/p5-YAML-Tiny
.elif !empty(PKG_OPTIONS:MLibYAML)
TOOL_DEPENDS+=	p5-YAML-LibYAML>=0.03:../../textproc/p5-YAML-LibYAML
.elif !empty(PKG_OPTIONS:MYAML)
TOOL_DEPENDS+=	p5-YAML>=0.60:../../textproc/p5-YAML
.endif

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
