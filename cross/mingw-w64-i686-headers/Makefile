# $NetBSD: Makefile,v 1.2 2024/11/28 20:10:27 ryoon Exp $

.include "../../cross/mingw-w64-x86_64-headers/Makefile.common"

PKGNAME=		${DISTNAME:S/mingw-w64-v/mingw-w64-i686-headers-${CRT_TYPE}-/}
COMMENT=		Mingw-w64 headers for win32 cross-development (${CRT_TYPE})

CRT_TYPE=		ucrt
MINGW_TARGET=		${MINGW_W64_32_TARGET}

.include "../../mk/bsd.pkg.mk"
