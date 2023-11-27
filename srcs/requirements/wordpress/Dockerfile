#FROM debian:buster

#RUN apt-get update -y && apt-get upgrade -y
#RUN apt-get install wget php7.3 php-fpm php-mysql mariadb-client -y
#RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && cd /var/www && tar -xvf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz && chown -R root:root /var/www/wordpress
#RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

#COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www,conf
#COPY conf/wp-config.php /var/www/wordpress
#COPY conf/config.sh /

#ENTRYPOINT [ "sh", "/config.sh" ]
FROM alpine:3.17

# Install php
RUN apk --no-cache update && \
    apk --no-cache add php81 php81-fpm php81-mysqli php81-pdo php81-pdo_mysql php81-phar php-mbstring mariadb-client && \
	apk --no-cache add wget

# Copy php-fpm config
ADD ./conf/www.conf /etc/php81/php-fpm.d/www.conf

# Install wp-cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# RUN mkdir -p /var/www/html

# ADD tools/index.php /var/www/html/index.php

# COPY tools/script.sh /script.sh
COPY conf/config.sh /
RUN chmod +x /config.sh

WORKDIR /var/www

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P .
RUN tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

WORKDIR /var/www/wordpress
# ADD conf/wp-config.php /var/www/wordpress/wp-config.php

EXPOSE 9000

ENTRYPOINT ["sh", "/config.sh"]

# CMD ["php-fpm81", "--nodaemonize"]
