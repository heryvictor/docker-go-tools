.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sed -e 's/.*Makefile://' \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s:\033[0m %s\n", $$1, $$2}'

VERSION = 0.1.0

.PHONY: clean
clean: ## It removes the generated images locally, if they exists
	-docker rmi heryvictor/docker-go-tools:$(VERSION)
	-docker rmi heryvictor/docker-go-tools:latest

.PHONY: build
build: ## It builds ths image with the given version and latest tag
	docker build -t heryvictor/docker-go-tools:$(VERSION) .
	docker tag heryvictor/docker-go-tools:$(VERSION) heryvictor/docker-go-tools:latest

.PHONY: push
push: ## It pushes images to the docker hub
	docker push heryvictor/docker-go-tools:$(VERSION)
	docker push heryvictor/docker-go-tools:latest

.PHONY: run
run: ## It runs the image with bash as entrypoint and interactive mode
	docker run -ti --rm heryvictor/docker-go-tools:$(VERSION) bash
