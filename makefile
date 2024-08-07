#PID	= 

all:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	$(MAKE) kill
	@docker-compose -f ./srcs/docker-compose.yml down

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

kill:
	sudo kill $$(docker inspect nginx | grep '"Pid":' | awk -F' ' '{print $$2}' | sed 's/,//')

clean:
	$(MAKE) kill
	sudo rm -rf /home/$(USER)/data/mysql/* #borra archivos de mysql
	sudo rm -rf /home/$(USER)/data/wordpress/* #borra archivos de wordpress
	@docker stop $$(docker ps -qa) #??
	@echo -------- CONTAINERS STOPPED --------
	@docker rm $$(docker ps -qa) #borra contenedor
	@echo -------- CONTAINERS DELETED --------
	@docker rmi -f $$(docker images -qa) #borra imagen
	@echo -------- IMAGES DELETED --------
	@docker volume rm $$(docker volume ls -q) #borra volumen
	@echo -------- VOLUMES DELETED --------
	@docker network rm jgravalo-dockernet #borra red
	@echo -------- NETWORKS DELETED --------
	@#docker network rm $$(docker network ls -q | grep -v "bridge" | grep -v "host" | grep -v "none")

re:
	make clean
	make all

.PHONY: all down ls kill clean
