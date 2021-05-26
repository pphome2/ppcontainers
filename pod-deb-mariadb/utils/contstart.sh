#!/bin/sh

d=`pwd`
cd ..

n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`
p=`sudo podman ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`


c=`sudo podman ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`
if [ ! -z "$c" ]; then
	echo Már fut.
else
	podman start "$n"
	echo Elindut.
	c=`sudo podman ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`
	if [ ! -z "$c" ]; then
		echo $c >process.txt
	fi
fi

cd $d

#
