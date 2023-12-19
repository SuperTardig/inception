all: 
	@cd ./srcs && sudo docker compose up --build

fclean:
	@sudo docker system prune -af
	@sudo docker volume prune -f
	@cd data/wordpress && sudo rm -rf *
	@cd data/mariadb && sudo rm -rf *

re:
	@sudo docker system prune -af
	@sudo docker volume prune -f
	@cd data/wordpress && sudo rm -rf *
	@cd data/mariadb && sudo rm -rf *
	@cd ./srcs && sudo docker compose up --build