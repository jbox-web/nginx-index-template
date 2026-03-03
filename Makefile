# Ensure that every command in this Makefile
# will run with bash instead of the default sh
SHELL := /usr/bin/env bash

PAGE_TITLE    := "Debian Repository"
PAGE_HEADER   := "Debian Repository"
PAGE_FOOTER   := "Debian Repository"

BOOTSTRAP_URL := https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.8/css/bootstrap.min.css
BOOTSTRAP_SHA := sha512-nKXmKvJyiGQy343jatQlzDprflyB5c+tKCzGP3Uq67v+lmzfnZUi/ZT+fc6ITZfSC5HhaBKUIvr/nTLCV+7F+Q==

FONTAWESOME_URL := https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css
FONTAWESOME_SHA := sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==

# This is the default task
all: help

build: ## Compile to development binary
	export PAGE_TITLE=$(PAGE_TITLE) && \
	export PAGE_HEADER=$(PAGE_HEADER) && \
	export PAGE_FOOTER=$(PAGE_FOOTER) && \
	export BOOTSTRAP_URL=$(BOOTSTRAP_URL) && \
	export BOOTSTRAP_SHA=$(BOOTSTRAP_SHA) && \
	export FONTAWESOME_URL=$(FONTAWESOME_URL) && \
	export FONTAWESOME_SHA=$(FONTAWESOME_SHA) && \
	envsubst '$$PAGE_TITLE $$PAGE_HEADER $$PAGE_FOOTER $$BOOTSTRAP_URL $$BOOTSTRAP_SHA $$FONTAWESOME_URL $$FONTAWESOME_SHA' < nginx_template.xslt.tmpl > nginx_template.xslt

.PHONY: all


#################
# Private tasks #
#################

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: help
