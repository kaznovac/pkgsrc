# $NetBSD: Makefile,v 1.10 2025/01/12 07:45:49 adam Exp $

DISTNAME=	watchfiles-1.0.4
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	misc python
MASTER_SITES=	${MASTER_SITE_PYPI:=w/watchfiles/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/samuelcolvin/watchfiles
COMMENT=	Simple, modern and high performance file watching and code reload
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-anyio>=3.0.0:../../devel/py-anyio
TEST_DEPENDS+=	${PYPKGPREFIX}-dirty-equals>=0:../../devel/py-dirty-equals
TEST_DEPENDS+=	${PYPKGPREFIX}-test-timeout>=0:../../devel/py-test-timeout

post-install:
	cd ${DESTDIR}${PREFIX}/bin && \
	${MV} watchfiles watchfiles-${PYVERSSUFFIX} || ${TRUE}

.include "cargo-depends.mk"

.include "../../devel/py-maturin/tool.mk"
.include "../../lang/python/wheel.mk"
.include "../../lang/rust/cargo.mk"
.include "../../mk/bsd.pkg.mk"
