#!/bin/bash
#
# Vikram Shekhar - Sample Script
#
WEB_ACCESS_LOG=/var/log/apache2/access.log

# List top-5 IP addresses
TOP5_IPLIST=`tail 100 $WEB_ACCESS_LOG | awk '{print $1}' | sort | uniq | head -5`

# List 4xx of last 10days
LAST10DAY_LOG=`awk -vDate=`date -d'now-10 days' +[%d/%b/%Y:%H:%M:%S` '$4 > Date {print Date, $0}' $WEB_ACCESS_LOG`

SORT_IPADDR=`awk '{print $1}' | sort | uniq | head -5 $LAST10DAY_LOG`

# Script to view top 10 disk users
HOST_LIST=""
HOME_PATH=/home
for host in $HOST_LIST
do
  echo "Top 10 disk Users on host: $host"
  ssh -i access.pem vikrams@${host} <<'ENDSSH
 'du -s $HOME_PATH/* | sort -rn | head -10'
ENDSSH
done
