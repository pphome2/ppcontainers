#!/bin/sh

n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`
p=`pwd`

podman exec "$n" /usr/local/bin/servstart.sh
echo Szolgáltatás újraindítása: ok.

#

