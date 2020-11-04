#!/bin/sh

n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`

sudo docker run -p 8080:80 -p 4433:443 -v "/home/peter/public_html:/var/www/html" $n &
sleep 5

sudo docker ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}' >process.txt
