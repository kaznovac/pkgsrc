# $NetBSD: Makefile,v 1.53 2024/11/16 12:05:56 wiz Exp $

DISTNAME=	razor-agents-2.85
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	16
CATEGORIES=	mail perl5
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=razor/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://razor.sourceforge.net/
COMMENT=	Distributed and collaborative spam detection network
LICENSE=	artistic-2.0

# MIME::QuotedPrint, Getopt::Long, File::Copy needed from the perl package
#DEPENDS+=	{perl>=5.7.3,p5-Time-HiRes-[0-9]*}:../../time/p5-Time-HiRes
DEPENDS+=	p5-Digest-SHA1-[0-9]*:../../security/p5-Digest-SHA1
DEPENDS+=	p5-URI-[0-9]*:../../www/p5-URI

MAKE_FLAGS+=	MANSUBDIR=${PKGMANDIR}

PERL5_PACKLIST=	auto/razor-agents/.packlist
REPLACE_PERL+=	lib/Razor2/*.pm  lib/Razor2/*/*.pm

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
