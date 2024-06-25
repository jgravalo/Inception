all:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

ls:
	@echo containers:
	@docker ps -a
	@echo
	@echo images:
	@docker images -a
	@echo
	@echo volumes:
	@docker volume ls 
	@echo
	@echo networks:
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
	@#docker network rm $$(docker network ls -q | grep -v "bridge" | grep -v "host" | grep -v "none")

re:
	make clean
	make all

.PHONY: all down clean
