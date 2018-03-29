.PHONY: build rundev stop restart rebuild clean
BASE_DIR = $(dir $(shell pwd))
DIR = $(notdir $(shell pwd))

CONTAINER_NAME ?= edgb
IMAGE_NAME ?= fb

WORKDIR ?= /opt/flask


build:
	@docker build -t $(IMAGE_NAME) . --no-cache 
