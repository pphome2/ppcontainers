#!/bin/sh

f="process.txt"

n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`
p=`sudo docker ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`

if [ ! -z "$p" ]; then
	echo Már fut.
else
	sudo docker run -p 8080:80 -p 4433:443 -v "/home/peter/public_html:/var/www/html" $n &
	sleep 5
	c=`sudo docker ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`
	if [ ! -z "$c" ]; then
		echo $c >$f
	else
		echo Nem indult el.
	fi
fi
