# $NetBSD: Makefile,v 1.19 2024/11/16 12:06:25 wiz Exp $
#

DISTNAME=	Authen-Htpasswd-0.171
PKGNAME=	p5-${DISTNAME:S/161/16.1/}
PKGREVISION=	13
CATEGORIES=	security perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Authen/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Authen-Htpasswd
COMMENT=	Interface to read and modify Apache .htpasswd files
LICENSE=	${PERL5_LICENSE}

USE_LANGUAGES=	# empty
PERL5_PACKLIST=	auto/Authen/Htpasswd/.packlist

DEPENDS+=	p5-Class-Accessor-[0-9]*:../../devel/p5-Class-Accessor
DEPENDS+=	p5-Crypt-PasswdMD5-[0-9]*:../../security/p5-Crypt-PasswdMD5
DEPENDS+=	p5-Digest-SHA1-[0-9]*:../../security/p5-Digest-SHA1
DEPENDS+=	p5-IO-LockedFile-[0-9]*:../../devel/p5-IO-LockedFile

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
