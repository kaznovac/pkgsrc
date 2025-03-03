# $NetBSD: Makefile,v 1.60 2024/04/22 07:33:05 jperkin Exp $

PKGNAME=	bootstrap-mk-files-20240422
CATEGORIES=	pkgtools

CONFLICTS+=	mk-files-[0-9]*

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.pkgsrc.org/
COMMENT=	*.mk files for the bootstrap bmake utility
LICENSE=	original-bsd

NO_PKGTOOLS_REQD_CHECK=	yes
BOOTSTRAP_PKG=		yes

NO_BUILD=	yes

USE_TOOLS+=	sed

INSTALLATION_DIRS=	share/mk

do-extract:
	${RUN} ${CP} -R ${FILESDIR} ${WRKSRC}

do-configure:
	cd ${WRKSRC}; for file in bsd.* sys.mk; do			\
		${TEST} ! -f mods/${OPSYS}.$$file ||			\
		${CP} -f mods/${OPSYS}.$$file ${WRKSRC}/$$file;		\
	done
	cd ${WRKSRC};							\
	if ${TEST} -f mods/${OPSYS}.bsd.own.mk.in; then			\
		own_mk=mods/${OPSYS}.bsd.own.mk.in;			\
	else								\
		own_mk=mods/bsd.own.mk.in;				\
	fi;								\
	${SED}	-e 's|@ROOT_GROUP@|'${REAL_ROOT_GROUP}'|g'			\
		-e 's|@ROOT_USER@|'${REAL_ROOT_USER}'|g'			\
		-e 's|@SYSCONFDIR@|'${PKG_SYSCONFDIR}'|g'		\
		$$own_mk > bsd.own.mk

do-install:
	cd ${WRKSRC} && for file in bsd.* sys.mk; do			\
		${INSTALL_DATA} $$file ${DESTDIR}${PREFIX}/share/mk/$$file;	\
	done

.include "../../mk/bsd.pkg.mk"
