all:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

clean:
	@rm -rf /home/$(USER)/data/mysql/*
	@rm -rf /home/$(USER)/data/wordpress/*
	@docker stop $$(docker ps -qa)
	@docker rm $$(docker ps -qa)
	@docker rmi $$(docker images -qa)
	@docker volume rm $$(docker volume ls -q)
	@docker network rm jgravalo-dockernet

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
