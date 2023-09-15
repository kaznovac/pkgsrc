$NetBSD$

Backport memset_s assertion fix.

--- third_party/heimdal/lib/hcrypto/rand-fortuna.c.orig	2022-08-08 14:15:40.700202000 +0000
+++ third_party/heimdal/lib/hcrypto/rand-fortuna.c
@@ -336,7 +336,7 @@ add_entropy(FState * st, const unsigned
 	st->pool0_bytes += len;
 
     memset_s(hash, sizeof(hash), 0, sizeof(hash));
-    memset_s(&md, sizeof(hash), 0, sizeof(md));
+    memset_s(&md, sizeof(md), 0, sizeof(md));
 }
 
 /*
