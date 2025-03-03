#!@RCD_SCRIPTS_SHELL@
#

# PROVIDE: REDLIB 
# REQUIRE: DAEMON
# KEYWORD: shutdown

$_rc_subr_loaded . @SYSCONFBASE@/rc.subr
. @PKG_SYSCONFDIR@/redlib.conf

name="redlib"
rcvar=${name}
command="@PREFIX@/bin/${name}"
command_args="-a ${ADDRESS} -p ${PORT}"
pidfile="@VARBASE@/run/${name}.pid"
logfile="@VARBASE@/log/${name}.log"
required_files="@PKG_SYSCONFDIR@/redlib.conf"

start_cmd="@PREFIX@/sbin/daemonize -p ${pidfile} -e ${logfile} $command $command_args"

load_rc_config $name
run_rc_command "$1"
