#!/bin/sh

f=process.txt
if test -f "$f"; then
	if [ -s file.name ] ; then
		n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`
		p=`sudo docker ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`
		echo $p
		sudo docker kill $p
	else
		p=`cat $f`
		sudo docker kill $p
		rm $f
	fi
else
	n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`
	p=`sudo docker ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`
	sudo docker kill $p
fi
