#!/bin/bash
IP=$(hostname -i | cut -f3 -d" ")

sed -i "s/REPLACEME/$IP/" /etc/chrony.conf
