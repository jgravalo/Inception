all:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

ls:
	@docker ps
	@echo
	@docker images
	@echo
	@docker volume ls
	@echo
	@docker network ls

clean:
	@#rm -rf /home/jgravalo/data/mysql/* #borra archivos de mysql
	@#rm -rf /home/jgravalo/data/wordpress/* #borra archivos de wordpress
	@docker stop $$(docker ps -qa) #??
	@echo ----------------------
	@docker rm $$(docker ps -qa) #borra contenedor
	@docker rmi -f $$(docker images -qa) #borra imagen
	@docker volume rm $$(docker volume ls -q) #borra volumen
	@docker network rm jgravalo-dockernet #borra red

re:
	make clean
	make all

.PHONY: all down clean
