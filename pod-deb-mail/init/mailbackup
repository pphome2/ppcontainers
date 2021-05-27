#!/bin/bash

d=`pwd`

cd /home

td=`date +"%y%m%d"`

for x in *; do
	if [ -d $x ]; then
		if [ $x != "backupmail" ] && [ $x != "backupetc" ]; then
			echo $x
			tar cvvfz /home/backupmail/$td-$x.tar.gz $x >/dev/null
			#tar cvvfz /home/backupmail/$x.tar.gz $x >/dev/null
		fi
	fi
done

cd $d

#

