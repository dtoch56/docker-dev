COMPOSE_FILES_EXT=-f docker-compose.yml -f ./ext/docker-compose.yml

pull-ext:
	docker-compose ${COMPOSE_FILES_EXT} pull

up-ext:
	docker-compose ${COMPOSE_FILES_EXT} up -d --build && docker-compose ${COMPOSE_FILES_EXT} ps

ps-ext:
	docker-compose -f ./ext/docker-compose.yml ps

logs-ext:
	docker-compose -f ./ext/docker-compose.yml logs -f