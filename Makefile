.PHONY: install
install: ## Install gem dependencies
	bundle install

.PHONY: serve
serve: ## Run jekyll serve
	bundle exec jekyll serve --watch

.PHONY: build
build: ## Build the site
	bundle exec jekyll build

.PHONY: clean
clean: ## Clean generated files
	bundle exec jekyll clean

.PHONY: open
open: ## Open web browser with URL from jekyll serve
	@open http://localhost:4000

.PHONY: help
.DEFAULT_GOAL := help
help: ## Print help message (default)
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
