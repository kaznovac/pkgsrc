# $NetBSD: Makefile,v 1.46 2024/07/12 13:28:42 hauke Exp $
#

DISTNAME=	radmind-1.14.1
PKGREVISION=	13
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=radmind/}

MAINTAINER=	hauke@NetBSD.org
HOMEPAGE=	http://rsug.itd.umich.edu/software/radmind/
COMMENT=	Remote file administration and integrity tool
LICENSE=	modified-bsd

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-openssl=${BUILDLINK_PREFIX.openssl}
CONFIGURE_ARGS+=	--with-radminddir=${RADMINDDIR}
CONFIGURE_ARGS+=	--enable-profiled=no
CONFIGURE_ENV+=		diffpath=${TOOLS_DIFF:Q}
# XXX configure script checks for path to echo, which pkgsrc does not
# provide, so we need to side-step {echopath}.
CONFIGURE_ENV+=		ac_cv_path_echopath=${TOOLS_ECHO:Q}

USE_LANGUAGES=		c
USE_CC_FEATURES=	c99

.include "../../mk/compiler.mk"

# libsnet uses K&R function declarations
.if !empty(CC_VERSION:Mclang-1[5-9].*) || !empty(CC_VERSION:Mclang-[2-9][1-9].*)
CFLAGS+=		-Wno-deprecated-non-prototype
.endif

MAKE_JOBS_SAFE=		no

BUILD_TARGET=		all man rash
RADMINDDIR=		${VARBASE}/radmind
BUILD_DEFS+=		VARBASE

RCD_SCRIPTS=		radmind

OWN_DIRS_PERMS+=	${RADMINDDIR} ${REAL_ROOT_USER} ${REAL_ROOT_GROUP} 0750
OWN_DIRS_PERMS+=	${RADMINDDIR}/cert ${REAL_ROOT_USER} ${REAL_ROOT_GROUP} 0700
OWN_DIRS_PERMS+=	${RADMINDDIR}/client ${REAL_ROOT_USER} \
			${REAL_ROOT_GROUP} 0750
OWN_DIRS_PERMS+=	${RADMINDDIR}/preapply ${REAL_ROOT_USER} \
			${REAL_ROOT_GROUP} 0750
OWN_DIRS_PERMS+=	${RADMINDDIR}/postapply ${REAL_ROOT_USER} \
			${REAL_ROOT_GROUP} 0750

.include "../../devel/zlib/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
