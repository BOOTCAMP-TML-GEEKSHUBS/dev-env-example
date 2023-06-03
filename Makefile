start: ## start up enviroments
	docker compose -f deploy/develop/docker-compose.yaml up -d
	docker compose -f deploy/develop/docker-compose.yaml logs -f

ng: ## crea entorno de herramientas de angular
	docker compose -f deploy/develop/tools.yaml run -it -u 1000 --rm angular bash
nest: ## crea entorno de herramientas de nest js
	docker compose -f deploy/develop/tools.yaml run -it -u 1000 --rm nest bash

clone: ## obtiene repositorios de codigo legacy
	cd src && git clone repoxxxx   auth-service
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

