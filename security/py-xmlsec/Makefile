# $NetBSD: Makefile,v 1.33 2024/11/14 22:21:33 wiz Exp $

DISTNAME=	pyxmlsec-0.3.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/py//}
PKGREVISION=	18
CATEGORIES=	security python
MASTER_SITES=	http://labs.libre-entreprise.org/frs/download.php/897/

MAINTAINER=	pmcphee@givex.com
HOMEPAGE=	http://pyxmlsec.labs.libre-entreprise.org/
COMMENT=	Python bindings for XMLSec Library
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-libxml2-[0-9]*:../../textproc/py-libxml2

USE_TOOLS+=	pkg-config

PYTHON_VERSIONS_ACCEPTED=	27 # not yet ported as of 0.3.1

.include "../../security/openssl/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../security/xmlsec1/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
