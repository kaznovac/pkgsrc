# $NetBSD: Makefile,v 1.14 2024/06/06 12:05:45 adam Exp $

.include "../../security/py-certbot/Makefile.common"

DISTNAME=	certbot_dns_dnsimple-${CERTBOT_VERSION}
MASTER_SITES=	${MASTER_SITE_PYPI:=c/certbot-dns-dnsimple/}

COMMENT=	DNSimple DNS Authenticator plugin for Certbot

DEPENDS+=	${PYPKGPREFIX}-acme>=${CERTBOT_VERSION}:../../security/py-acme
DEPENDS+=	${PYPKGPREFIX}-certbot>=${CERTBOT_VERSION}:../../security/py-certbot
DEPENDS+=	${PYPKGPREFIX}-lexicon>=3.14.1:../../net/py-lexicon

.include "../../lang/python/wheel.mk"
.include "../../mk/bsd.pkg.mk"
