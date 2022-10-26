# https://nginx.org/en/download.html
NGINX_VERSION=1.21.6

NGINX_TAG=${NGINX_VERSION}-alpine
IMAGE_NAME=registry.gitlab.com/progressum/docker-dev/nginx

BUILD_ARGS=--build-arg BUILD_DATE="$(shell date -Iseconds)" \
--build-arg GIT_SHA="$(shell git rev-parse --verify HEAD)"

PLATFORMS=linux/amd64,linux/arm64


.PHONY: help login release pull


help:
	@echo ''
	@echo 'Usage: make [TARGET]'
	@echo 'Targets:'
	@echo '  release  Run pull, build and push targets'
	@echo '  pull     Pull built images from release step'
	@echo '  remove   Remove project related docker images'
	@echo ''

release:
	docker run --pull=always --name emulator --privileged --rm tonistiigi/binfmt --install arm64,amd64

	docker buildx build \
--platform $(PLATFORMS) \
--push \
--no-cache \
--build-arg BASE_IMAGE_TAG=$(NGINX_TAG) \
$(BUILD_ARGS) \
-t $(IMAGE_NAME):$(NGINX_TAG) \
-t $(IMAGE_NAME):latest \
.

pull:
	docker pull $(IMAGE_NAME):$(IMAGE_TAG)
