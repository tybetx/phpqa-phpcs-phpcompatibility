ALIAS_ALPINE:=alias phpqa='docker run --init -it --rm -v "$$\(pwd\):/project" -w /project tybetx/phpqa-phpcs-phpcompatibility:alpine'
ALIAS_DEBIAN:=alias phpqa='docker run --init -it --rm -v "$$\(pwd\):/project" -w /project tybetx/phpqa-phpcs-phpcompatibility:debian'

default: help

.PHONY: help
help: ## Display this help message
	@cat $(MAKEFILE_LIST) | grep -e "^[a-zA-Z_\-]*: *.*## *" | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build-alpine: BUILD_TAG ?= tybetx/phpqa-phpcs-phpcompatibility:alpine
build-alpine: ## Build alpine image
	docker buildx build --load -t $(BUILD_TAG) --build-arg FLAVOUR=alpine .
.PHONY: build-alpine

build-debian: BUILD_TAG ?= tybetx/phpqa-phpcs-phpcompatibility:debian
build-debian: ## Build debian image
	docker buildx build --load -t $(BUILD_TAG) --build-arg FLAVOUR=debian .
.PHONY: build-debian

build-all: build-debian build-alpine ## Build all images
.PHONY: build-all

add-alias-alpine: ## Add alias to alpine image to ~/.bashrc
	grep -qF -- "${ALIAS_ALPINE}" ~/.bashrc || echo "${ALIAS_ALPINE}" | tee -a ~/.bashrc
.PHONY: add-alias-alpine

add-alias-debian: ## Add alias to debian image to ~/.bashrc
	grep -qF -- "${ALIAS_DEBIAN}" ~/.bashrc || echo "${ALIAS_DEBIAN}" | tee -a ~/.bashrc
.PHONY: add-alias-debian
