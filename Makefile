# Makefile for Hydroflow project

.DEFAULT_GOAL := build

SRC_DIR := src
BUILD_DIR := target
BIN_NAME := hydroflow

RELEASE ?= debug

.PHONY: build
build:
	@cargo build --release $(RELEASE)

.PHONY: run 
run: build
	@cargo run --release $(RELEASE) --bin $(BIN_NAME) 

.PHONY: test
test:
	@cargo test

.PHONY: clean
clean:
	@cargo clean
	@rm -rf $(BUILD_DIR)

.PHONY: deps
deps:
	@scripts/deps.sh

.PHONY: help
help:
	@echo "Hydroflow Makefile"
	@echo
	@echo "Usage:"
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "\033[36m%-35s\033[0m %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

## deps: Check required dependencies are installed
