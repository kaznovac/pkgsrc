# $NetBSD: Makefile,v 1.9 2024/07/16 10:02:04 prlw1 Exp $

DISTNAME=	fcitx5-zhuyin-5.1.0
PKGREVISION=	1
CATEGORIES=	inputmethod
MASTER_SITES=	https://download.fcitx-im.org/fcitx5/fcitx5-zhuyin/
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	ryoon@NetBSD.org
HOMEPAGE=	https://github.com/fcitx/fcitx5-zhuyin
COMMENT=	Libzhuyin Wrapper for Fcitx5
LICENSE=	gnu-gpl-v2

DISTFILES+=	${DEFAULT_DISTFILES}
MOREDISTFILES+=	model.text.20161206.tar.gz
.for f in ${MOREDISTFILES}
DISTFILES+=	${f}
SITES.${f}=	https://download.fcitx-im.org/data/
.endfor
EXTRACT_ONLY=	${DEFAULT_DISTFILES}

TOOL_DEPENDS+=	extra-cmake-modules-[0-9]*:../../devel/extra-cmake-modules

USE_PKGLOCALEDIR=	yes
USE_LANGUAGES=		c c++
USE_TOOLS+=		pkg-config

post-extract:
.for f in ${MOREDISTFILES}
	cd ${WRKSRC}/data && \
		${LN} -sf ${DISTDIR}/${DIST_SUBDIR}/${f} ${f}
.endfor

.include "../../devel/cmake/build.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../inputmethod/fcitx5/buildlink3.mk"
.include "../../textproc/fmtlib/buildlink3.mk"
.include "../../textproc/libpinyin/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
