#!/bin/sh

#mysqld --initialize
if [ ! -d /var/lib=mysql/mysql ]; then
	mysql_install_db
fi

/etc/init.d/mysql start && tail -f /var/log/lastlog

#
