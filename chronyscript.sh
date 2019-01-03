#!/bin/bash
IP=$(hostname -i | cut -f4 -d" ")

sed -i "s/REPLACEME/$IP/" /etc/chrony.conf
