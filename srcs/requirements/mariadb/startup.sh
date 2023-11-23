#!bin/bash

service mysql start

sleep 1
while true; do
	if mysqladmin ping -h localhost -u root -p${SQL_ROOT_PASSWORD} --silent; then
		break;
	fi
	sleep 1
done

sleep 1
mysql -u root -p${SQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
sleep 1
mysql -u root -p${SQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
sleep 1
mysql -u root -p${SQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
sleep 1
mysql -u root -p${SQL_ROOT_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
sleep 1
mysql -u root -p${SQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
sleep 1
mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown
sleep 1
exec mysqld_safe
