#!/bin/bash

www="/home/peter/public_html"

f="process.txt"

n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`
p=`sudo podman ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`

if [ ! -z "$p" ]; then
	echo Már fut.
else
	if [ -w $(pwd)/log ]; then
		echo Log ok.
	else
		chmod +w $(pwd)/log
		echo Log ok.
	fi
	sudo podman run --name pod-deb-webphp -p 80:80 -p 443:443 \
			--mount type=bind,source=$www,target=/var/www/html \
			--mount type=bind,source="$(pwd)"/log,target=/var/log/apache2 \
			$n &
	sleep 5
	c=`sudo podman ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`
	if [ ! -z "$c" ]; then
		echo $c >$f
	else
		echo Nem indult el.
	fi
fi
