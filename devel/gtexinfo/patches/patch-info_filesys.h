$NetBSD: patch-info_filesys.h,v 1.1 2024/11/01 08:37:29 adam Exp $

Use PKGSRC_INFOPATH.

--- info/filesys.h.orig	2014-12-29 11:29:54.000000000 +0000
+++ info/filesys.h
@@ -68,7 +68,7 @@ extern int is_dir_name (char *filename);
 
 /* The default value of INFOPATH. */
 #if !defined (DEFAULT_INFOPATH)
-#  define DEFAULT_INFOPATH "PATH:/usr/local/info:/usr/info:/usr/local/lib/info:/usr/lib/info:/usr/local/gnu/info:/usr/local/gnu/lib/info:/usr/gnu/info:/usr/gnu/lib/info:/opt/gnu/info:/usr/share/info:/usr/share/lib/info:/usr/local/share/info:/usr/local/share/lib/info:/usr/gnu/lib/emacs/info:/usr/local/gnu/lib/emacs/info:/usr/local/lib/emacs/info:/usr/local/emacs/info:."
+#  define DEFAULT_INFOPATH ".:" PKGSRC_INFOPATH ":PATH:/usr/local/info:/usr/info:/usr/local/lib/info:/usr/lib/info:/usr/local/gnu/info:/usr/local/gnu/lib/info:/usr/gnu/info:/usr/gnu/lib/info:/opt/gnu/info:/usr/share/info:/usr/share/lib/info:/usr/local/share/info:/usr/local/share/lib/info:/usr/gnu/lib/emacs/info:/usr/local/gnu/lib/emacs/info:/usr/local/lib/emacs/info:/usr/local/emacs/info"
 #endif /* !DEFAULT_INFOPATH */
 
 #if !defined (S_ISREG) && defined (S_IFREG)
