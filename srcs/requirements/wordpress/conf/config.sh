#!bin/bash

#echo -e "starting script"

#sleep 1
#while ! mysqladmin ping -h"$SQL_DATABASE" -u"$SQL_USER" -p"$SQL_PASSWORD" --silent; do
#	echo -e "waiting for mariadb"
#	sleep 1
#done
#echo -e "wait is done"


#if [ ! -e /tmp/done ]
#then
#	touch /tmp/done
#	wp config create --allow-root \
#	--dbname=$SQL_DATABASE \
#	--dbuser=$SQL_USER \
#	--dbpass=$SQL_PASSWORD \
#	--dbhost=mariadb:3306 \
#	--path='var/www/wordpress'
#
#	wp core install --allow-root \
#	--url='https://bperron.42.fr' \
#	--title=title \
#	--admin_user=bperron \
#	--admin_password=$SQL_ROOT_PASSWORD \
#	--admin_email=$EMAIL \
#	--path='var/www/wordpress'
#
#	wp user create --allow-root \
#	$SQL_USER $EMAIL \
#	--role=author \
#	--user_pass=$SQL_PASSWORD \
#	--path='/var/www/wordpress'
#
#	if [ ! -e /run/php ]
#	then
#		mkdir /run/php
#	fi
#	echo allo
#fi
#echo fankj
#/usr/sbin/php-fpm7.3 -F



#!/bin/sh

# Fonction pour afficher un message en vert
log_success() {
  echo -e "\033[32m[ENTRY SCRIPT] $1\033[0m"  # Vert
}

# Fonction pour afficher un message en jaune
log_wait() {
  echo -e "\033[33m[ENTRY SCRIPT] $1\033[0m"  # Jaune
}

# Fonction pour afficher un message en bleu
log_info() {
  echo -e "\033[34m[ENTRY SCRIPT] $1\033[0m"  # Bleu
}

# Attendre que MariaDB soit en cours d'exécution
sleep 1
log_info "Attente du démarrage de MariaDB..."
while ! mysqladmin ping -h"mariadb" -u"$SQL_USER" -p"$SQL_PASSWORD" --silent; do
  log_info "En attente du démarrage de MariaDB..."
  sleep 1
done
log_success "MariaDB est en cours d'exécution."

# Attendre que la base de données soit créée
sleep 1
log_info "Attente de la création de la base de données WordPress..."
while ! mysql -h"mariadb" -u"$SQL_USER" -p"$SQL_PASSWORD" -e "USE $SQL_DATABASE" 2>/dev/null; do
  log_info "En attente de la création de la base de données WordPress..."
  sleep 1
done
log_success "Base de données WordPress créée avec succès."

# Créer la configuration WordPress
sleep 1
log_success "Création de la configuration WordPress..."
wp config create --dbname="$SQL_DATABASE" --dbuser="$SQL_USER" --dbpass="$SQL_PASSWORD" --dbhost="mariadb" --locale="ca_FR" --path="/var/www/wordpress"
log_success "Configuration WordPress créée avec succès."

# Installer WordPress
sleep 1
log_success "Installation de WordPress..."
wp core install --allow-root --url='https://bperron.42.fr' --title=title --admin_user=bperron --admin_password=$SQL_ROOT_PASSWORD	--admin_email=$EMAIL --path='var/www/wordpress'
log_success "WordPress installé avec succès."

# Créer un utilisateur WordPress
sleep 1
log_success "Création de l'utilisateur WordPress..."
wp user create --allow-root "$SQL_USER" "$EMAIL" --role=author --user_pass=$SQL_PASSWORD --path='/var/www/wordpress'
log_success "Utilisateur WordPress créé avec succès."

# Démarrer PHP-FPM
sleep 1
log_info "Démarrage de PHP-FPM..."
php-fpm81 --nodaemonize
log_success "PHP-FPM est démarré avec succès."
