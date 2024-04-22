# $NetBSD$
#
# Precomputed variables file for macOS trunk.
#
# These variables are suitable for Sonoma/12.3 SDK trunk builds only!
#

NATIVE_OPSYS=		Darwin
NATIVE_OPSYS_VERSION=	140401
NATIVE_OS_VERSION=	23.4.0
OSX_VERSION=		14.4

CC_VERSION=		clang-15.0.0
OSX_PATH_TO_M4=		# broken CLT
OSX_PATH_TO_YACC=	# broken CLT
OSX_SDK_PATH=		/Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk

PKGTOOLS_VERSION=	20240307

UNPRIVILEGED_GROUP=	staff
UNPRIVILEGED_GROUPS=	staff
UNPRIVILEGED_USER=	pbulk
