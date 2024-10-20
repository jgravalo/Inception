all:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

vol:
	mkdir /home/jgravalo/data/
	mkdir /home/jgravalo/data/mysql/
	mkdir /home/jgravalo/data/wordpress/
	chmod -R 777 /home/jgravalo/data/

down:
	@docker compose -f ./srcs/docker-compose.yml down

clean:
	rm -rf /home/jgravalo/data/mysql/*
	rm -rf /home/jgravalo/data/wordpress/*
	@if [ ! -z "$$(docker ps -aq)" ]; then \
		docker stop $$(docker ps -aq); \
		docker rm $$(docker ps -aq); \
	fi
	@if [ ! -z "$$(docker images -aq)" ]; then \
		docker rmi $$(docker images -aq); \
	fi	
	@if [ ! -z "$$(docker volume ls -q)" ]; then \
		docker volume rm $$(docker volume ls -q); \
	fi
	@if [ ! -z "$$(docker network ls -q --filter type=custom)" ]; then \
		docker network rm $$(docker network ls -q --filter type=custom); \
	fi

ls:
	@docker ps -a
	@echo
	@docker images
	@echo
	@docker volume ls
	@echo
	@docker network ls

re: clean all

.PHONY: all down clean
