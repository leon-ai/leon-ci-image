.PHONY: help train run

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

train: ## Train the classifier
	docker-compose run leon npm run train expressions

build: ## Build the leon image
	docker-compose build leon

run: ## Run leon
	docker-compose up