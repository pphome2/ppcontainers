#!/bin/bash

#cd /var/lib/mysql

s=$IFS

for i in *.sql; do
	IFS='-'
	read -a n <<< "$i"
	n2=${n[1]}
	IFS='.'
	read -a n <<< "$n2"
	n2=${n[0]}
	if [ ! -z $n2 ]; then
		if [ -d $n2 ]; then
			echo $n2
			mariadb "delete database $n2;create database $n2;exit"
		else
			echo $n2
			mariadb "create database $n2;exit"
		fi
		#maridb $n2 < $i
	fi
done

IFS=$s

#

