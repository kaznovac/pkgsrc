# $NetBSD: Makefile,v 1.10 2025/01/09 23:30:12 wiz Exp $

DISTNAME=	pandoc-server-0.1.0.5
PKGREVISION=	4
CATEGORIES=	converters

MAINTAINER=	pkgsrc-users@NetBSD.org
COMMENT=	Pandoc document conversion as an HTTP servant-server
LICENSE=	gnu-gpl-v2

.include "../../converters/hs-aeson/buildlink3.mk"
.include "../../converters/hs-base64-bytestring/buildlink3.mk"
.include "../../devel/hs-data-default/buildlink3.mk"
.include "../../textproc/hs-doctemplates/buildlink3.mk"
.include "../../converters/hs-pandoc/buildlink3.mk"
.include "../../textproc/hs-pandoc-types/buildlink3.mk"
.include "../../www/hs-servant-server/buildlink3.mk"
.include "../../textproc/hs-skylighting/buildlink3.mk"
.include "../../textproc/hs-unicode-collation/buildlink3.mk"
.include "../../www/hs-wai/buildlink3.mk"
.include "../../www/hs-wai-cors/buildlink3.mk"
.include "../../mk/haskell.mk"
.include "../../mk/bsd.pkg.mk"
