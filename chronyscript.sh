#!/bin/bash
IP=$(hostname -i | cut -f2 -d" ")
echo $IP > /tmp/LAsetupLog
sed -i "s/REPLACEME/$IP/" /etc/chrony.conf
