# $NetBSD: Makefile,v 1.1 2024/12/13 16:58:48 taca Exp $

DISTNAME=	actionmailer-${RAILS_VERSION}
PKGNAME=	${RUBY_PKGPREFIX}-actionmailer${RUBY_RAILS}-${RAILS_VERSION}
CATEGORIES=	mail devel

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.rubyonrails.org/
COMMENT=	Email composition, delivery, and receiving (for Rails 7.2)
LICENSE=	mit

DEPENDS+=	${RUBY_ACTIONPACK_DEPENDS}
DEPENDS+=	${RUBY_ACTIONVIEW_DEPENDS}
DEPENDS+=	${RUBY_ACTIVEJOB_DEPENDS}
DEPENDS+=	${RUBY_PKGPREFIX}-mail>=2.8<3:../../mail/ruby-mail
# ruby-actionview already depends it.
#DEPENDS+=	${RUBY_PKGPREFIX}-rails-dom-testing>=2.2<3:../../textproc/ruby-rails-dom-testing

USE_LANGUAGES=	# none

RUBY_RAILS_ACCEPTED=	72
RUBY_RAILS_STRICT_DEP=	yes

.include "../../lang/ruby/gem.mk"
.include "../../mk/bsd.pkg.mk"
