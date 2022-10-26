COMPOSE_FILES_KAFKA=-f docker-compose.yml -f ./kafka/docker-compose.yml

pull-kafka:
	docker-compose ${COMPOSE_FILES_KAFKA} pull

up-kafka:
	docker-compose ${COMPOSE_FILES_KAFKA} up -d --build && docker-compose ${COMPOSE_FILES_KAFKA} ps

ps-kafka:
	docker-compose ${COMPOSE_FILES_KAFKA} ps

pull-kafka:
	docker-compose ${COMPOSE_FILES_KAFKA} pull

logs-kafka:
	docker-compose ${COMPOSE_FILES_KAFKA} logs -f