# $NetBSD: Makefile,v 1.33 2024/12/27 08:19:34 wiz Exp $

DISTNAME=	libhandy-1.8.0
PKGREVISION=	12
CATEGORIES=	devel gnome
MASTER_SITES=	${MASTER_SITE_GNOME:=sources/libhandy/${PKGVERSION_NOREV:R}/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://gnome.pages.gitlab.gnome.org/libhandy/
COMMENT=	Building blocks for modern adaptive GNOME apps
LICENSE=	gnu-lgpl-v2.1

USE_TOOLS+=	msgfmt pkg-config

PYTHON_FOR_BUILD_ONLY=	tool

PKGCONFIG_OVERRIDE_STAGE=	pre-install
PKGCONFIG_OVERRIDE+=		output/meson-private/libhandy-1.pc

BUILDLINK_DEPMETHOD.gobject-introspection?=	build
.include "../../devel/gobject-introspection/buildlink3.mk"
.include "../../devel/meson/build.mk"
.include "../../lang/vala/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
