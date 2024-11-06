.PHONY: help build build-local up down logs ps test
.DEFAULT_GOAL := help

DOCKER_TAG := latest
build: 
	docker built -t Chocobone/go_todo_app_GDSC:${DOCKER_TAG} --target deploy ./

build-local:
	docekr compose build --no-cache

up:
	docker compose up -d 

down:
	docker compose down

logs:
	docker compose logs -f

ps:
	docker compose ps

test:
	go test -race -shuffle=on ./...

help:
	@grep -E '^[a-zA-z_-]+:.*?##$$' $(MAKEFILE_LIST) | \awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2"}'
