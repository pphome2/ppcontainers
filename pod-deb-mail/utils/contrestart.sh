#!/bin/sh

d=`pwd`
cd ..

n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`
p=`sudo podman ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`


c=`sudo podman ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`
if [ ! -z "$c" ]; then
	podman stop "$n"
	podman start "$n"
	echo Újraindítva.
else
	podman start "$n"
	echo Elindut.
fi
c=`sudo podman ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`
if [ ! -z "$c" ]; then
	echo $c >process.txt
fi

cd $d

#
