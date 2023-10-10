# $NetBSD$
#
# This file determines if a pkgsrc GCC should be selected, if the user has not
# specified that the native compiler must be used (with USE_NATIVE_GCC=yes).
#
# GCC selection is calculated based on either direct GCC_REQD requirements from
# the package, or indirectly via USE_CC_FEATURES and USE_CXX_FEATURES which
# will compute an appropriate GCC_REQD.
#
# If the default compiler is deemed to be too old then a suitable pkgsrc GCC
# will be built and depended upon.  To avoid a heavy dependency on the full GCC
# package, users may want to then set USE_PKGSRC_GCC_RUNTIME=yes to instead
# build against and depend upon the smaller gcc*-libs packages which repackage
# just the GCC runtime libraries.
#
