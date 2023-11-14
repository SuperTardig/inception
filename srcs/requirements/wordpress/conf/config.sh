#!bin/bash

sleep 10

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
	--title=$title \
	--admin_user=$SQL_USER \
	--admin_password=$SQL_PASSWORD \
	--admin_email=$EMAIL \
	--path='var/www/wordpress'

	wp user create --allow-root \
	$USER $USER_EMAIL \
	--role=author \
	--user_pass=$USER_PASS \
	--path='/var/www/wordpress'

	if [! -e /run/php]
	then
		mkdir /run/php
	fi
fi

/usr/sbin/php-fpm7.3 -F
