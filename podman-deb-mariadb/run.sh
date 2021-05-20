#!/bin/sh

f="process.txt"
db=`pwd`/mysql

n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`
p=`sudo podman ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`

if [ ! -z "$p" ]; then
	echo Már fut.
else
	# NEM MÚKÖDIK HA EZ IS BENNE VAN!!!! MIÉRT???
	#--mount type=bind,source=$db,target=/var/lib/mysql \
	#			-v "mysqldb:/var/lib/mysql" \
	if [ -d /var/lib/mysql ]; then
		echo Link ok.
	else
		ln -s /var/lib/containers/storage/volumes/mysql /var/lib/mysql
		echo Link ok.
	fi
	if [ -w $(pwd)/log ]; then
		echo Log ok.
	else
		chmod +w $(pwd)/log
		echo Log ok.
	fi
	sudo podman run --name pod-deb-mariadb -p 3306:3306 \
			--mount type=bind,source="$(pwd)"/log,target=/var/log/mysql \
			$n &
			#-v "mysql:/var/lib/mysql" \
	sleep 5
	c=`sudo podman ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`
	if [ ! -z "$c" ]; then
		echo $c >$f
		echo Fut.
	else
		echo Nem indult el.
	fi
fi
