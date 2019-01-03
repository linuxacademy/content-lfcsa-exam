#!/bin/bash
#Script to set up the LFCSA Exam SERVER

/bin/yum install httpd bind bind-utils nfs-utils docker git -y
/bin/hostnamectl set-hostname server
/bin/echo 'useradd pirate && for i in {1..10}; do mkdir /opt/movie$i; touch /opt/movie$i/$i.mp4; chown -R pirate.pirate /opt/*; touch /opt/movie1/validmovie.mp4; chown cloud_user.cloud_user /opt/movie1/validmovie.mp4; done' > /root/myscript.sh
/bin/nohup /bin/sha1sum /dev/zero > /dev/null &
/bin/echo 'logger This is my cron job.' > /tmp/cronscript.sh && /bin/chmod +x /tmp/cronscript.sh
/usr/sbin/modprobe dummy
/usr/sbin/ip link set name eth10 dev dummy0
/bin/git clone https://github.com/linuxacademy/content-lfcsa-exam.git /tmp/exam
/bin/cp /tmp/exam/chrony.conf /etc/chrony.conf
/bin/chmod +x /tmp/exam/chronyscript.sh && /tmp/exam/chronyscript.sh
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
/bin/mkdir /nfsshare
/bin/echo '/nfsshare *(rw,sync,no_root_squash)' > /etc/exports
/sbin/exportfs -a
/bin/systemctl start nfs
/bin/systemctl start docker
/bin/docker run hello-world
/bin/echo 'UUD=45d18fda-d2da-4c79-a3d8-6566bacd7329 /opt loopback default 0 0' >> /etc/fstab
/bin/mkdir /quota
/bin/chmod 777 /quota
/bin/systemctl enable {nfs,docker,named}
