# $NetBSD: Makefile,v 1.26 2024/10/13 16:46:17 taca Exp $

DISTNAME=	recog-3.1.11
CATEGORIES=	net

MAINTAINER=	minskim@NetBSD.org
HOMEPAGE=	https://github.com/rapid7/recog-ruby
COMMENT=	Framework to send network probes for identification
LICENSE=	2-clause-bsd

DEPENDS+=	${RUBY_PKGPREFIX}-nokogiri-[0-9]*:../../textproc/ruby-nokogiri

USE_LANGUAGES=	# none

RUBYGEM_OPTIONS+=	--format-executable
REPLACE_PYTHON=		update_cpes.py

.include "../../lang/ruby/gem.mk"
.include "../../lang/python/application.mk"
.include "../../mk/bsd.pkg.mk"
