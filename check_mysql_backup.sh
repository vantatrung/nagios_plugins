#! /bin/bash
#
# Author : Diego Martin Gardella [dgardella@gmail.com]
# Modified by Erling Ouweneel to switch OK and CRITICAL
#
# Desc : Plugin to verify if a file does not exist
#
#

PROGNAME=`basename $0`
PROGPATH=`echo $0 | sed -e 's,[\\/][^\\/][^\\/]*$,,'`
# if [ "$1" = "" ]
# then
# echo -e " Use : $PROGNAME -- Ex : $PROGNAME /etc/hosts \n "
# exit $STATE_UNKNOWN
# fi
#. $PROGPATH/utils.sh

DATE=`date --date="4 hours ago" +%d%m%Y`
DATE2=`date --date="4 hours ago" +%d-%m-%Y`
BAKFILE=/backup/mysql/mysql_$DATE.sql.gz

. /usr/lib64/nagios/plugins/utils.sh

if [ -f $BAKFILE ]
then
echo -e "OK : MySQL backup for $DATE2 exists :: `ls -oh $BAKFILE`"
exit $STATE_OK
else
echo "CRITICAL : MySQL backup for $DATE2 does NOT exists "
exit $STATE_CRITICAL
fi
