.PHONY: build rundev stop restart rebuild clean
BASE_DIR = $(dir $(shell pwd))
DIR = $(notdir $(shell pwd))

CONTAINER_NAME ?= edgb
IMAGE_NAME ?= fb

WORKDIR ?= /opt/flask


build:
	docker build -t $(IMAGE_NAME) . --no-cache

run:
	docker run -d -p 5000:5000 -v $(BASE_DIR)$(DIR)/microblog:$(WORKDIR)/microblog --name $(CONTAINER_NAME) $(IMAGE_NAME)



freeze:
	docker exec $(CONTAINER_NAME)  venv/bin/pip freeze
