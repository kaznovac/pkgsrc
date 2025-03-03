# $NetBSD: Makefile,v 1.40 2024/07/16 11:40:16 adam Exp $

DISTNAME=	pa_stable_v190700_20210406
PKGNAME=	${DISTNAME:S/^pa_stable_v/portaudio-/1:S/_/./g}
CATEGORIES=	audio
MASTER_SITES=	https://files.portaudio.com/archives/
EXTRACT_SUFX=	.tgz

MAINTAINER=	nia@NetBSD.org
HOMEPAGE=	https://www.portaudio.com/
COMMENT=	Portable cross-platform audio API
LICENSE=	mit

CONFLICTS+=	portaudio-devel-[0-9]*
SUPERSEDES+=	portaudio-devel-[0-9]*

WRKSRC=		${WRKDIR}/portaudio
USE_LANGUAGES=	c c++
USE_TOOLS+=	autoconf autoreconf automake
USE_TOOLS+=	gmake pkg-config
USE_LIBTOOL=	yes
GNU_CONFIGURE=	yes

# No rule to make target '../../../lib/libportaudio.la', needed by 'libportaudiocpp.la'.  Stop.
MAKE_JOBS_SAFE=	no

.include "../../mk/oss.buildlink3.mk"

PLIST_VARS+=	oss
.if ${OSS_TYPE} != "none"
PLIST.oss=	yes
.endif

GNU_CONFIGURE_LIBSUBDIR=	portaudio2

CONFIGURE_ARGS+=	--enable-cxx
CONFIGURE_ARGS+=	--includedir=${PREFIX}/include/portaudio2
CONFIGURE_ARGS+=	--disable-mac-universal

PKGCONFIG_OVERRIDE=	portaudio-2.0.pc.in

CFLAGS.Darwin+=		-Wno-deprecated-declarations

pre-configure:
	cd ${WRKSRC} && autoreconf -i

.include "options.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
