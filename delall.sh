#!/bin/sh

n=`sudo docker images | grep "<none>" | awk 'BEGIN {FS=" "};{print $3}'`

for j in $n; do
	sudo docker rmi -f $j
done