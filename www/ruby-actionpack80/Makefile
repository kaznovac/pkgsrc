# $NetBSD: Makefile,v 1.1 2025/01/02 07:10:55 taca Exp $

DISTNAME=	actionpack-${RAILS_VERSION}
PKGNAME=	${RUBY_PKGPREFIX}-actionpack${RUBY_RAILS}-${RAILS_VERSION}
CATEGORIES=	www

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.rubyonrails.org/
COMMENT=	Toolkit for building modeling frameworks (part of Rails 8.0)
LICENSE=	mit

DEPENDS+=	${RUBY_ACTIONVIEW_DEPENDS}
DEPENDS+=	${RUBY_PKGPREFIX}-rack>=2.2.4:../../www/ruby-rack
DEPENDS+=	${RUBY_PKGPREFIX}-rack-session>=1.0.1:../../www/ruby-rack-session
DEPENDS+=	${RUBY_PKGPREFIX}-rack-test>=0.6.3:../../www/ruby-rack-test
# ruby-actionview already depends them.
#DEPENDS+=	${RUBY_PKGPREFIX}-rails-dom-testing>=2.2.0<3:../../textproc/ruby-rails-dom-testing
#DEPENDS+=	${RUBY_PKGPREFIX}-rails-html-sanitizer>=1.6<2:../../www/ruby-rails-html-sanitizer

USE_LANGUAGES=	# none

RUBY_RAILS_ACCEPTED=	80
RUBY_RAILS_STRICT_DEP=	yes

.include "../../lang/ruby/gem.mk"
.include "../../mk/bsd.pkg.mk"
