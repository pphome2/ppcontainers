#!/bin/sh

d=`pwd`
cd ..

n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`
pid=`podman images | grep "$n" | awk {'print '}`

if [ ! -z $pid ]; then
	podman rmi $pid
fi

cd $d

#
