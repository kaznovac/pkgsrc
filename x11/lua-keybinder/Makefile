# $NetBSD: Makefile,v 1.24 2024/12/27 08:20:59 wiz Exp $

PKGREVISION= 22
.include "../../x11/keybinder/Makefile.common"

PKGNAME=	${LUA_PKGPREFIX}-${DISTNAME}
CATEGORIES=	x11 lua

MAINTAINER=	pkgsrc-users@NetBSD.org
COMMENT=	Lua bindings for the keybinder library
LICENSE=	gnu-gpl-v2

# --enable-lua is broken
CONFIGURE_ARGS+=	--disable-python

INSTALL_DIRS=	lua-keybinder

LUA_VERSIONS_ACCEPTED=	51

.include "../../x11/keybinder/buildlink3.mk"
.include "../../lang/lua/luaversion.mk"
.include "../../lang/lua/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
