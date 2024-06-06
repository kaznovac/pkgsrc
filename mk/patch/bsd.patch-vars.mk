# $NetBSD: bsd.patch-vars.mk,v 1.7 2008/06/09 14:47:03 sketch Exp $
#
# This Makefile fragment is included separately by bsd.pkg.mk and
# defines some variables which must be defined earlier than where
# bsd.patch.mk is included.
#
# Package-settable variables:
#
#    PATCHFILES is a list of distribution patches relative to
#	${_DISTDIR} that are applied first to the package.
#
#    PATCHDIR is the location of the pkgsrc patches for the package.
#	This defaults to the "patches" subdirectory of the package
#	directory.
#
# User-settable variables:
#
#    LOCALPATCHES is the location of local patches that are maintained
#	in a directory tree reflecting the same hierarchy as the pkgsrc
#	tree, e.g., local patches for www/apache would be found in
#	${LOCALPATCHES}/www/apache.  These patches are applied after
#	the patches in ${PATCHDIR}.
#

# The default PATCHDIR is currently set in bsd.prefs.mk
#PATCHDIR?=	${.CURDIR}/patches

PATCHFILES?=	# none

.if !empty(LOCALPATCHES)
local_patches=	${:!echo ${LOCALPATCHES}/${PKGPATH}/*!:N*/CVS:N*/\*}
.endif

# Optimise away check for patch-*, requires using version control that cleans
# up empty directories.
.if !empty(PATCHFILES) || exists(${PATCHDIR})
USE_TOOLS+=	digest:bootstrap patch
.elif !empty(local_patches)
USE_TOOLS+=	patch
.endif

# These tools are used to output the contents of the distribution patches
# to stdout.
#
.if !empty(PATCHFILES)
USE_TOOLS+=	cat
.  if !empty(PATCHFILES:M*.Z) || !empty(PATCHFILES:M*.gz)
USE_TOOLS+=	gzcat
.  endif
.  if !empty(PATCHFILES:M*.bz2)
USE_TOOLS+=	bzcat
.  endif
.endif
