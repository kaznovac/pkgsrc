# $NetBSD: Makefile,v 1.4 2024/11/11 07:28:38 wiz Exp $

DISTNAME=	authheaders-0.16.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	mail python
MASTER_SITES=	${MASTER_SITE_PYPI:=a/authheaders/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/ValiMail/authentication-headers
COMMENT=	Library for email authentication header verification and generation
LICENSE=	zpl-2.1

TOOL_DEPENDS+=	${PYPKGPREFIX}-setuptools-[0-9]*:../../devel/py-setuptools
DEPENDS+=	${PYPKGPREFIX}-authres>=1.2.0:../../mail/py-authres
DEPENDS+=	${PYPKGPREFIX}-dkim>=0.7.1:../../mail/py-dkim
DEPENDS+=	${PYPKGPREFIX}-dns-[0-9]*:../../net/py-dns
DEPENDS+=	${PYPKGPREFIX}-publicsuffix2-[0-9]*:../../www/py-publicsuffix2

USE_LANGUAGES=	# none

PYTHON_VERSIONS_INCOMPATIBLE=	27

post-install:
	cd ${DESTDIR}${PREFIX}/bin && \
	${MV} dmarc-policy-find dmarc-policy-find-${PYVERSSUFFIX} || ${TRUE}

.include "../../lang/python/wheel.mk"
.include "../../mk/bsd.pkg.mk"
