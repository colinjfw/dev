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
