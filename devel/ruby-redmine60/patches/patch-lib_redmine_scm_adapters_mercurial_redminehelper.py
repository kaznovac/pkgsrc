$NetBSD: patch-lib_redmine_scm_adapters_mercurial_redminehelper.py,v 1.1 2024/12/13 17:19:29 taca Exp $

Update Mercurial helper to work with Python 3.
https://www.redmine.org/issues/33784

--- lib/redmine/scm/adapters/mercurial/redminehelper.py.orig	2023-05-24 06:22:38.263411907 +0000
+++ lib/redmine/scm/adapters/mercurial/redminehelper.py
@@ -45,17 +45,20 @@ Output example of rhmanifest::
       </repository>
     </rhmanifest>
 """
-import re, time, cgi, urllib
+import re, time, html, urllib
 from mercurial import cmdutil, commands, node, error, hg, registrar
 
 cmdtable = {}
 command = registrar.command(cmdtable) if hasattr(registrar, 'command') else cmdutil.command(cmdtable)
 
-_x = cgi.escape
-_u = lambda s: cgi.escape(urllib.quote(s))
+_x = lambda s: html.escape(s.decode('utf-8')).encode('utf-8')
+_u = lambda s: html.escape(urllib.parse.quote(s)).encode('utf-8')
+
+def unquoteplus(*args, **kwargs):
+    return urllib.parse.unquote_to_bytes(*args, **kwargs).replace(b'+', b' ')
 
 def _changectx(repo, rev):
-    if isinstance(rev, str):
+    if isinstance(rev, bytes):
        rev = repo.lookup(rev)
     if hasattr(repo, 'changectx'):
         return repo.changectx(rev)
@@ -70,10 +73,10 @@ def _tip(ui, repo):
         except TypeError:  # Mercurial < 1.1
             return repo.changelog.count() - 1
     tipctx = _changectx(repo, tiprev())
-    ui.write('<tip revision="%d" node="%s"/>\n'
+    ui.write(b'<tip revision="%d" node="%s"/>\n'
              % (tipctx.rev(), _x(node.hex(tipctx.node()))))
 
-_SPECIAL_TAGS = ('tip',)
+_SPECIAL_TAGS = (b'tip',)
 
 def _tags(ui, repo):
     # see mercurial/commands.py:tags
@@ -84,7 +87,7 @@ def _tags(ui, repo):
             r = repo.changelog.rev(n)
         except error.LookupError:
             continue
-        ui.write('<tag revision="%d" node="%s" name="%s"/>\n'
+        ui.write(b'<tag revision="%d" node="%s" name="%s"/>\n'
                  % (r, _x(node.hex(n)), _u(t)))
 
 def _branches(ui, repo):
@@ -104,136 +107,146 @@ def _branches(ui, repo):
             return repo.branchheads(branch)
     def lookup(rev, n):
         try:
-            return repo.lookup(rev)
+            return repo.lookup(str(rev).encode('utf-8'))
         except RuntimeError:
             return n
     for t, n, r in sorted(iterbranches(), key=lambda e: e[2], reverse=True):
         if lookup(r, n) in branchheads(t):
-            ui.write('<branch revision="%d" node="%s" name="%s"/>\n'
+            ui.write(b'<branch revision="%d" node="%s" name="%s"/>\n'
                      % (r, _x(node.hex(n)), _u(t)))
 
 def _manifest(ui, repo, path, rev):
     ctx = _changectx(repo, rev)
-    ui.write('<manifest revision="%d" path="%s">\n'
+    ui.write(b'<manifest revision="%d" path="%s">\n'
              % (ctx.rev(), _u(path)))
 
     known = set()
-    pathprefix = (path.rstrip('/') + '/').lstrip('/')
+    pathprefix = (path.decode('utf-8').rstrip('/') + '/').lstrip('/')
     for f, n in sorted(ctx.manifest().iteritems(), key=lambda e: e[0]):
-        if not f.startswith(pathprefix):
+        fstr = f.decode('utf-8')
+        if not fstr.startswith(pathprefix):
             continue
-        name = re.sub(r'/.*', '/', f[len(pathprefix):])
+        name = re.sub(r'/.*', '/', fstr[len(pathprefix):])
         if name in known:
             continue
         known.add(name)
 
         if name.endswith('/'):
-            ui.write('<dir name="%s"/>\n'
-                     % _x(urllib.quote(name[:-1])))
+            ui.write(b'<dir name="%s"/>\n'
+                     % _x(urllib.parse.quote(name[:-1]).encode('utf-8')))
         else:
             fctx = repo.filectx(f, fileid=n)
             tm, tzoffset = fctx.date()
-            ui.write('<file name="%s" revision="%d" node="%s" '
-                     'time="%d" size="%d"/>\n'
+            ui.write(b'<file name="%s" revision="%d" node="%s" '
+                     b'time="%d" size="%d"/>\n'
                      % (_u(name), fctx.rev(), _x(node.hex(fctx.node())),
                         tm, fctx.size(), ))
 
-    ui.write('</manifest>\n')
+    ui.write(b'</manifest>\n')
 
-@command('rhannotate',
-         [('r', 'rev', '', 'revision'),
-          ('u', 'user', None, 'list the author (long with -v)'),
-          ('n', 'number', None, 'list the revision number (default)'),
-          ('c', 'changeset', None, 'list the changeset'),
+@command(b'rhannotate',
+         [(b'r', b'rev', b'', b'revision'),
+          (b'u', b'user', None, b'list the author (long with -v)'),
+          (b'n', b'number', None, b'list the revision number (default)'),
+          (b'c', b'changeset', None, b'list the changeset'),
          ],
-         'hg rhannotate [-r REV] [-u] [-n] [-c] FILE...')
+         b'hg rhannotate [-r REV] [-u] [-n] [-c] FILE...')
 def rhannotate(ui, repo, *pats, **opts):
-    rev = urllib.unquote_plus(opts.pop('rev', None))
+    rev = unquoteplus(opts.pop('rev', b''))
     opts['rev'] = rev
-    return commands.annotate(ui, repo, *map(urllib.unquote_plus, pats), **opts)
+    return commands.annotate(ui, repo, *map(unquoteplus, pats), **opts)
 
-@command('rhcat',
-               [('r', 'rev', '', 'revision')],
-               'hg rhcat ([-r REV] ...) FILE...')
+@command(b'rhcat',
+               [(b'r', b'rev', b'', b'revision')],
+               b'hg rhcat ([-r REV] ...) FILE...')
 def rhcat(ui, repo, file1, *pats, **opts):
-    rev = urllib.unquote_plus(opts.pop('rev', None))
+    rev = unquoteplus(opts.pop('rev', b''))
     opts['rev'] = rev
-    return commands.cat(ui, repo, urllib.unquote_plus(file1), *map(urllib.unquote_plus, pats), **opts)
+    return commands.cat(ui, repo, unquoteplus(file1), *map(unquoteplus, pats), **opts)
 
-@command('rhdiff',
-               [('r', 'rev', [], 'revision'),
-                ('c', 'change', '', 'change made by revision')],
-               'hg rhdiff ([-c REV] | [-r REV] ...) [FILE]...')
+@command(b'rhdiff',
+               [(b'r', b'rev', [], b'revision'),
+                (b'c', b'change', b'', b'change made by revision')],
+               b'hg rhdiff ([-c REV] | [-r REV] ...) [FILE]...')
 def rhdiff(ui, repo, *pats, **opts):
     """diff repository (or selected files)"""
     change = opts.pop('change', None)
     if change:  # add -c option for Mercurial<1.1
         base = _changectx(repo, change).parents()[0].rev()
-        opts['rev'] = [str(base), change]
+        opts['rev'] = [base, change]
     opts['nodates'] = True
-    return commands.diff(ui, repo, *map(urllib.unquote_plus, pats), **opts)
+    return commands.diff(ui, repo, *map(unquoteplus, pats), **opts)
 
-@command('rhlog',
+@command(b'rhlog',
                    [
-                    ('r', 'rev', [], 'show the specified revision'),
-                    ('b', 'branch', [],
-                       'show changesets within the given named branch'),
-                    ('l', 'limit', '',
-                         'limit number of changes displayed'),
-                    ('d', 'date', '',
-                         'show revisions matching date spec'),
-                    ('u', 'user', [],
-                      'revisions committed by user'),
-                    ('', 'from', '',
-                      ''),
-                    ('', 'to', '',
-                      ''),
-                    ('', 'rhbranch', '',
-                      ''),
-                    ('', 'template', '',
-                       'display with template')],
-                   'hg rhlog [OPTION]... [FILE]')
+                    (b'r', b'rev', [], b'show the specified revision'),
+                    (b'b', b'branch', [],
+                       b'show changesets within the given named branch'),
+                    (b'l', b'limit', b'',
+                         b'limit number of changes displayed'),
+                    (b'd', b'date', b'',
+                         b'show revisions matching date spec'),
+                    (b'u', b'user', [],
+                      b'revisions committed by user'),
+                    (b'', b'from', b'',
+                      b''),
+                    (b'', b'to', b'',
+                      b''),
+                    (b'', b'rhbranch', b'',
+                      b''),
+                    (b'', b'template', b'',
+                       b'display with template')],
+                   b'hg rhlog [OPTION]... [FILE]')
 def rhlog(ui, repo, *pats, **opts):
     rev      = opts.pop('rev')
     bra0     = opts.pop('branch')
-    from_rev = urllib.unquote_plus(opts.pop('from', None))
-    to_rev   = urllib.unquote_plus(opts.pop('to'  , None))
-    bra      = urllib.unquote_plus(opts.pop('rhbranch', None))
-    from_rev = from_rev.replace('"', '\\"')
-    to_rev   = to_rev.replace('"', '\\"')
-    if hg.util.version() >= '1.6':
-      opts['rev'] = ['"%s":"%s"' % (from_rev, to_rev)]
+    from_rev = unquoteplus(opts.pop('from', b''))
+    to_rev   = unquoteplus(opts.pop('to'  , b''))
+    bra      = unquoteplus(opts.pop('rhbranch', b''))
+    from_rev = from_rev.replace(b'"', b'\\"')
+    to_rev   = to_rev.replace(b'"', b'\\"')
+    if (from_rev != b'') or (to_rev != b''):
+        if from_rev != b'':
+            quotefrom = b'"%s"' % (from_rev)
+        else:
+            quotefrom = from_rev
+        if to_rev != b'':
+            quoteto = b'"%s"' % (to_rev)
+        else:
+            quoteto = to_rev
+        opts['rev'] = [b'%s:%s' % (quotefrom, quoteto)]
     else:
-      opts['rev'] = ['%s:%s' % (from_rev, to_rev)]
-    opts['branch'] = [bra]
-    return commands.log(ui, repo, *map(urllib.unquote_plus, pats), **opts)
-
-@command('rhmanifest',
-                   [('r', 'rev', '', 'show the specified revision')],
-                   'hg rhmanifest [-r REV] [PATH]')
-def rhmanifest(ui, repo, path='', **opts):
+        opts['rev'] = rev
+    if (bra != b''):
+        opts['branch'] = [bra]
+    return commands.log(ui, repo, *map(unquoteplus, pats), **opts)
+
+@command(b'rhmanifest',
+                   [(b'r', b'rev', b'', b'show the specified revision')],
+                   b'hg rhmanifest -r REV [PATH]')
+def rhmanifest(ui, repo, path=b'', **opts):
     """output the sub-manifest of the specified directory"""
-    ui.write('<?xml version="1.0"?>\n')
-    ui.write('<rhmanifest>\n')
-    ui.write('<repository root="%s">\n' % _u(repo.root))
+    ui.write(b'<?xml version="1.0"?>\n')
+    ui.write(b'<rhmanifest>\n')
+    ui.write(b'<repository root="%s">\n' % _u(repo.root))
     try:
-        _manifest(ui, repo, urllib.unquote_plus(path), urllib.unquote_plus(opts.get('rev')))
+        _manifest(ui, repo, unquoteplus(path), unquoteplus(opts.get('rev')))
     finally:
-        ui.write('</repository>\n')
-        ui.write('</rhmanifest>\n')
+        ui.write(b'</repository>\n')
+        ui.write(b'</rhmanifest>\n')
 
-@command('rhsummary',[], 'hg rhsummary')
+@command(b'rhsummary', [], b'hg rhsummary')
 def rhsummary(ui, repo, **opts):
     """output the summary of the repository"""
-    ui.write('<?xml version="1.0"?>\n')
-    ui.write('<rhsummary>\n')
-    ui.write('<repository root="%s">\n' % _u(repo.root))
+    ui.write(b'<?xml version="1.0"?>\n')
+    ui.write(b'<rhsummary>\n')
+    ui.write(b'<repository root="%s">\n' % _u(repo.root))
     try:
         _tip(ui, repo)
         _tags(ui, repo)
         _branches(ui, repo)
         # TODO: bookmarks in core (Mercurial>=1.8)
     finally:
-        ui.write('</repository>\n')
-        ui.write('</rhsummary>\n')
+        ui.write(b'</repository>\n')
+        ui.write(b'</rhsummary>\n')
 
