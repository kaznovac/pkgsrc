# $NetBSD: Makefile,v 1.784 2024/12/14 23:12:48 rillig Exp $

DISTNAME=	pkglint-23.10.0
CATEGORIES=	pkgtools
MASTER_SITES=	${MASTER_SITE_GITHUB:=rillig/}
GITHUB_TAG=	refs/tags/v${PKGVERSION_NOREV}

MAINTAINER=	rillig@NetBSD.org
HOMEPAGE=	https://github.com/rillig/pkglint
COMMENT=	Verifier for NetBSD packages
LICENSE=	2-clause-bsd
CONFLICTS+=	pkglint4-[0-9]*

USE_TOOLS+=		pax
CHECK_RELRO_SKIP+=	bin/pkglint

WRKSRC=		${WRKDIR}/${DISTNAME}/v${PKGVERSION_NOREV:C,\..*,,}

SUBST_CLASSES+=		pkglint
SUBST_STAGE.pkglint=	post-configure
SUBST_FILES.pkglint+=	pkglint.go
SUBST_SED.pkglint+=	-e s\|@VERSION@\|${PKGVERSION}\|g
SUBST_SED.pkglint+=	-e s\|@BMAKE@\|${MAKE:T:Q}\|g

do-test:
	cd ${WRKSRC} && ${PKGSRC_SETENV} ${MAKE_ENV} ${GO} test ${GO_BUILD_PATTERN}

post-install: do-install-man

.include "go-modules.mk"

# This needs to come before bsd.prefs.mk so that SSP_SUPPORTED is properly set.
.include "../../lang/go/go-module.mk"

.include "../../mk/bsd.prefs.mk"

PLIST_VARS+=		maninstall
.if ${MANINSTALL:Mmaninstall}
INSTALLATION_DIRS+=	man/man1
PLIST.maninstall=	yes
.endif

do-install-man: .PHONY
	${PLIST.maninstall:D:U\:} ${INSTALL_MAN} ${WRKDIR}/${DISTNAME}/pkglint.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/

.include "../../mk/bsd.pkg.mk"
