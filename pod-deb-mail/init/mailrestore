#!/bin/bash

d=`pwd`
cd /home

s=$IFS
IFS='-'
for i in backupmail/*.tar.gz; do
	IFS='-'
	read -a n <<< "$i"
	n2=${n[1]}
	IFS='.'
	read -a n <<< "$n2"
	n2=${n[0]}
	IFS=$s
	echo Törlés: $n2 - Visszaállítás: $i
	rm -r $n2 > /dev/null
	tar xfvz $i > /dev/null
done

IFS=$s

cd $d

#
