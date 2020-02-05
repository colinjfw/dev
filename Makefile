base:
	docker build -t colinjfw/base:latest base
.PHONY: base

java: base
	docker build -t colinjfw/java:latest java
.PHONY: java

rails: base
	docker build -t colinjfw/rails:latest rails
.PHONY: rails

dev: base
	docker build -t colinjfw/dev:latest dev
.PHONY: dev

all: java rails dev
	docker push colinjfw/base:latest
	docker push colinjfw/java:latest
	docker push colinjfw/rails:latest
	docker push colinjfw/dev:latest
.PHONY: all
