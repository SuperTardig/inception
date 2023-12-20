all: create_folder build

build:
	sudo docker compose -f ./srcs/docker-compose.yml up -d --build

up:
	sudo docker compose -f ./srcs/docker-compose.yml up -d

down:
	sudo docker compose -f ./srcs/docker-compose.yml down

create_folder:
	if [ ! -d "../data/" ]; then mkdir -p ../data/; fi
	if [ ! -d "../data/mariadb/" ]; then mkdir -p ../data/mariadb/; fi
	if [ ! -d "../data/wordpress/" ]; then mkdir -p ../data/wordpress/; fi

fclean: down
	sudo docker system prune -af
	sudo docker volume prune -f
	sudo docker volume rm srcs_voluem-mariadb
	sudo docker volume rm srcs_voluem-wordpress
	cd ../data/wordpress && sudo rm -rf *
	cd ../data/mariadb && sudo rm -rf *

re: fclean create_folder up

logs:
	sudo docker compose logs

.SILENT: all create_folder fclean re up down build

.PHONY: all create_folder fclean re up down build