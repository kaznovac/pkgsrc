$NetBSD: patch-lib_replace_replace.c,v 1.1 2024/11/10 15:15:05 ryoon Exp $

--- lib/replace/replace.c.orig	2024-11-05 12:40:55.499834069 +0000
+++ lib/replace/replace.c
@@ -970,7 +970,7 @@ int rep_memset_s(void *dest, size_t dest
 	}
 
 #if defined(HAVE_MEMSET_EXPLICIT)
-	memset_explicit(dest, destsz, ch, count);
+	memset_explicit(dest, ch, count);
 #else /* HAVE_MEMSET_EXPLICIT */
 	memset(dest, ch, count);
 # if defined(HAVE_GCC_VOLATILE_MEMORY_PROTECTION)
