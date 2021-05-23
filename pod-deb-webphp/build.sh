#!/bin/sh

n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`
sudo podman build -t $n .
