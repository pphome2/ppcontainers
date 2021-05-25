#!/bin/sh

n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`
p=`pwd`

podman exec "$n" /usr/local/bin/restart.sh
echo Szolgáltatás újraindítása ok.

#

