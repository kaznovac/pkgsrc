$NetBSD: patch-mikutter.rb,v 1.12 2024/12/30 20:41:28 tsutsui Exp $

- pkgsrc can handle location of ruby binary
  https://dev.mikutter.hachune.net/issues/889

--- mikutter.rb.orig	2024-03-16 05:31:35.000000000 +0000
+++ mikutter.rb
@@ -1,7 +1,5 @@
-#!/bin/sh
+#! /usr/bin/ruby
 # -*- coding: utf-8; mode: ruby -*-
-exec ruby -x "$0" "$@"
-#!ruby
 =begin rdoc
 = mikutter - simple, powerful and moeful Mastodon client
 Copyright (C) 2009-2024 Toshiaki Asai
