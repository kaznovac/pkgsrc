# $NetBSD: var-readonly.mk,v 1.2 2024/09/17 11:52:33 jperkin Exp $

# the answer
N = 42
.READONLY: N
# this should be ignored
N = 666
.if ${N} != 42
.error N ($N) should be 42
.endif

# undef should fail
.MAKEFLAGS: -dv
.undef N
.ifndef N
.error N should not be undef'd
.endif
.MAKEFLAGS: -d0

.NOREADONLY: N
# now we can change it
N = 69
.if ${N} == 42
.error N should not be 42
.endif

all:
