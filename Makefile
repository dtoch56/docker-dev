-include .env
include efk/Makefile
include ext/Makefile
include kafka/Makefile
-include Makefile.local

COMPOSE_FILES_ALL=-f docker-compose.yml -f ./efk/docker-compose.yml -f ./ext/docker-compose.yml -f ./kafka/docker-compose.yml

# all our targets are phony (no files to check).
.PHONY: help init pull up ext ps down mysql rabbitmq


# Regular Makefile part for buildpypi itself
help:
	@echo ''
	@echo 'Usage: make [TARGET]'
	@echo 'Targets:'
	@echo '  init     prepare project for first run'
	@echo '  pull     docker-compose pull'
	@echo '  up       docker-compose up -d --build && docker-compose ps'
	@echo '  ext      docker-compose -f docker-compose.yml -f docker-compose-ext.yml up -d --build && docker-compose ps'
	@echo '  efk      docker-compose -f docker-compose.yml -f docker-compose-efk.yml up -d --build && docker-compose ps'
	@echo '  ps       docker-compose ps'
	@echo '  down     docker-compose down -v'
	@echo ''

init:
	./.make/init.sh

pull:
	docker-compose pull

up:
	docker-compose up -d --build && docker-compose ps

up-all:
	docker-compose ${COMPOSE_FILES_ALL} up -d --build && docker-compose ${COMPOSE_FILES_ALL} ps

ps:
	docker-compose ps

ps-all:
	docker-compose ${COMPOSE_FILES_ALL} ps

logs:
	docker-compose logs -f

logs-all:
	docker-compose ${COMPOSE_FILES_ALL} logs -f

d:down

down:
	docker-compose ${COMPOSE_FILES_ALL} down -v --remove-orphans

list-ips:
	docker ps -a --format "{{ .ID }}" | xargs docker inspect -f "{{ .Name }}	{{ .State.Status }}	{{range.NetworkSettings.Networks}}{{.IPAddress}}/{{.IPPrefixLen}}	{{end}}"

list-nets:
	docker network ls --format "{{ .ID }}" | xargs docker network inspect -f "{{.Name}}	{{range.IPAM.Config}}{{.Subnet}}	{{end}}"

cert:
	docker exec mkcert mkcert \
-cert-file dev-cert.pem \
-key-file dev-key.pem \
"${DOMAIN}" "*.${DOMAIN}"

	docker exec mkcert mkcert \
-cert-file docker-cert.pem \
-key-file docker-key.pem \
"docker.loc" "*.docker.loc"

	docker exec mkcert mkcert \
-cert-file localhost-cert.pem \
-key-file localhost-key.pem \
"localhost"

	docker-compose restart traefik

mysql:
	docker exec -it mysql mysql -u root -p$(MYSQL_ROOT_PASSWORD)

rabbitmq:
	docker exec -it rabbitmq bash
