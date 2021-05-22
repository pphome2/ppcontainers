use mysql;
grant all privileges on *.* to 'admin'@'192.168.10.%' identified by 'admin' with grant option;
grant all privileges on *.* to 'admin'@'172.16.16.%' identified by 'admin' with grant option;
exit
