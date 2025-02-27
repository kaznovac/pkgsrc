# $NetBSD: bsd.install.mk,v 1.19 2025/01/08 10:21:47 jperkin Exp $
#
# This Makefile fragment is included by bsd.pkg.mk and provides all
# variables and targets related to installing packages.
#
# The following are the "public" targets provided this module:
#
#    install, stage-install, deinstall, reinstall, replace, undo-replace
#
# The following targets may be overridden in a package Makefile:
#
#    pre-install, do-install, post-install
#

_COOKIE.install=	${WRKDIR}/.install_done

######################################################################
### install (PUBLIC)
######################################################################
### install is a public target to install the package by depending
### on package-install.
###
.PHONY: install
install: package-install

######################################################################
### stage-install (PUBLIC)
######################################################################
### stage-install is a public target to install the package to
### to ${DESTDIR}${PREFIX}.
###
.PHONY: stage-install
.if !defined(NO_INSTALL)
.  include "install.mk"
.else
.  if exists(${_COOKIE.install}) && !${_CLEANING}
stage-install:
	@${DO_NADA}
.  elif defined(_PKGSRC_BARRIER)
stage-install: ${_PKGSRC_BUILD_TARGETS} install-cookie
.  else
stage-install: barrier
.  endif
.endif

.include "deinstall.mk"
.include "replace.mk"

######################################################################
### install-cookie (PRIVATE)
######################################################################
### install-cookie creates the "install" cookie file.
###
.PHONY: install-cookie
install-cookie:
	${RUN}								\
	[ ! -f ${_COOKIE.install} ];					\
	${TEST} -d ${_COOKIE.install:H} || ${MKDIR} ${_COOKIE.install:H}; \
	${ECHO} ${PKGNAME} > ${_COOKIE.install}
