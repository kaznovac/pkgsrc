# $NetBSD: Makefile,v 1.50 2024/12/27 08:19:30 wiz Exp $

PKGREVISION= 4
.include "../../databases/rrdtool/Makefile.common"

PKGNAME=	${RUBY_PKGPREFIX}-${DISTNAME}

USE_RUBY_EXTCONF=	yes
EXTRACT_ELEMENTS=	${DISTNAME}/bindings/ruby ${DISTNAME}/src
WRKSRC=			${WRKDIR}/${DISTNAME}/bindings/ruby
MAKE_ENV+=		ABS_TOP_BUILDDIR=${WRKDIR}/${DISTNAME}

pre-configure:
	${RM} ${WRKDIR}/${DISTNAME}/src/rrd_config.h

.include "../../databases/rrdtool/buildlink3.mk"
.include "../../lang/ruby/modules.mk"
.include "../../mk/bsd.pkg.mk"
