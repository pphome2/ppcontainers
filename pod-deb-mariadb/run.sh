#!/bin/sh

f="process.txt"
db=`pwd`/db

n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`
p=`sudo podman ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`

if [ ! -z "$p" ]; then
	echo Már fut.
else
	if [ -d $db ]; then
		rm -r $db/*
		echo DB ok.
	else
		mkdir $db
		chmod 777 $db
		echo DB ok.
	fi
	if [ -d /var/lib/mysql ]; then
		echo DB2 ok.
	else
		ln -s $db /var/lib/mysql
		echo DB2 ok.
	fi
	if [ -d $(pwd)/log ]; then
		rm -r $(pwd)/log/* > /dev/null
		echo Log ok.
	else
		mkdir $(pwd)/log
		chmod 777 $(pwd)/log
		echo Log ok.
	fi
	if [ -d /var/log/mysql ]; then
		rm /var/log/mysql/* 2> /dev/null
		rmdir /var/log/mysql 2> /dev/null
		echo Log2 ok.
	fi
	ln -s $(pwd)/log /var/log/mysql
	sudo podman run --name "$n" -p 3306:3306 \
			--mount type=bind,source=$(pwd)/log,target=/var/log/mysql \
			--mount type=bind,source=$(pwd)/db,target=/var/lib/mysql \
			$n &
	sleep 5
	podman exec "$n" /usr/local/bin/sqlinit.sh
	c=`sudo podman ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`
	if [ ! -z "$c" ]; then
		echo $c >$f
		echo Fut.
	else
		echo Nem indult el.
	fi
fi

#
