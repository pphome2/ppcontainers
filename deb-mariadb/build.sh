#!/bin/sh

n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`
sudo docker build -t $n .
