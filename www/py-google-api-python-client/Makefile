# $NetBSD: Makefile,v 1.101 2025/01/12 10:23:16 wiz Exp $

DISTNAME=	google_api_python_client-2.158.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/_/-/g}
CATEGORIES=	www python
MASTER_SITES=	${MASTER_SITE_PYPI:=g/google_api_python_client/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/googleapis/google-api-python-client
COMMENT=	Python client library for Google's discovery based APIs
LICENSE=	apache-2.0

TOOL_DEPENDS+=	${PYPKGPREFIX}-setuptools-[0-9]*:../../devel/py-setuptools
DEPENDS+=	${PYPKGPREFIX}-google-api-core>=2.3.1:../../devel/py-google-api-core
DEPENDS+=	${PYPKGPREFIX}-google-auth>=1.19.0:../../security/py-google-auth
DEPENDS+=	${PYPKGPREFIX}-google-auth-httplib2>=0.1.0:../../security/py-google-auth-httplib2
DEPENDS+=	${PYPKGPREFIX}-httplib2>=0.15.0:../../www/py-httplib2
DEPENDS+=	${PYPKGPREFIX}-uritemplate>=3.0.1:../../textproc/py-uritemplate
TEST_DEPENDS+=	${PYPKGPREFIX}-mock-[0-9]*:../../devel/py-mock
TEST_DEPENDS+=	${PYPKGPREFIX}-parameterized-[0-9]*:../../devel/py-parameterized

USE_LANGUAGES=	# none

# as of 2.146.0
# 2 failed, 310 passed, 9 skipped
# as of 2.154.0, python dumps core with grpc in the backtrace

.include "../../lang/python/wheel.mk"
.include "../../mk/bsd.pkg.mk"
