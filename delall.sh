#!/bin/sh

n=`sudo podman images | grep "<none>" | awk 'BEGIN {FS=" "};{print $3}'`

for j in $n; do
	sudo podman rmi -f $j
done