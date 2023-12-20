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
	cd data/wordpress && sudo rm -rf *
	cd data/mariadb && sudo rm -rf *

re: fclean create_folder up

.SILENT: all create_folder fclean re up down

.PHONY: all create_folder fclean re up down