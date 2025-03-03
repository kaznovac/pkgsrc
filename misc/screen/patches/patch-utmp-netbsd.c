$NetBSD: patch-utmp-netbsd.c,v 1.1 2025/01/09 20:07:04 ktnb Exp $

Code to handle the login slot in utmp when utmpx is available.
Daemons shipped with NetBSD tend to write to both, while 3rd
party software might write to only one.

--- utmp-netbsd.c.orig	2015-02-13 04:30:05.000000000 +0000
+++ utmp-netbsd.c
@@ -0,0 +1,79 @@
+#include <sys/param.h>
+#if defined(__NetBSD_Version__) && (__NetBSD_Version__ >= 106050000)
+
+#include <sys/types.h>
+#include <sys/time.h>
+#include <sys/wait.h>
+
+#include <errno.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <time.h>
+#include <ttyent.h>
+#include <unistd.h>
+#include <util.h>
+#include <utmp.h>
+
+static struct utmp saved_utmp;
+static int saved_utmp_ok = 0;
+
+int
+lineslot(line)
+char *line;
+{
+	int slot;
+	struct ttyent *ttyp;
+
+	setttyent();
+	for (slot = 1; (ttyp = getttyent()) != NULL; ++slot)
+		if (!strcmp(ttyp->ty_name, line)) {
+			endttyent();
+			return(slot);
+		}
+	endttyent();
+	return(0);
+}
+
+void
+utmp_login(line)
+char *line;
+{
+	int fd;
+	int tty;
+
+	if (!saved_utmp_ok)
+		return;
+
+	tty = lineslot(line);
+	if (tty > 0 && (fd = open(_PATH_UTMP, O_WRONLY|O_CREAT, 0644)) >= 0) {
+		(void)lseek(fd, (off_t)(tty * sizeof(struct utmp)), SEEK_SET);
+		(void)write(fd, &saved_utmp, sizeof(struct utmp));
+		(void)close(fd);
+	}
+}
+
+void
+utmp_logout(const char *line)
+{
+	int fd;
+	struct utmp ut;
+
+	if ((fd = open(_PATH_UTMP, O_RDWR, 0)) < 0)
+		return;
+	while (read(fd, &ut, sizeof(ut)) == sizeof(ut)) {
+		if (!ut.ut_name[0] || strncmp(ut.ut_line, line, UT_LINESIZE))
+			continue;
+		memcpy(&saved_utmp, &ut, sizeof(ut));
+		saved_utmp_ok = 1;
+		memset(ut.ut_name, 0, UT_NAMESIZE);
+		memset(ut.ut_host, 0, UT_HOSTSIZE);
+		(void)time(&ut.ut_time);
+		(void)lseek(fd, -(off_t)sizeof(ut), SEEK_CUR);
+		(void)write(fd, &ut, sizeof(ut));
+	}
+	(void)close(fd);
+}
+
+#endif
