# $NetBSD: Makefile,v 1.9 2025/01/08 01:52:38 gutteridge Exp $

GITHUB_PROJECT=	ocaml-git
DISTNAME=	${GITHUB_PROJECT}-2.0.0
PKGREVISION=	3
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=mirage/}

MAINTAINER=	jaapb@NetBSD.org
HOMEPAGE=	https://github.com/mirage/ocaml-git/
COMMENT=	Pure-language git bindings for OCaml
LICENSE=	isc

BROKEN=		"Fails to build since archivers/ocaml-decompress 1.4.3 update"

USE_LANGUAGES=	# none

OCAML_USE_DUNE=		yes
DUNE_BUILD_PACKAGES=	git
OPAM_INSTALL_FILES=	git

.include "options.mk"
.include "../../archivers/ocaml-decompress/buildlink3.mk"
.include "../../devel/ocaml-astring/buildlink3.mk"
.include "../../devel/ocaml-angstrom/buildlink3.mk"
.include "../../devel/ocaml-checkseum/buildlink3.mk"
.include "../../devel/ocaml-cstruct/buildlink3.mk"
.include "../../devel/ocaml-digestif/buildlink3.mk"
.include "../../devel/ocaml-duff/buildlink3.mk"
.include "../../devel/ocaml-encore/buildlink3.mk"
.include "../../devel/ocaml-fmt/buildlink3.mk"
.include "../../devel/ocaml-fpath/buildlink3.mk"
.include "../../devel/ocaml-hex/buildlink3.mk"
.include "../../devel/ocaml-logs/buildlink3.mk"
.include "../../devel/ocaml-lru/buildlink3.mk"
.include "../../devel/ocaml-lwt/buildlink3.mk"
.include "../../devel/ocaml-ocplib-endian/buildlink3.mk"
.include "../../devel/ocaml-rresult/buildlink3.mk"
.include "../../devel/ocamlgraph/buildlink3.mk"
.include "../../www/ocaml-cohttp/buildlink3.mk"
.include "../../www/ocaml-uri/buildlink3.mk"
.include "../../lang/ocaml/ocaml.mk"
.include "../../mk/bsd.pkg.mk"
