# $NetBSD: Makefile,v 1.12 2024/12/10 12:06:14 adam Exp $

DISTNAME=	eliot-1.16.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	sysutils python
#MASTER_SITES+=	${MASTER_SITE_PYPI:=e/eliot/}
MASTER_SITES+=	${MASTER_SITE_GITHUB:=itamarst/}
GITHUB_TAG=	${PKGVERSION_NOREV}
GITHUB_PROJECT=	eliot

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/itamarst/eliot
COMMENT=	Logging library that tells you why it happened
LICENSE=	apache-2.0

TOOL_DEPENDS+=	${PYPKGPREFIX}-setuptools>=0:../../devel/py-setuptools
DEPENDS+=	${PYPKGPREFIX}-boltons>=19.0.1:../../devel/py-boltons
DEPENDS+=	${PYPKGPREFIX}-orjson-[0-9]*:../../textproc/py-orjson
DEPENDS+=	${PYPKGPREFIX}-pyrsistent>=0.11.8:../../devel/py-pyrsistent
DEPENDS+=	${PYPKGPREFIX}-zope.interface-[0-9]*:../../devel/py-zope.interface
TEST_DEPENDS+=	${PYPKGPREFIX}-hypothesis>=1.14.0:../../devel/py-hypothesis
TEST_DEPENDS+=	${PYPKGPREFIX}-test-xdist-[0-9]*:../../devel/py-test-xdist
TEST_DEPENDS+=	${PYPKGPREFIX}-testtools-[0-9]*:../../devel/py-testtools

USE_LANGUAGES=	# none

post-install:
	cd ${DESTDIR}${PREFIX}/bin && \
	${MV} eliot-prettyprint eliot-prettyprint-${PYVERSSUFFIX} || ${TRUE}

.include "../../lang/python/wheel.mk"
.include "../../mk/bsd.pkg.mk"
