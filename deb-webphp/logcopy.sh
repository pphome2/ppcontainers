#!/bin/sh

n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`
p=`sudo docker ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`

sudo docker cp $p:/var/log/apache2/access.log .
sudo docker cp $p:/var/log/apache2/error.log .
