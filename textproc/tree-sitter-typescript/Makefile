# $NetBSD: Makefile,v 1.6 2024/11/17 10:09:01 wiz Exp $

DISTNAME=	tree-sitter-typescript-0.23.2
CATEGORIES=	textproc devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=tree-sitter/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/tree-sitter/tree-sitter-typescript/
COMMENT=	TypeScript grammar for tree-sitter
LICENSE=	mit

GRAMMAR_SOURCE_DIR=	typescript/src

.include "../../textproc/tree-sitter/grammar.mk"
.include "../../mk/bsd.pkg.mk"
