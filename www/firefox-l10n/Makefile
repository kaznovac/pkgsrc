# $NetBSD: Makefile,v 1.283 2025/01/14 13:37:10 ryoon Exp $

FIREFOX_VER=	134.0
PKGNAME=	firefox-l10n-${FIREFOX_VER:S/b/beta/:S/esr//}
DISTNAME=	# empty
CATEGORIES=	www
#MASTER_SITES=	${MASTER_SITE_MOZILLA_ALL:=firefox/releases/${FIREFOX_VER}/linux-i686/xpi/}
MASTER_SITES=	${MASTER_SITE_MOZILLA:=firefox/releases/${FIREFOX_VER}/linux-i686/xpi/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.mozilla.com/en-US/firefox/
COMMENT=	Language packs for www/firefox
LICENSE=	mpl-2.0 AND mpl-1.1 AND gnu-lgpl-v3 AND gnu-gpl-v2 # as of 96.0.3

DEPENDS+=	firefox>=${PKGVERSION_NOREV}:../../www/firefox

DIST_SUBDIR=	${PKGNAME_NOREV}
DISTFILES=	${FIREFOX_LOCALES:=.xpi}

NO_BUILD=	yes

INSTALLATION_DIRS=	lib/firefox/distribution/extensions

FIREFOX_LOCALES= \
	ach af an ar ast az be bg bn br bs ca-valencia ca cak cs cy	\
	da de dsb	\
	el en-CA en-GB en-US eo es-AR es-CL es-ES es-MX et eu		\
	fa ff fi fr fy-NL fur ga-IE gd gl gn gu-IN			\
	he hi-IN hr hsb hu hy-AM ia id is it ja ka kab kk km kn	ko	\
	lij lt lv mk mr ms my nb-NO ne-NP nl nn-NO oc			\
	pa-IN pl pt-BR pt-PT rm ro ru sc sco si sk skr sl son sq sr	\
	sv-SE szl ta te th tl tr trs uk ur uz vi xh zh-CN zh-TW

EXTENSIONS_DIR=		${PREFIX}/lib/firefox/distribution/extensions

do-install:
.for locale in ${FIREFOX_LOCALES}
	${INSTALL_DATA} ${WRKSRC}/${locale}.xpi \
	${DESTDIR}${EXTENSIONS_DIR}/langpack-${locale}@firefox.mozilla.org.xpi
.endfor

.if make(list-licenses)
.include "list-licenses.mk"
.endif

.include "../../mk/bsd.pkg.mk"
