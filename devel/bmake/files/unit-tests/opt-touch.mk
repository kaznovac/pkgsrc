# $NetBSD: opt-touch.mk,v 1.2 2024/09/17 11:52:32 jperkin Exp $
#
# Tests for the -t command line option.

.MAKEFLAGS: -t opt-touch-phony opt-touch-join opt-touch-use opt-touch-make

opt-touch-phony: .PHONY
	: Making $@.

opt-touch-join: .JOIN
	: Making $@.

opt-touch-use: .USE
	: Making use of $@.

opt-touch-make: .MAKE
	: Making $@.

.END:
	@files=$$(ls opt-touch-* 2>/dev/null | grep -v -e '\.' -e '\*'); \
	[ -z "$$files" ] || { echo "created files: $$files" 1>&2; exit 1; }
