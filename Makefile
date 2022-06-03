.PHONY: build

IMAGE_NAME := deploy-tool

build:
	docker build -t $(IMAGE_NAME):latest .