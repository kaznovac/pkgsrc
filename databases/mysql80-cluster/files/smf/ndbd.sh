#!@RCD_SCRIPTS_SHELL@
#
# $NetBSD: ndbd.sh,v 1.1 2024/08/05 01:23:59 jnemeth Exp $
#

CONSTRING=$(svcprop -p ndbd/ndb_connectstring $SMF_FMRI 2>/dev/null)

case "$1" in
start)
	if [[ "${CONSTRING}" != "none" ]] && [[ "${CONSTRING}" != \"\" ]]; then
		@LOCALBASE@/sbin/ndbd --ndb-connectstring=${CONSTRING} -d 
	else
		@LOCALBASE@/sbin/ndbd -d 
	fi
	;;
*)
	echo "Usage: $0 { start }"
	exit 2
	;;
esac
