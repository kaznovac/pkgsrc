# $NetBSD: Makefile,v 1.29 2024/12/08 16:23:05 taca Exp $

DISTNAME=	async-2.21.1
CATEGORIES=	devel

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/socketry/async
COMMENT=	Concurrency framework for Ruby
LICENSE=	mit

USE_LANGUAGES=	# none

DEPENDS+=	${RUBY_PKGPREFIX}-console>=1.29<2:../../devel/ruby-console
DEPENDS+=	${RUBY_PKGPREFIX}-io-event>=1.6.5<2:../../devel/ruby-io-event
DEPENDS+=	${RUBY_PKGPREFIX}-fiber-annotation>=0:../../devel/ruby-fiber-annotation

.include "../../lang/ruby/gem.mk"
.include "../../mk/bsd.pkg.mk"
