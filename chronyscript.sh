#!/bin/bash
IP=$(hostname -i | cut -f2 -d" ")

sed -i "s/REPLACEME/$IP/" /etc/chrony.conf
