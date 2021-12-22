#Build the API and Client docker files from root dir (DEV)
build-dev:
	cd api && $(MAKE) build-dev
	cd client && $(MAKE) build-dev

run-dev:
	ENV=dev docker-compose -f docker-compose.yml up

dev-stop:
	ENV=dev docker-compose -f docker-compose.yml stop
	
dev-down:
	ENV=dev docker-compose -f docker-compose.yml down


# Cleanup all docker images on host
prune:
	docker image prune -a

nuke-image: 
	docker images -a -q | xargs docker rmi -f

.PHONY: dev-stop dev-down migrate-up migrate-down \
		prod-stop prod-down build-dev api-shell \
		client-shell ssh run-production build-production \
		run-local build-local run-dev prune