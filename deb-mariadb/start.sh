#!/bin/sh
/etc/init.d/mysql start && tail -f /var/log/mysql/error.log

sleep 5

#mysql -e "CREATE DATABASE test  /*\!40100 DEFAULT CHARACTER SET utf8 */;"
#mysql -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';"
#mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';"
#mysql -e "FLUSH PRIVILEGES;"
