#!/bin/sh

/etc/init.d/mysql start && tail -f /var/log/lastlog
sleep 5
