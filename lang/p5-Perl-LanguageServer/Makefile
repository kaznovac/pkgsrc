# $NetBSD: Makefile,v 1.8 2024/11/16 12:05:45 wiz Exp $

DISTNAME=	Perl-LanguageServer-2.6.2
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
CATEGORIES=	lang devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=../../authors/id/G/GR/GRICHTER/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Perl-LanguageServer
COMMENT=	Language Server for the Perl language
LICENSE=	artistic-2.0

USE_LANGUAGES=	# empty

DEPENDS+=	p5-Moose-[0-9]*:../../devel/p5-Moose
DEPENDS+=	p5-AnyEvent-[0-9]*:../../devel/p5-AnyEvent
DEPENDS+=	p5-AnyEvent-AIO-[0-9]*:../../devel/p5-AnyEvent-AIO
DEPENDS+=	p5-Class-Refresh-[0-9]*:../../devel/p5-Class-Refresh
DEPENDS+=	p5-Compiler-Lexer-[0-9]*:../../devel/p5-Compiler-Lexer
DEPENDS+=	p5-Coro-[0-9]*:../../devel/p5-Coro
DEPENDS+=	p5-Data-Dump-[0-9]*:../../devel/p5-Data-Dump
DEPENDS+=	p5-Encode-Locale-[0-9]*:../../textproc/p5-Encode-Locale
DEPENDS+=	p5-Hash-SafeKeys-[0-9]*:../../devel/p5-Hash-SafeKeys
DEPENDS+=	p5-IO-AIO-[0-9]*:../../devel/p5-IO-AIO
DEPENDS+=	p5-JSON-[0-9]*:../../converters/p5-JSON
DEPENDS+=	p5-PadWalker-[0-9]*:../../devel/p5-PadWalker

PERL5_PACKLIST=		auto/Perl/LanguageServer/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
