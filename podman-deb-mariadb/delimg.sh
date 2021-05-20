#!/bin/sh

pid=`podman images | grep mariadb | awk {'print '}`

if [ ! -z $pid ]; then
	podman rmi $pid
fi

