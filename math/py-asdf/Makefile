# $NetBSD: Makefile,v 1.23 2024/11/11 07:28:39 wiz Exp $

DISTNAME=	asdf-3.5.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	${MASTER_SITE_PYPI:=a/asdf/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/asdf-format/asdf
COMMENT=	Advanced Scientific Data Format
LICENSE=	modified-bsd

TOOL_DEPENDS+=	${PYPKGPREFIX}-setuptools>=60:../../devel/py-setuptools
TOOL_DEPENDS+=	${PYPKGPREFIX}-setuptools_scm>=3.4:../../devel/py-setuptools_scm
DEPENDS+=	${PYPKGPREFIX}-asdf-standard>=1.1.0:../../math/py-asdf-standard
DEPENDS+=	${PYPKGPREFIX}-asdf-transform-schemas>=0.3:../../math/py-asdf-transform-schemas
DEPENDS+=	${PYPKGPREFIX}-attrs>=22.2.0:../../devel/py-attrs
DEPENDS+=	${PYPKGPREFIX}-jmespath>=0.6.2:../../textproc/py-jmespath
DEPENDS+=	${PYPKGPREFIX}-numpy>=1.22:../../math/py-numpy
DEPENDS+=	${PYPKGPREFIX}-packaging>=19:../../devel/py-packaging
DEPENDS+=	${PYPKGPREFIX}-semantic_version>=2.8:../../devel/py-semantic_version
DEPENDS+=	${PYPKGPREFIX}-yaml>=5.4.1:../../textproc/py-yaml
TEST_DEPENDS+=	${PYPKGPREFIX}-fsspec>=2022.8.2:../../sysutils/py-fsspec
TEST_DEPENDS+=	${PYPKGPREFIX}-lz4>=0.10:../../archivers/py-lz4
TEST_DEPENDS+=	${PYPKGPREFIX}-psutil-[0-9]*:../../sysutils/py-psutil
TEST_DEPENDS+=	${PYPKGPREFIX}-test-remotedata-[0-9]*:../../net/py-test-remotedata

USE_LANGUAGES=	# none

.include "../../lang/python/pyversion.mk"
.if ${PYTHON_VERSION} < 311
DEPENDS+=	${PYPKGPREFIX}-importlib-metadata>=4.11.4:../../devel/py-importlib-metadata
.endif

REPLACE_PYTHON+=	asdf/_jsonschema/json/bin/jsonschema_suite
REPLACE_PYTHON+=	asdf/extern/RangeHTTPServer.py

post-install:
	cd ${DESTDIR}${PREFIX}/bin && \
	${MV} asdftool asdftool-${PYVERSSUFFIX} || ${TRUE}

.include "../../lang/python/application.mk"
.include "../../lang/python/wheel.mk"
.include "../../mk/bsd.pkg.mk"
