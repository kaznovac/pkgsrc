# $NetBSD: Makefile,v 1.34 2024/05/09 01:31:39 pho Exp $

DISTNAME=	aeson-2.2.1.0
PKGREVISION=	2
CATEGORIES=	converters

MAINTAINER=	szptvlfn@NetBSD.org
COMMENT=	Fast JSON parsing and encoding
LICENSE=	modified-bsd

HASKELL_UNRESTRICT_DEPENDENCIES+=	\
	QuickCheck	\
	primitive	\
	th-abstraction

.include "../../devel/hs-data-fix/buildlink3.mk"
.include "../../devel/hs-dlist/buildlink3.mk"
.include "../../devel/hs-generically/buildlink3.mk"
.include "../../devel/hs-hashable/buildlink3.mk"
.include "../../devel/hs-indexed-traversable/buildlink3.mk"
.include "../../math/hs-integer-conversion/buildlink3.mk"
.include "../../math/hs-integer-logarithms/buildlink3.mk"
.include "../../net/hs-network-uri/buildlink3.mk"
.include "../../devel/hs-OneTuple/buildlink3.mk"
.include "../../devel/hs-primitive/buildlink3.mk"
.include "../../devel/hs-QuickCheck/buildlink3.mk"
.include "../../math/hs-scientific/buildlink3.mk"
.include "../../devel/hs-semialign/buildlink3.mk"
.include "../../devel/hs-strict/buildlink3.mk"
.include "../../devel/hs-tagged/buildlink3.mk"
.include "../../time/hs-text-iso8601/buildlink3.mk"
.include "../../textproc/hs-text-short/buildlink3.mk"
.include "../../devel/hs-th-abstraction/buildlink3.mk"
.include "../../devel/hs-these/buildlink3.mk"
.include "../../time/hs-time-compat/buildlink3.mk"
.include "../../devel/hs-unordered-containers/buildlink3.mk"
.include "../../devel/hs-uuid-types/buildlink3.mk"
.include "../../devel/hs-vector/buildlink3.mk"
.include "../../devel/hs-witherable/buildlink3.mk"
.include "../../mk/haskell.mk"
.include "../../mk/bsd.pkg.mk"
