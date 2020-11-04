#!/bin/sh

n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`

#sudo docker run -p 3306:3306 -v "/var/lib/mysql:/var/lib/mysql" $n &
sudo docker run -p 3307:3306 -v "mysql:/var/lib/mysql" $n &
sleep 5

sudo docker ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}' >process.txt
