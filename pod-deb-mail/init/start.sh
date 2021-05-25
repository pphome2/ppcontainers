#!/bin/sh

if [ ! -f /etc/postfix/main.cf ]; then
	cp -r /home/backupetc/etc/postfix/* /etc/postfix
fi
if [ ! -f /etc/dovecot/dovecot.conf ]; then
	cp -r /home/backupetc/etc/dovecot/* /etc/dovecot
fi
if [ ! -f /etc/spamassassin/local.cf ]; then
	cp -r /home/backupetc/etc/spamassassin/* /etc/spamassassin
fi
if [ ! -f /etc/clamav/clamd.conf ]; then
	cp -r /home/backupetc/etc/clamav/* /etc/clamav
fi

service rsyslog start
service postfix start
service dovecot start 

touch /var/log/lastlog
tail -f /var/log/lastlog

#
