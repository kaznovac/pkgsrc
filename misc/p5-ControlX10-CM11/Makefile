# $NetBSD: Makefile,v 1.31 2024/11/16 12:06:04 wiz Exp $
#

DISTNAME=	ControlX10-CM11-2.09
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	18
CATEGORIES=	misc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=ControlX10/}

MAINTAINER=	damon@brodiefamily.org
HOMEPAGE=	http://members.aol.com/Bbirthisel/alpha.html
COMMENT=	Perl5 module for controlling the X10 CM11A controller

DEPENDS+=	p5-Device-SerialPort>=0.07:../../comms/p5-Device-SerialPort

PERL5_PACKLIST=		auto/ControlX10/CM11/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
