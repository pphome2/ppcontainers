#!/bin/bash

#www="/home/peter/public_html"
www=$(pwd)/www

f="process.txt"

n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`
p=`sudo podman ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`

if [ ! -z "$p" ]; then
	echo Már fut.
else
	if [ -d $(pwd)/log ]; then
		rm $(pwd)/log/*
		echo Log ok.
	else
		mkdir $(pwd)/log
		chmod 777 $(pwd)/log
		echo Log ok.
	fi
	if [ -d /var/log/apache2 ]; then
		echo Log2 ok.
	else
		ln -s $(pwd)/log /var/log/apache2
		#chmod +w $(pwd)/log
		echo Log2 ok.
	fi
	if [ -d $www ]; then
		echo WWW ok.
	else
		mkdir $www
		chmod 777 $www
		echo WWW ok.
	fi
	if [ -d /var/www ]; then
		echo WWW2 ok.
	else
		ln -s $www /var/www
		echo WWW2 ok.
	fi
	sudo podman run --name "$n" -p 80:80 -p 443:443 \
			--mount type=bind,source=$www,target=/var/www/html \
			--mount type=bind,source=$(pwd)/log,target=/var/log/apache2 \
			$n &
	sleep 5
	c=`sudo podman ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`
	if [ ! -z "$c" ]; then
		echo $c >$f
	else
		echo Nem indult el.
	fi
fi

#
