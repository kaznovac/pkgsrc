# $NetBSD: Makefile,v 1.29 2024/11/14 22:20:56 wiz Exp $

PKGNAME=	${DISTNAME:S/ffmpeg/ffplay5/}
PKGREVISION=	3
MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://ffmpeg.org/
COMMENT=	Simple SDL frontend for FFmpeg

DISTINFO_FILE=		${.CURDIR}/../ffmpeg5/distinfo

USE_CC_FEATURES=	c99
USE_LANGUAGES=		c

CONFIGURE_ARGS+=	--disable-ffmpeg
CONFIGURE_ARGS+=	--disable-ffprobe
CONFIGURE_ARGS+=	--disable-encoders
CONFIGURE_ARGS+=	--disable-decoders
CONFIGURE_ARGS+=	--disable-htmlpages
CONFIGURE_ARGS+=	--disable-hwaccels
CONFIGURE_ARGS+=	--disable-muxers
CONFIGURE_ARGS+=	--disable-demuxers
CONFIGURE_ARGS+=	--disable-parsers
CONFIGURE_ARGS+=	--disable-bsfs
CONFIGURE_ARGS+=	--disable-protocols
CONFIGURE_ARGS+=	--disable-devices
CONFIGURE_ARGS+=	--disable-filters
CONFIGURE_ARGS+=	--disable-htmlpages
CONFIGURE_ARGS+=	--disable-podpages
CONFIGURE_ARGS+=	--disable-txtpages
CONFIGURE_ARGS+=	--enable-ffplay
CONFIGURE_ARGS+=	--enable-dct
CONFIGURE_ARGS+=	--enable-mdct
CONFIGURE_ARGS+=	--enable-rdft

INSTALLATION_DIRS+=	bin ${PKGMANDIR}/man1

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/ffplay5 ${DESTDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/doc/ffplay5.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1

.include "../../devel/SDL2/buildlink3.mk"
.include "../../multimedia/ffmpeg5/buildlink3.mk"
.include "../../multimedia/ffmpeg5/Makefile.common"
.include "../../mk/bsd.pkg.mk"
