# $NetBSD: Makefile,v 1.31 2024/11/14 22:18:42 wiz Exp $

DISTNAME=	libmusicbrainz-5.1.0
PKGNAME=	${DISTNAME:S/brainz/brainz5/}
PKGREVISION=	19
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_GITHUB:=metabrainz/}
GITHUB_PROJECT=	libmusicbrainz
GITHUB_RELEASE=	release-${PKGVERSION_NOREV}
EXTRACT_USING=	bsdtar

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://musicbrainz.org/doc/libmusicbrainz
COMMENT=	MusicBrainz (user-maintained community music metadatabase) library v5
LICENSE=	gnu-lgpl-v2.1

USE_CMAKE=		yes
USE_LANGUAGES=		c c++
USE_TOOLS+=		pkg-config
PKGCONFIG_OVERRIDE=	libmusicbrainz5.pc.cmake

.include "../../devel/gettext-lib/buildlink3.mk"
BUILDLINK_API_DEPENDS.neon+=	neon>=0.25.0
.include "../../www/neon/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
