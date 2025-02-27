# $NetBSD: Makefile,v 1.144 2024/11/16 12:06:07 wiz Exp $

PKGREVISION= 1
.include "Makefile.common"
CATEGORIES=	net

MAINTAINER=	adam@NetBSD.org
COMMENT=	Extensible SNMP implementation

CONFLICTS=	ucd-snmp-[0-9]*
CONFLICTS+=	nocol-[0-9]*	# bin/snmpget bin/snmpwalk

USE_LIBTOOL=		yes
GNU_CONFIGURE=		yes

MAKE_ENV+=	OPSYS=${OPSYS}

CHECK_WRKREF_SKIP+=	bin/net-snmp-config

.include "../../mk/bsd.prefs.mk"

.include "options.mk"

# Don't compress manual pages as they include each other.
.undef MANZ

MAKE_ENV.DragonFly+=	MIB_SYSTEM_LIBS=-lkinfo

.if ${OPSYS} == "NetBSD"
OSVERSION_SPECIFIC=	YES
.  if empty(CFLAGS:U:M*-Dnetbsd1*)
CFLAGS+=		-Dnetbsd1
.  endif
CFLAGS+=		-DSOL_IP=IPPROTO_IP
.endif

LDFLAGS.SunOS+=		-lkvm

.if (${OPSYS} == "NetBSD") || !exists(/usr/bin/lpstat)
CONFIGURE_ENV+=		ac_cv_path_LPSTAT_PATH=no
.endif

NET_SNMP_SYS_CONTACT?=		default_user@contact.domain
NET_SNMP_SYS_LOCATION?=		defaultlocation
NET_SNMP_PERSISTENTDIR?=	${VARBASE}/net-snmp
NET_SNMP_MIBDIRS?=		\$$HOME/.snmp/mibs:${PREFIX}/share/snmp/mibs:${PREFIX}/lib/tcl/tnm2.1.10/mibs:/usr/local/share/snmp/mibs

BUILD_DEFS+=		NET_SNMP_SYS_CONTACT
BUILD_DEFS+=		NET_SNMP_SYS_LOCATION
BUILD_DEFS+=		NET_SNMP_PERSISTENTDIR
BUILD_DEFS+=		NET_SNMP_MIBDIRS

CONFIGURE_ARGS+=	--enable-shared
CONFIGURE_ARGS+=	--with-defaults
CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR}
CONFIGURE_ARGS+=	--with-libwrap=${BUILDLINK_PREFIX.tcp_wrappers}/lib
CONFIGURE_ARGS+=	--with-sys-contact=${NET_SNMP_SYS_CONTACT:Q}
CONFIGURE_ARGS+=	--with-sys-location=${NET_SNMP_SYS_LOCATION:Q}
CONFIGURE_ARGS+=	--with-install-prefix=${DESTDIR}
#
# NOTE:  if you specify a logfile then this file will be written to by
# default and although it can be disabled on the command line, the
# daemon must be stopped to cycle it properly.  Remember rc.d/snmpd
# will use '-s' to enable standard syslog logging anyway.
#
CONFIGURE_ARGS+=	--with-logfile=none
CONFIGURE_ARGS+=	--with-persistent-directory=${NET_SNMP_PERSISTENTDIR}
.if !empty(NET_SNMP_MIBDIRS)
CONFIGURE_ARGS+=	--with-mibdirs=${NET_SNMP_MIBDIRS:Q}
.endif
.if ${OPSYS} == "NetBSD"
CONFIGURE_ARGS+=	--with-mib-modules="smux host ucd-snmp/diskio mibII/kernel_netbsd"
.elif ${OPSYS} == "SunOS"
CONFIGURE_ARGS+=	--with-mib-modules="smux host ucd-snmp/diskio"
.else
CONFIGURE_ARGS+=	--with-mib-modules="smux host"
.endif
.if ${MACHINE_PLATFORM:MDarwin-[567].*}
CONFIGURE_ARGS+=	--with-out-mib-modules="ucd-snmp/diskio mibII"
.endif
.if ${MACHINE_PLATFORM:MDarwin-9.*}
CONFIGURE_ARGS+=	--with-mib-modules="host ucd-snmp/diskio"
CONFIGURE_ARGS+=	--with-out-mib-modules="mibII/icmp host/hr_swrun"
CONFIGURE_ARGS+=	--enable-as-needed
CONFIGURE_ARGS+=	--without-kmem-usage
CONFIGURE_ARGS+=	--without-rpm
.endif
#
# Using "dummy" values is technically not compliant with SNMP specs, but
# otherwise, some tools, e.g. net/tcl-scotty, net/tkined, may ignore results
# when they shouldn't.
#
CONFIGURE_ARGS+=	--with-dummy-values
#
# Install the UCD-SNMP look-alike headers and libraries to ease porting of
# older software to use net-snmp.
#
CONFIGURE_ARGS+=	--enable-ucd-snmp-compatibility

# Handle ${PREFIX}/share/snmp in the DEINSTALL script since it may contain
# leftover config files or pidfiles after deinstallation.
#
REQD_DIRS=	${PREFIX}/share/snmp
RCD_SCRIPTS=	snmpd snmptrapd
SMF_NAME=	snmp
SMF_INSTANCES=	default snmptrapd

USE_TOOLS+=		sh:run

INSTALLATION_DIRS+=	share/examples/net-snmp

BUILD_DEFS+=	VARBASE

post-extract:
.if ${OPSYS} == "DragonFly"
	${CP} ${FILESDIR}/cpu_dragonfly.c ${WRKSRC}/agent/mibgroup/hardware/cpu/cpu_nlist.c
.endif

post-install:
	${INSTALL_DATA} ${WRKSRC}/EXAMPLE.conf	\
		${DESTDIR}${PREFIX}/share/examples/net-snmp/EXAMPLE.conf
	${INSTALL_DATA} ${WRKSRC}/agent/snmp_perl.pl \
		${DESTDIR}${PREFIX}/share/snmp/

.include "../../mk/curses.buildlink3.mk"
.include "../../devel/pcre/buildlink3.mk"
.include "../../net/libpcap/buildlink3.mk"
.include "../../security/tcp_wrappers/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
