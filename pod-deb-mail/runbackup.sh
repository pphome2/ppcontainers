#!/bin/sh

n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`
p=`pwd`

if [ -d $(pwd)/backup ]; then
	echo Backup ok.
else
	mkdir $(pwd)/backup
	chmod 777 $(pwd)/backup
	echo Backup ok.
fi

podman exec "$n" /usr/local/bin/sqlbackup.sh
echo SQL backup ok.

d=`date +"%y%m%d"`
#echo $d

b=$(pwd)/backup
cd $(pwd)/db
for i in *.sql; do
	mv $i $b/$d-$i
	echo $d-$i
done

cd $p

#

