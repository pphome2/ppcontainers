#!/bin/sh

f="process.txt"

n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`
p=`sudo docker ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`

if [ ! -z "$p" ]; then
	echo Már fut.
else
	#	sudo docker run -p 25:25 -p 143:143 \
	#			-v "postfix:/etc/postfix" \
	#			-v "dovecot:/etc/dovecot" \
	#			-v "clamav:/etc/clamav" \
	#			-v "spamassassin:/etc/spamassassin" \
	#			-v "home:/home" \
	#			-v "conf:/etc/conf" \
	#			$n &
	sudo docker run -p 143:143 -p 25:25  \
			--mount type=bind,source="$(pwd)"/dovecot,target=/etc/dovecot \
			--mount type=bind,source="$(pwd)"/postfix,target=/etc/postfix \
			--mount type=bind,source="$(pwd)"/clamav,target=/etc/clamav \
			--mount type=bind,source="$(pwd)"/spamassassin,target=/etc/spamassassin \
			--mount type=bind,source="$(pwd)"/home,target=/home \
			--mount type=bind,source="$(pwd)"/conf,target=/etc/conf \
			$n &
	sleep 5
	c=`sudo docker ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`
	if [ ! -z "$c" ]; then
		echo $c >$f
	else
		echo Nem indult el.
	fi
fi
