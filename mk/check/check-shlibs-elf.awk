# $NetBSD: check-shlibs-elf.awk,v 1.22 2025/01/08 10:28:09 jperkin Exp $
#
# Copyright (c) 2007 Joerg Sonnenberger <joerg@NetBSD.org>.
# All rights reserved.
#
# This code was developed as part of Google's Summer of Code 2007 program.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in
#    the documentation and/or other materials provided with the
#    distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE
# COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
# AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
# OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.

#
# Read a list of potential ELF binaries from stdin.
# For each, extract the DT_RPATH, DT_RUNPATH and DT_NEEDED fields.
# Check that DT_RPATH and DT_RUNPATH is not relative to WRKDIR.
# Check that DT_NEEDED can be resolved either via DT_RPATH, DT_RUNPATH
# or a system specific default path.
# Check that the resolved DSO belongs to full dependency.
#

function shquote(IN,	out) {
	out = IN;
	gsub("\\\\", "\\\\", out);
	gsub("\n", "\\n", out);
	gsub("\t", "\\t", out);
	gsub(" ", "\\ ", out);
	gsub("'", "\\'", out);
	gsub("`", "\\`", out);
	gsub("\"", "\\\"", out);
	gsub(";", "\\;", out);
	gsub("&", "\\&", out);
	gsub("<", "\\<", out);
	gsub(">", "\\>", out);
	gsub("\\(", "\\(", out);
	gsub("\\)", "\\)", out);
	gsub("\\|", "\\|", out);
	gsub("\\*", "\\*", out);
	gsub("\\?", "\\?", out);
	gsub("\\{", "\\{", out);
	gsub("\\}", "\\}", out);
	gsub("\\[", "\\[", out);
	gsub("\\]", "\\]", out);
	gsub("\\$", "\\$", out);
	gsub("!", "\\!", out);
	gsub("#", "\\#", out);
	gsub("\\^", "\\^", out);
	gsub("~", "\\~", out);
	return out;
}

function check_pkg(DSO, lib,	pkg, found) {
	if (destdir == "")
		return 0
	if (lib in pkgcache) {
		pkg = pkgcache[lib]
	} else {
		cmd = pkg_info_cmd " -Fe " shquote(lib) " 2>/dev/null"
		if ((cmd | getline pkg) < 0) {
			close(cmd)
			return 0
		}
		close(cmd)
		pkgcache[lib] = pkg
	}
	if (pkg == "")
		return 0
	found = 0
	while ((getline < depends_file) > 0) {
		if ($3 == pkg) {
			found = 1
			if ($1 == "full" || $1 == "indirect-full") {
				close(depends_file)
				return 0
			}
		}
	}
	# Ideally we would error here if we found a dependency on any pkgsrc
	# library that isn't listed in the depends file.  However this doesn't
	# work for a variety of reasons, not least if the package itself is
	# already installed and its pkgsrc libraries are found before the ones
	# in DESTDIR.  A package obviously can't depend on itself...
	if (found)
		print DSO ": " lib ": " pkg " is not a runtime dependency"
	close(depends_file)
}

function checkshlib(DSO, needed, rpath, found, dso_rpath, got_rpath, nrpath) {
	cmd = readelf " -Wd " shquote(DSO) " 2> /dev/null"
	while ((cmd | getline) > 0) {
		if ($2 == "(RPATH)" || $2 == "(RUNPATH)") {
			sub("^[[:space:]]*0[xX][[:xdigit:]]+[[:space:]]+\\(RU?N?PATH\\)[[:space:]]+Library ru?n?path: \\[", "")
			dso_rpath = substr($0, 1, length($0) - 1)
			if (length(system_rpath) > 0)
				nrpath = split(dso_rpath ":" system_rpath, rpath, ":")
			else
				nrpath = split(dso_rpath, rpath, ":")
			got_rpath = 1
		}
		if ($2 == "(NEEDED)") {
			sub("^[[:space:]]*0[xX][[:xdigit:]]+[[:space:]]+\\(NEEDED\\)[[:space:]]+Shared library: \\[", "")
			needed[substr($0, 1, length($0) - 1)] = ""
		}
	}
	if (!got_rpath)
		nrpath = split(system_rpath, rpath, ":")
	close(cmd)
	for (p in rpath) {
		if (rpath[p] == wrkdir ||
		    substr(rpath[p], 1, length(wrkdir) + 1) == wrkdir "/") {
			print DSO ": rpath relative to WRKDIR"
		}
	}
	ntpaths = split(toxic, tpaths, " ")
	nedirs = split(extradirs, edirs, " ")
	for (lib in needed) {
		found = 0
		for (p = 1; p <= nrpath; p++) {
			libfile = destdir rpath[p] "/" lib
			if (!(libfile in libcache)) {
				libcache[libfile] = system("test -f " shquote(libfile))
			}
			if (!libcache[libfile]) {
				found = 1
				break
			}
			libfile = cross_destdir rpath[p] "/" lib
			if (!(libfile in libcache)) {
				libcache[libfile] = system("test -f " shquote(libfile))
			}
			if (!libcache[libfile]) {
				check_pkg(DSO, rpath[p] "/" lib)
				for (t = 1; t <= ntpaths; t++) {
					if (match(rpath[p] "/" lib, tpaths[t])) {
						print DSO ": resolved path " rpath[p] "/" lib " matches toxic " tpaths[t]
					}
				}
				for (e = 1; e <= nedirs; e++) {
					if (rpath[p] == edirs[e] ||
					    substr(rpath[p], 1, length(edirs[e]) + 1) == edirs[e] "/") {
						print DSO ": rpath " rpath[p] " relative to CHECK_WRKREF_EXTRA_DIRS directory " edirs[e]
					}
				}
				found = 1
				break
			}
		}
		if (found == 0)
			print DSO ": missing library: " lib;
	}
	delete rpath
	delete needed
}

BEGIN {
	system_rpath = ENVIRON["PLATFORM_RPATH"]
	cross_destdir = ENVIRON["CROSS_DESTDIR"]
	destdir = ENVIRON["DESTDIR"]
	readelf = ENVIRON["READELF"]
	wrkdir = ENVIRON["WRKDIR"]
	extradirs = ENVIRON["CHECK_WRKREF_EXTRA_DIRS"]
	toxic = ENVIRON["CHECK_SHLIBS_TOXIC"]
	pkg_info_cmd = ENVIRON["PKG_INFO_CMD"]
	depends_file = ENVIRON["DEPENDS_FILE"]
	if (readelf == "")
		readelf = "readelf"
}

{ checkshlib($0); }
