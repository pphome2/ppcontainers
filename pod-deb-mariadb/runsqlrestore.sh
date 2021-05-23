#!/bin/sh

n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`
p=`pwd`

podman exec "$n" /usr/local/bin/sqlrestore.sh
echo SQL restore ok.

#

