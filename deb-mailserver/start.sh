#!/bin/sh

rm /etc/clamsmtpd.conf
ln -s /etc/conf/clamsmtpd.conf /etc/clamsmtpd.conf
rm /etc/aliases
ln -s /etc/conf/aliases /etc/aliases

service postfix start
service dovecot start
tail -f /var/log/lastlog
