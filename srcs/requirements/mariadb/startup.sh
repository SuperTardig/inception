#!bin/bash

service mysql start;

mysql -e "CREATE DATABASE IF NOT EXISTS \'${SQL_DATABASE}\';"
mysql -e "CREATE USER IF NOT EXISTS \'${SQL_USER}\'@\'localhost\' IDENTIFIED BY \'${SQL_PASSWORD}\';"
mysql -e "ALTER USER \'root\'@\'localhost\' IDENTIFIED BY  \'${SQL_ROOT_PASSWORD}\';"
mysql -e "FLUSH PRIVILEDGES;"
mysqladmin -u root -p$SQL_ROOT_PASSSWORD shutdown
exec mysqld
