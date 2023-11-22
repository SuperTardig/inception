#!bin/bash

while ! mysqladmin -h $SQL_DATABASE -u $SQL_USER -p $SQL_PASSWORD --silent ping; do
	sleep 1
done

if [ ! -e /tmp/done ]
then
	touch /tmp/done
	wp config create --allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=mariadb:3306 \
	--path='var/www/wordpress'

	wp core install --allow-root \
	--url='https://bperron.42.fr' \
	--title=title \
	--admin_user=bperron \
	--admin_password=$SQL_ROOT_PASSWORD \
	--admin_email=$EMAIL \
	--path='var/www/wordpress'

	wp user create --allow-root \
	$SQL_USER $EMAIL \
	--role=author \
	--user_pass=$SQL_PASSWORD \
	--path='/var/www/wordpress'

	if [ ! -e /run/php ]
	then
		mkdir /run/php
	fi
fi

/usr/sbin/php-fpm7.3 -F
