#!/bin/sh

n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`
p=`sudo podman ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`

if [ ! -z "$p" ]; then
	echo $p
	sudo podman cp $p:/var/log/mysql/error.log .

else
	echo Nem fut.
fi

#
