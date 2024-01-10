#!bin/bash

sleep 30

if [ ! -e /tmp/done ]
then
	touch /tmp/done

  sleep 1
	wp core install --allow-root \
	--url='https://bperron.42.fr' \
	--title=bperron \
	--admin_user=bperron \
	--admin_password=$SQL_ROOT_PASSWORD \
	--admin_email=$EMAIL \
  	--skip-email \
	--path='var/www/wordpress'

  sleep 1
	wp user create --allow-root \
	$SQL_USER $EMAIL2 \
	--role=author \
	--user_pass=$SQL_PASSWORD \
	--path='/var/www/wordpress'

	if [ ! -e /run/php ]
	then
		mkdir /run/php
	fi
fi

exec /usr/sbin/php-fpm7.3  -F