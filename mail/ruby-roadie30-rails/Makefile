# $NetBSD: Makefile,v 1.1 2024/11/06 15:46:47 taca Exp $

DISTNAME=	roadie-rails-3.0.0
PKGNAME=	${RUBY_PKGPREFIX}-${DISTNAME:S/-rails/30-rails${RUBY_RAILS}/}
CATEGORIES=	mail

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/Mange/roadie-rails
COMMENT=	Hooks Roadie into your Rails application version 3.0.x
LICENSE=	mit

DEPENDS+=	${RUBY_RAILTIES_DEPENDS}
DEPENDS+=	${RUBY_PKGPREFIX}-roadie>=5.0<6:../../mail/ruby-roadie

USE_LANGUAGES=	# none

CONFLICTS+=	${RUBY_PKGPREFIX}-roadie-rails${RUBY_RAILS}<3.1

RUBY_VERSIONS_ACCEPTED=	31

RUBY_RAILS_ACCEPTED=	61

.include "../../lang/ruby/gem.mk"
.include "../../mk/bsd.pkg.mk"
