$NetBSD: patch-external_mariadb-connector-c_UnpackedTarball__mariadb-connector-c.mk,v 1.4 2025/01/11 14:06:28 ryoon Exp $

--- external/mariadb-connector-c/UnpackedTarball_mariadb-connector-c.mk.orig	2024-12-12 21:46:45.000000000 +0000
+++ external/mariadb-connector-c/UnpackedTarball_mariadb-connector-c.mk
@@ -27,6 +27,8 @@ $(eval $(call gb_UnpackedTarball_set_pat
 
 $(eval $(call gb_UnpackedTarball_add_patches,mariadb-connector-c,\
     external/mariadb-connector-c/clang-cl.patch.0 \
+    external/mariadb-connector-c/netbsd.patch \
+    external/mariadb-connector-c/fix-debug-i386.patch.0 \
 ))
 
 # TODO are any "plugins" needed?
