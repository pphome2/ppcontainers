#!/bin/bash

d=`pwd`
cd /var/lib/mysql

s=$IFS

for i in *.sql; do
	IFS='-'
	read -a n <<< "$i"
	n2=${n[2]}
	IFS='.'
	read -a n <<< "$n2"
	n2=${n[0]}
	#echo $n2
	if [ ! -z $n2 ]; then
		if [ -d $n2 ]; then
			echo Adatbázis: $n2
			mariadb -e "drop database $n2;"
			mariadb -e "create database $n2;"
		else
			echo Adatbázis: $n2
			mariadb -e "create database $n2;"
		fi
		echo Adatok: $n2 - $i
		mariadb $n2 < "$i"
	fi
done

IFS=$s

cd $d

#
