#!/bin/bash


f="process.txt"

n=`pwd | awk 'BEGIN {FS="/"};{printf $NF }'`
p=`sudo podman ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`

if [ ! -z "$p" ]; then
	echo Már fut.
else
	if [ -d $(pwd)/log ]; then
		rm $(pwd)/log/*
		echo Log ok.
	else
		mkdir $(pwd)/log
		chmod 777 $(pwd)/log
		echo Log ok.
	fi
	if [ -d $(pwd)/postfix ]; then
		echo Postfix ok.
	else
		mkdir $(pwd)/postfix
		chmod 777 $(pwd)/postfix
		echo Postfix ok.
	fi
	if [ -d $(pwd)/dovecot ]; then
		echo Dovecot ok.
	else
		mkdir $(pwd)/dovecot
		chmod 777 $(pwd)/dovecot
		echo Dovecot ok.
	fi
	if [ -d $(pwd)/clamav ]; then
		echo Clamav ok.
	else
		mkdir $(pwd)/clamav
		chmod 777 $(pwd)/clamav
		echo Clamav ok.
	fi
	if [ -d $(pwd)/spamassassin ]; then
		echo Spamassassin ok.
	else
		mkdir $(pwd)/spamassassin
		chmod 777 $(pwd)/spamassassin
		echo Spamassassin ok.
	fi
	if [ -d $(pwd)/backupmail ]; then
		echo Backupmail ok.
	else
		mkdir $(pwd)/backupmail
		chmod 777 $(pwd)/backupmail
		echo Backupmail ok.
	fi

	sudo podman run --name "$n" \
			-p 25:25 -p 587:587 -p 465:465  \
			-p 143:143 -p 993:993 \
			--mount type=bind,source=$(pwd)/dovecot,target=/etc/dovecot \
			--mount type=bind,source=$(pwd)/postfix,target=/etc/postfix \
			--mount type=bind,source=$(pwd)/clamav,target=/etc/clamav \
			--mount type=bind,source=$(pwd)/spamassassin,target=/etc/spamassassin \
			--mount type=bind,source=$(pwd)/backupmail,target=/home/backupmail \
			--mount type=bind,source=$(pwd)/log,target=/var/log \
			--entrypoint="/usr/local/bin/start.sh" \
			$n &

	sleep 5
	c=`sudo podman ps | grep "$n" | awk 'BEGIN {FS=" "};{print $1}'`
	if [ ! -z "$c" ]; then
		echo $c >$f
	else
		echo Nem indult el.
	fi
fi

#
