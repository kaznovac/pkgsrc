# $NetBSD: Makefile,v 1.18 2024/12/02 16:52:51 abs Exp $

DISTNAME=	jna-5.15.0
PKGNAME=	java-${DISTNAME}
CATEGORIES=	devel java
MASTER_SITES=	${MASTER_SITE_GITHUB:=java-native-access/}
GITHUB_PROJECT=	jna

MAINTAINER=	nonakap@gmail.com
HOMEPAGE=	https://github.com/java-native-access/jna
COMMENT=	JNA provides Java programs easy access to native shared libraries
LICENSE=	gnu-lgpl-v2.1 OR apache-2.0

EXTRACT_USING=	bsdtar

#
# Supported platforms (built and tested) from native/Makefile
#
#   Windows 2000/XP/2003/Vista (x86/amd64)
#   Windows CE/Mobile (arm)
#   Darwin/OS X (i386/x86_64/ppc)
#   Linux (i386/amd64/ppc/arm)
#   Solaris (i386/amd64/sparc/sparcv9)
#   AIX (ppc/ppc64)
#   FreeBSD/OpenBSD/NetBSD (i386/amd64)
#   Android (arm/armv7/aarch64/x86/x86-64/mipsel/mips64el)
#
ONLY_FOR_PLATFORM+=	Cygwin-*-*
ONLY_FOR_PLATFORM+=	Darwin-*-*
ONLY_FOR_PLATFORM+=	Linux-*-i386 Linux-*-x86_64
ONLY_FOR_PLATFORM+=	Linux-*-powerpc*
ONLY_FOR_PLATFORM+=	Linux-*-arm* Linux-*-aarch64
ONLY_FOR_PLATFORM+=	SunOS-*-*
ONLY_FOR_PLATFORM+=	AIX-*-*
ONLY_FOR_PLATFORM+=	FreeBSD-*-i386 FreeBSD-*-x86_64
ONLY_FOR_PLATFORM+=	OpenBSD-*-i386 OpenBSD-*-x86_64
ONLY_FOR_PLATFORM+=	NetBSD-*-i386 NetBSD-*-x86_64

USE_LANGUAGES=		c
USE_JAVA2=		1.4
USE_TOOLS+=		autoreconf automake autoconf ggrep gmake pkg-config pax
USE_LIBTOOL=		yes

OPSYSVARS+=	JNIPFX JNISFX
JNIPFX.Cygwin=	# empty
JNIPFX.*=	lib
JNISFX.Cygwin=	dll
JNISFX.Darwin=	jnilib
JNISFX.AIX=	a
JNISFX.*=	so

# Generated support files in ${PREFIX}/doc vary based on the version of java
# used to build, each of 8, 11, 17 and 21 have significant differences. The
# documentation is the same, but not the jquery, frame layout and similar files
GENERATE_PLIST+= \
	cd ${DESTDIR}${PREFIX} && \
	${FIND} lib share \( -type f -or -type l \) -print | ${SORT};

.include "../../mk/bsd.prefs.mk"
.include "../../mk/java-vm.mk"
.if ${OPSYS} == "NetBSD" && ${PKG_JVM} == "openjdk8"
# openjdk8<1.8.202 uses oldest sigaction on NetBSD.
DEPENDS+=	openjdk8>=1.8.202:../../lang/openjdk8
.endif

TOOL_DEPENDS+=	apache-ant-[0-9]*:../../devel/apache-ant

INSTALLATION_DIRS+= \
		lib/java/jna share/doc/${PKGBASE}

ANT_ARGS+=	-Ddynlink.native=true
ANT_ARGS+=	-Dbuild-native=true
ANT_ARGS+=	-Dcflags_extra.native=""
ANT_ARGS+=	-DCC=${CC:Q}
ANT_ARGS+=	-Dgrep=grep
ANT_ARGS+=	-Dmake=make
ANT_ARGS+=	-Dmake.PATH=PATH=${PATH:Q}
ANT_TARGET=	jar contrib-jars javadoc

# Needed with recent GCC versions, e.g., 9.3.
BUILDLINK_TRANSFORM+=	rm:-Werror
.if empty(PKGSRC_COMPILER:Mclang)
BUILDLINK_TRANSFORM+=	rm:-Wno-unknown-warning-option
.endif

do-build:
	cd ${WRKSRC} && \
	    ${_ULIMIT_CMD}${SETENV:Q} ${MAKE_ENV} ${PREFIX}/bin/ant ${ANT_ARGS} ${ANT_TARGET}

do-install:
	${INSTALL_LIB} ${WRKSRC}/build/native-*/${JNIPFX}jnidispatch.${JNISFX} \
	    ${DESTDIR}${PREFIX}/lib
	${INSTALL_DATA} ${WRKSRC}/build/jna-native.jar \
	    ${DESTDIR}${PREFIX}/lib/java/jna/jna-native.jar
	${INSTALL_DATA} ${WRKSRC}/build/jna.jar \
	    ${DESTDIR}${PREFIX}/lib/java/jna/jna.jar
	${INSTALL_DATA} ${WRKSRC}/contrib/platform/dist/jna-platform.jar \
	    ${DESTDIR}${PREFIX}/lib/java/jna/jna-platform.jar
	for i in AL2.0 LGPL2.1 LICENSE \
	  CHANGES.md OTHERS README.md TODO; \
	do \
	    ${INSTALL_DATA} ${WRKSRC}/$$i \
	      ${DESTDIR}${PREFIX}/share/doc/${PKGBASE}; \
	done
	cd ${WRKSRC} && \
	    ${PAX} -rw doc www ${DESTDIR}${PREFIX}/share/doc/${PKGBASE}

.include "../../devel/libffi/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
