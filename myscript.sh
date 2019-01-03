#!/bin/bash

useradd pirate
for i in {1..10}; do mkdir /opt/movie$i; touch /opt/movie$i/$i.mp4; chown -R pirate.pirate /opt/*; touch /opt/movie1/validmovie.mp4; chown cloud_user.cloud_user /opt/movie1/validmovie.mp4; done' > /root/myscript.sh
