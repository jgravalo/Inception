#PID	= 

all:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

install:
	sudo echo preparing...
	mkdir /home/$(USER)/data/
	mkdir /home/$(USER)/data/mysql/
	mkdir /home/$(USER)/data/wordpress/
	sudo groupadd docker
	sudo usermod -aG docker $(USER)
	newgrp docker

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
	sudo rm -rf /home/$(USER)/data/mysql/* #borra archivos de mysql
	sudo rm -rf /home/$(USER)/data/wordpress/* #borra archivos de wordpress
	@if [ ! -z "$$(docker ps -aq)" ]; then \
		docker stop $$(docker ps -aq); \
		docker rm $$(docker ps -aq); \
	fi
	@echo -------- CONTAINERS DELETED --------
	@if [ ! -z "$$(docker images -aq)" ]; then \
		docker rmi $$(docker images -aq); \
	fi	
	@echo -------- IMAGES DELETED --------
	@if [ ! -z "$$(docker volume ls -q)" ]; then \
		docker volume rm $$(docker volume ls -q); \
	fi
	@echo -------- VOLUMES DELETED --------
	@if [ ! -z "$$(docker network ls -q --filter type=custom)" ]; then \
		docker network rm $$(docker network ls -q --filter type=custom); \
	fi
	@echo -------- NETWORKS DELETED --------

re:
	make clean
	make all

.PHONY: all down ls kill clean
