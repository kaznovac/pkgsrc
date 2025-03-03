# $NetBSD: Makefile,v 1.103 2024/12/11 23:32:49 riastradh Exp $
#
# Changelog sometimes at: https://www.mercurial-scm.org/wiki/WhatsNew

DISTNAME=	mercurial-${VERSION}
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel scm
MASTER_SITES=	https://www.mercurial-scm.org/release/

MAINTAINER=	wiz@NetBSD.org
HOMEPAGE=	https://www.mercurial-scm.org/
COMMENT=	Fast, lightweight source control management system
LICENSE=	gnu-gpl-v2 OR gnu-gpl-v3 # OR newer

TOOL_DEPENDS+=	${PYPKGPREFIX}-setuptools-[0-9]*:../../devel/py-setuptools

USE_TOOLS+=	gmake msgfmt

CPPFLAGS.SunOS+=	-D_XOPEN_SOURCE=600	# msg_control
LDFLAGS.SunOS+=		-lsocket

INSTALLATION_DIRS=	bin ${PKGMANDIR}/man1 ${PKGMANDIR}/man5
INSTALLATION_DIRS+=	share/doc/mercurial

PYTHON_SELF_CONFLICT=		yes

.include "version.mk"

USE_TOOLS+=		bash:test
# Test status as of 6.9
# Ran 943 tests, 81 skipped, 2 failed.
# test-revlog-mmapindex.t
# https://bz.mercurial-scm.org/show_bug.cgi?id=6899
# test-locale.t
# https://bz.mercurial-scm.org/show_bug.cgi?id=6948

TEST_TARGET=		tests
TEST_MAKE_FLAGS+=	PYTHON=${PYTHONBIN} TESTFLAGS=${_MAKE_JOBS:Q}
TEST_MAKE_FLAGS+=	CARGO=/dev/null

post-build:
	${RUN} cd ${WRKSRC} && ${BUILD_MAKE_CMD} build-chg

post-install:
	cd ${WRKSRC} && PYTHON=${PYTHONBIN} make install-chg \
	    PREFIX=${DESTDIR}/${PREFIX} \
	    MANDIR=${DESTDIR}${PREFIX}/${PKGMANDIR}/man1
	${INSTALL_DATA} ${WRKSRC}/doc/*.1  ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1
	${INSTALL_DATA} ${WRKSRC}/doc/*.5  ${DESTDIR}${PREFIX}/${PKGMANDIR}/man5
	${INSTALL_DATA} ${WRKSRC}/README.rst  \
		${DESTDIR}${PREFIX}/share/doc/mercurial

do-test:
	cd ${WRKSRC} && ${SETENV} ${TEST_ENV} make tests ${TEST_MAKE_FLAGS}

.include "../../lang/python/batteries-included.mk"
.include "../../lang/python/wheel.mk"
.include "../../mk/bsd.pkg.mk"
