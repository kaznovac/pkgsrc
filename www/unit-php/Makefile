# $NetBSD: Makefile,v 1.15 2025/01/13 17:28:40 taca Exp $

PKGNAME=	unit-${LANG}${PKG_PHP_VERSION}-${UNIT_VERSION}
COMMENT=	PHP module for NGINX Unit

LANG=		php
MODNAME=	${LANG}${PHP_VERSION}

MAINTAINER=	osa@NetBSD.org

.include "../../lang/php/phpversion.mk"

post-configure:
	${RUN} cd ${WRKSRC} && ${SETENV} ${_CONFIGURE_SCRIPT_ENV}	\
		${CONFIG_SHELL} ${CONFIG_SHELL_FLAGS} 			\
			${CONFIGURE_SCRIPT} ${LANG}			\
				--lib-path=${PREFIX}/lib		\
				--module=${MODNAME}

.include "${PHPPKGSRCDIR}/buildlink3.mk"
.if empty(PKG_BUILD_OPTIONS.php:Mphp-embed)
PKG_FAIL_REASON=	"Requires the php-embed option enabled in PHP."
.endif
.include "../../www/unit/ext.mk"
.include "../../www/unit/Makefile.common"
.include "../../mk/bsd.pkg.mk"
