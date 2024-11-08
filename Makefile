.PHONY: help build build-local up down logs ps test
.DEFAULT_GOAL := help

DOCKER_TAG := latest
build: 
	docker build -t chocobone/go_todo_app_gdsc:${DOCKER_TAG} --target deploy ./

build-local:
	docker compose build --no-cache

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
