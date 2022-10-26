COMPOSE_FILES_EFK=-f docker-compose.yml -f ./efk/docker-compose.yml

up-efk:
	if [ "$(sysctl -n vm.max_map_count)" -lt 262144 ]; then  sudo sysctl -w vm.max_map_count=262144; fi
	docker-compose ${COMPOSE_FILES_EFK} up -d --build && docker-compose ${COMPOSE_FILES_EFK} ps

ps-efk:
	docker-compose -f ./efk/docker-compose.yml ps

logs-efk:
	docker-compose -f ./efk/docker-compose.yml logs -f

efk-token:
	docker exec elasticsearch bin/elasticsearch-create-enrollment-token --scope kibana 

efk-code:
	docker exec kibana bin/kibana-verification-code

efk-pass:
	docker exec -it elasticsearch bin/elasticsearch-setup-passwords interactive
#	docker exec -it elasticsearch bin/elasticsearch-reset-password -b -u elastic
#	docker exec -it elasticsearch bin/elasticsearch-reset-password -b -u kibana_system
#	docker exec -it elasticsearch bin/elasticsearch-reset-password -b -u logstash_system
#	docker exec -it elasticsearch bin/elasticsearch-reset-password -b -u beats_system
#	docker exec -it elasticsearch bin/elasticsearch-reset-password -b -u apm_system
#	docker exec -it elasticsearch bin/elasticsearch-reset-password -b -u remote_monitoring_user

efk-rm-volumes:
	sudo rm -rf ${STORAGE}/elasticsearch/data/*
	sudo rm ./efk/setup/.done
