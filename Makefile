all: build

include .env
export

build:
	docker build --build-arg ALPINE_VERSION=$(ALPINE_VERSION)  --no-cache=true -t mheers/alpine-tools:$(ALPINE_VERSION) .

push:
	docker tag mheers/alpine-tools:$(ALPINE_VERSION) mheers/alpine-tools:latest
	docker push mheers/alpine-tools:$(ALPINE_VERSION)
	docker push mheers/alpine-tools:latest
