#!/bin/sh

cd /var/lib/mysql

for x in *; do
	if [ -d $x ]; then
		y="${x##*/}"
		if [ $y != "performance_schema" ]; then
			mysqldump $y >sqldb-$y.sql
		fi
	fi
done

#

