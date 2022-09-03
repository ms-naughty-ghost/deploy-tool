.PHONY: build run

IMAGE_NAME := deploy-tool

build:
	docker build -t $(IMAGE_NAME):latest .

run:
	docker run --rm -it $(IMAGE_NAME):latest