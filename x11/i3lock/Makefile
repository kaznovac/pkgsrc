# $NetBSD: Makefile,v 1.16 2024/10/10 16:56:14 nia Exp $

DISTNAME=	i3lock-2.15
PKGREVISION=	2
CATEGORIES=	x11
MASTER_SITES=	https://i3wm.org/i3lock/
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://i3wm.org/i3lock/
COMMENT=	Slightly improved screen locker based on slock
LICENSE=	modified-bsd

USE_TOOLS+=	pkg-config

USE_CC_FEATURES+=	c11

INSTALLATION_DIRS+=	share/examples/i3lock/pam.d

CFLAGS.SunOS+=	-Du_int32_t=uint32_t
CFLAGS.SunOS+=	-D__EXTENSIONS__

BUILD_DEFS+=	SYSCONFBASE

.include "../../mk/bsd.prefs.mk"

.if ${OPSYS} == "NetBSD"
SUBST_CLASSES+=		pam
SUBST_STAGE.pam=	pre-configure
SUBST_FILES.pam+=	pam/i3lock
SUBST_SED.pam+=		-e "s,login,system,g"
.elif ${OPSYS} == "Linux"
SUBST_CLASSES+=		pam
SUBST_STAGE.pam=	pre-configure
SUBST_FILES.pam+=	pam/i3lock
SUBST_SED.pam+=		-e "s,login,system-auth,g"
.endif

.if ${UNPRIVILEGED:tl} != "yes"
CONF_FILES+=		${PREFIX}/share/examples/i3lock/pam.d/i3lock \
			${SYSCONFBASE}/pam.d/i3lock
SPECIAL_PERMS+=		bin/i3lock ${SETUID_ROOT_PERMS}
.endif

post-install:
	${MV} ${DESTDIR}${PKG_SYSCONFDIR}/pam.d/i3lock ${DESTDIR}${PREFIX}/share/examples/i3lock/pam.d/

.include "../../devel/meson/build.mk"
.include "../../devel/libev/buildlink3.mk"
.include "../../graphics/cairo/buildlink3.mk"
.include "../../x11/libxcb/buildlink3.mk"
.include "../../x11/libxkbcommon/buildlink3.mk"
.include "../../x11/xcb-util/buildlink3.mk"
.include "../../x11/xcb-util-image/buildlink3.mk"
.include "../../x11/xcb-util-keysyms/buildlink3.mk"
.include "../../x11/xcb-util-xrm/buildlink3.mk"
.include "../../mk/pam.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
