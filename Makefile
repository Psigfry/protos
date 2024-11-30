# Makefile for generating gRPC files
.DEFAULT_GOAL := help

GREEN := \033[1;32m
RED := \033[1;31m
RESET := \033[0m

.PHONY: help
help:  ## Display this help message
	@awk 'BEGIN {FS = ":.*##"; printf "Usage:\n  make <target>\n\nTargets:\n"} \
	/^[a-zA-Z_-]+:.*?##/ { \
		if ($$2 ~ /red/) \
			printf "  $(RED)%-20s$(RESET) %s\n", $$1, $$2; \
		else \
			printf "  $(GREEN)%-20s$(RESET) %s\n", $$1, $$2 \
	}' $(MAKEFILE_LIST)

all: generate ## generate
.PHONY: build
build: ## build
# Makefile for generating gRPC files
.DEFAULT_GOAL := help

# Цвета для вывода
GREEN := \033[1;32m
RESET := \033[0m

.PHONY: generate
generate: ## generate
	@start_time=$$(date +%s); \
	echo "Starting generation..."; \
	export PATH=$$PATH:$$HOME/go/bin && \
	protoc -I proto proto/sso/sso.proto --go_out=./gen/go --go_opt=paths=source_relative --go-grpc_out=./gen/go --go-grpc_opt=paths=source_relative; \
	end_time=$$(date +%s); \
	duration=$$((end_time - start_time)); \
	echo "Processing: $$duration seconds"; \
	echo -e "$(GREEN)generate sso.proto OK$(RESET)"

.PHONY: clean
clean: ## red clean
	@rm -rf gen


