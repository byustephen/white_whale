# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: build run stop

help: ## Shows a list of make targets
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

IMAGENAME=bitcoin
APPNAME=core
VERSION=22.0

.PHONY: build
build: ## Build the code
	@echo "Run build"
	docker build -t $(IMAGENAME)-$(APPNAME)_$(VERSION) .

.PHONY: run
run: ## Run container
	docker run -i -t --rm --name="$(IMAGENAME)$(APP_NAME)" $(IMAGENAME)-$(APPNAME)_$(VERSION)