# $NetBSD: Makefile,v 1.99 2024/11/29 19:57:48 lloyd Exp $

DISTNAME=	Trac-1.6
PKGNAME=	${DISTNAME:tl}
#PKGREVISION=	1
CATEGORIES=	www devel
MASTER_SITES=	http://ftp.edgewall.org/pub/trac/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://trac.edgewall.org/
COMMENT=	Repository browser, wiki, and issue tracking system
LICENSE=	modified-bsd

# Updates to micro-releases along stable branches are commited without
# testing.
#
# Trac supports svn and git in the base, plus others via plugins,
# using them at runtime if configured.  Therefore this package does
# not depend on svn or git to avoid installing them for trac installs
# that use the other.

DEPENDS+=	${PYPKGPREFIX}-jinja2>=2.11:../../textproc/py-jinja2

USE_TOOLS+=	pax

PYTHON_VERSIONS_INCOMPATIBLE=	27

USE_PKG_RESOURCES=	yes

REPLACE_PYTHON=		contrib/*.py contrib/*-hook
REPLACE_PYTHON+=	trac/tests/functional/*.py

.include "../../lang/python/application.mk"

EGDIR=		${PREFIX}/share/examples/trac

post-install:
	${INSTALL_DATA_DIR} ${DESTDIR}${EGDIR}
	cd ${WRKSRC}/contrib && pax -rwppm -s ',./rpm/.*$$,,' -s ',./rpm$$,,' \
		. ${DESTDIR}${EGDIR}

.include "options.mk"

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
