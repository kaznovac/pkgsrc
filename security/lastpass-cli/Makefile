# $NetBSD: Makefile,v 1.36 2025/01/13 19:27:14 vins Exp $

DISTNAME=	lastpass-cli-1.6.1
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GITHUB:=lastpass/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	vins@NetBSD.org
HOMEPAGE=	https://github.com/lastpass/lastpass-cli/
COMMENT=	Command line interface to LastPass.com
LICENSE=	gnu-gpl-v2

TOOL_DEPENDS+=	asciidoc>=0:../../textproc/asciidoc

USE_LANGUAGES=	c c++
USE_TOOLS=	bash:test pkg-config

REPLACE_BASH+=	test/askpass-wrong.sh test/askpass.sh \
		test/assert.sh test/include.sh test/tests

CMAKE_CONFIGURE_ARGS=	-DOPENSSL_ROOT_DIR=${SSLBASE}

INSTALL_TARGET=	install install-doc
TEST_TARGET=	lpass-test test

.include "../../security/openssl/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../devel/cmake/build.mk"
.include "../../mk/bsd.pkg.mk"
