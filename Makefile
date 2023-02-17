all: build

build: docker

include .env
export

docker: ##  Builds the application for amd64 and arm64
	docker buildx build --no-cache=true --build-arg ALPINE_VERSION=$(ALPINE_VERSION) --platform linux/amd64,linux/arm64 -t mheers/alpine-tools:$(ALPINE_VERSION) -t mheers/alpine-tools:latest --push .
