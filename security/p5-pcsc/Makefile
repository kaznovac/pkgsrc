# $NetBSD: Makefile,v 1.29 2024/11/16 12:06:35 wiz Exp $

DISTNAME=	pcsc-perl-1.4.14
PKGNAME=	p5-${DISTNAME:S/-perl//}
PKGREVISION=	8
CATEGORIES=	security
MASTER_SITES=	https://pcsc-perl.apdu.fr/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://pcsc-perl.apdu.fr/
COMMENT=	Allows communication with a smart card from a Perl script
LICENSE=	gnu-gpl-v2

SUBST_CLASSES+=		perl
SUBST_STAGE.perl=	pre-configure
SUBST_FILES.perl=	Card/t/test.t examples/test_iso_error.pl examples/gsm_directory.pl t/test.t test/multiple_readers.pl test/single_reader.pl
SUBST_SED.perl=		-e 's,/usr/bin/perl,${PERL5},'

CPPFLAGS+=	-I${BUILDLINK_PREFIX.pcsc-lite}/include/PCSC

MAKE_PARAMS+=		INSTALLDIRS=vendor
PERL5_PACKLIST=		auto/Chipcard/PCSC/.packlist

USE_TOOLS+=		pkg-config

.include "../../lang/perl5/module.mk"
.include "../../security/pcsc-lite/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
