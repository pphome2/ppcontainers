#!/bin/sh

service spamassassin restart
service clamd restart
service postfix restart
service dovecot restart

#
