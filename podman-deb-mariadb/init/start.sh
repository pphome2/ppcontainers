#!/bin/sh

#mysqld --initialize
mysql_install_db

/etc/init.d/mysql start && tail -f /var/log/lastlog
sleep 5

#
