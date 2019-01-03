#!/bin/bash
#Script to set up the LFCSA Exam SERVER

/bin/hostnamectl set-hostname server
/sbin/setenforce 0
/bin/yum install httpd bind bind-utils nfs-utils docker git firewalld samba -y
/bin/systemctl start firewalld
/bin/nohup /bin/sha1sum /dev/zero > /dev/null &
/bin/echo 'logger This is my cron job.' > /tmp/cronscript.sh && /bin/chmod +x /tmp/cronscript.sh
/usr/sbin/modprobe dummy
/usr/sbin/ip link set name eth10 dev dummy0
/bin/git clone https://github.com/linuxacademy/content-lfcsa-exam.git /tmp/exam
/bin/cp /tmp/exam/chrony.conf /etc/chrony.conf
/bin/firewall-cmd --add-service={ntp,nfs,mountd,rpc-bind}
/bin/systemctl restart chronyd
/bin/cp /tmp/exam/httpd.broke /etc/httpd/conf/httpd.conf
/sbin/useradd bwayne
/sbin/useradd ckent
/sbin/useradd ballen
/sbin/groupadd jleague
/bin/cat /tmp/exam/named.conf >> /etc/named.conf
/bin/cp /tmp/exam/example.zone /var/named/
/bin/systemctl start named
/usr/bin/mkdir /nfsshare
/bin/echo '/nfsshare *(rw,sync,no_root_squash)' > /etc/exports
/sbin/exportfs -a
/bin/systemctl start nfs
/bin/systemctl start docker
/bin/docker run hello-world
/bin/echo 'UUD=45d18fda-d2da-4c79-a3d8-6566bacd7329 /opt loopback default 0 0' >> /etc/fstab
/bin/mkdir /quota
/bin/chmod 777 /quota
/bin/systemctl start smb
/bin/systemctl enable {nfs,docker,named,smb}
IP=$(hostname -i | cut -f4 -d" ")
echo $IP >> /tmp/LAsetupLog
sed -i "s/REPLACEME/$IP/" /etc/chrony.conf
/bin/systemctl restart chronyd
cp /tmp/exam/myscript.sh /root

