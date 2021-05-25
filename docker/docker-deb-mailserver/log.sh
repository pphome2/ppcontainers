#!/bin/sh

n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`
p=`sudo docker ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`

if [ ! -z "$p" ]; then
	echo $p
	sudo docker logs $p
else
	echo Nem fut.
fi

