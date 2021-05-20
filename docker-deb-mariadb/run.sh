#!/bin/sh

f="process.txt"
db=`pwd`/mysql

n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`
p=`sudo docker ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`

if [ ! -z "$p" ]; then
	echo Már fut.
else
	# NEM MÚKÖDIK HA EZ IS BENNE VAN!!!! MIÉRT???
	#--mount type=bind,source=$db,target=/var/lib/mysql \
	#			-v "mysqldb:/var/lib/mysql" \
	sudo docker run -p 3307:3306 \
			-v "mysql:/var/lib/mysql" \
			--mount type=bind,source="$(pwd)"/log,target=/var/log/mysql \
			$n &
	sleep 5
	c=`sudo docker ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`
	if [ ! -z "$c" ]; then
		echo $c >$f
	else
		echo Nem indult el.
	fi
fi
