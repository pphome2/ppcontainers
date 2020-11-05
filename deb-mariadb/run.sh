#!/bin/sh

f="process.txt"
d=`pwd`
n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`
p=`sudo docker ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`

if [ ! -z "$p" ]; then
	echo Már fut.
else
	#sudo docker run -p 3306:3306 -v "/var/lib/mysql:/var/lib/mysql" $n &
	sudo docker run -p 3307:3306 -v "mysql:/var/lib/mysql" $n &
	sleep 5
	c=`sudo docker ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`
	if [ ! -z "$c" ]; then
		echo $c >$f
	else
		echo Nem indult el.
	fi
fi
