FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install wget php7.3 php-fpm php-mysql mariadb-client -y
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && cd /var/www && tar -xvf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz && chown -R root:root /var/www/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY conf/wp-config.php /var/www/wordpress
COPY conf/config.sh /

EXPOSE 9000

ENTRYPOINT [ "sh", "/config.sh" ]

