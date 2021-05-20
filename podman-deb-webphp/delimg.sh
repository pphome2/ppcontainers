#!/bin/sh

pid=`podman images | grep webphp | awk {'print '}`

if [ ! -z $pid ]; then
	podman rmi $pid
fi

