# $NetBSD: Makefile,v 1.121 2024/12/09 15:49:13 jperkin Exp $

BRANCHNAME=	1.21
DISTNAME=	krb5-${BRANCHNAME}.3
PKGNAME=	mit-${DISTNAME}
PKGREVISION=	1
CATEGORIES=	security
# It is not clear how stable this URL scheme is.
MASTER_SITES=	http://web.mit.edu/kerberos/dist/krb5/${BRANCHNAME}/

MAINTAINER=	tez@NetBSD.org
HOMEPAGE=	https://web.mit.edu/kerberos/
COMMENT=	MIT Kerberos 5 authentication system

# There is a file NOTICE in the sources, which is enormous.  Most
# licenses appear to be some flavor of X11, 3-clause BSD, 4-clause
# BSD.
# 20201007: gdt emailed upstream asking for clarification on the AES
# license, which is not entirely clearly Free, by the text.
#LICENSE=

# TODO: This is entirely caused by our libtool patches, which are also
# actively harmful when trying to run the test suite.  They should really
# be completely deleted and we instead homogenise shared objects to have
# the same naming across all platforms.
MAKE_JOBS_SAFE=	no

WRKSRC=		${WRKDIR}/${DISTNAME}/src

BUILD_TARGET=	generate-files-mac all

.include "../../mk/bsd.prefs.mk"

CONFLICTS+=	heimdal-[0-9]*
CONFLICTS+=	kth-krb4-[0-9]*

USE_LANGUAGES=		c c++
USE_LIBTOOL=		yes
GNU_CONFIGURE=		yes
USE_TOOLS+=		autoconf bison gzip m4 msgfmt perl

# The actual KDC databases are stored in ${MIT_KRB5_STATEDIR}/krb5kdc.
MIT_KRB5_STATEDIR?=	${VARBASE}
FILES_SUBST+=		MIT_KRB5_STATEDIR=${MIT_KRB5_STATEDIR}

BUILD_DEFS+=		VARBASE

# This argument was added with no explanation back in 2005, and is now
# actively harmful on at least SunOS, causing core dumps when trying to
# use threaded clients such as pgbench.  It should probably be removed
# entirely, or at least limited to NetBSD.
.if ${OPSYS} != "SunOS"
CONFIGURE_ARGS+=	--disable-thread-support
.endif

CONFIGURE_ARGS+=	--localstatedir=${MIT_KRB5_STATEDIR}
CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR}
CONFIGURE_ARGS+=	--disable-aesni
CONFIGURE_ARGS+=	--disable-kdc-lookaside-cache
CONFIGURE_ARGS+=	--enable-shared
CONFIGURE_ARGS+=	--enable-dns-for-realm
CONFIGURE_ARGS+=	--enable-pkgsrc-libtool
CONFIGURE_ARGS+=	--without-system-verto
CONFIGURE_ENV+=		BUILDLINK_PREFIX_OPENSSL=${BUILDLINK_PREFIX.openssl}
CONFIGURE_ENV+=		DEFKTNAME=FILE:${PKG_SYSCONFDIR}/krb5.keytab
MAKE_ENV+=		ROOT_USER=${ROOT_USER}
MAKE_ENV+=		YFLAGS="-Wnone"
LIBS.SunOS=		-lrt

OWN_DIRS_PERMS=		${MIT_KRB5_STATEDIR}/krb5kdc			\
			${REAL_ROOT_USER} ${REAL_ROOT_GROUP} 0700
RCD_SCRIPTS=		kadmind kdc

INSTALLATION_DIRS=	bin include/gssapi include/gssrpc ${PKGINFODIR}	\
			${PKGMANDIR}/man1 ${PKGMANDIR}/man5		\
			${PKGMANDIR}/man7 ${PKGMANDIR}/man8		\
			sbin share/examples/krb5 share/et		\
			share/examples/rc.d share/gnats			\
			lib/krb5/plugins/kdb lib/krb5/plugins/preauth	\
			lib/krb5/plugins/tls include/krb5 include/kadm5 \
			lib/pkgconfig

.include "options.mk"

pre-configure:
	cd ${WRKSRC} && autoconf -I ${WRKSRC} -f

.include "../../databases/lmdb/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
