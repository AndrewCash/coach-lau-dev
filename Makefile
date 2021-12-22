#Build the API and Client docker files from root dir (DEV)
build-dev:
	cd api && $(MAKE) build-dev
	cd client && $(MAKE) build-dev

run-dev:
	ENV=dev docker-compose -f docker-compose.yml up

stop-dev:
	ENV=dev docker-compose -f docker-compose.yml stop
	
down-dev:
	ENV=dev docker-compose -f docker-compose.yml down


# Cleanup all docker images on host
prune-image:
	docker image prune -a

nuke-image: 
	docker images -a -q | xargs docker rmi -f


# Connect to shell on running container
api-shell:
	docker exec -it coach-lau_api_1 /bin/sh

client-shell:
	docker exec -it coach-lau_client_1 /bin/sh


.PHONY: dev-stop dev-down migrate-up migrate-down \
		prod-stop prod-down build-dev api-shell \
		client-shell ssh run-production build-production \
		run-local build-local run-dev prune