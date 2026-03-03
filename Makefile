# Ensure that every command in this Makefile
# will run with bash instead of the default sh
SHELL := /usr/bin/env bash

BOOTSTRAP_URL = https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.7/css/bootstrap.min.css
BOOTSTRAP_SHA = sha512-fw7f+TcMjTb7bpbLJZlP8g2Y4XcCyFZW8uy8HsRZsH/SwbMw0plKHFHr99DN3l04VsYNwvzicUX/6qurvIxbxw==

FONTAWESOME_URL = https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css
FONTAWESOME_SHA = sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==

# This is the default task
all: help

build: ## Compile to development binary
	export BOOTSTRAP_URL=$(BOOTSTRAP_URL) && \
	export BOOTSTRAP_SHA=$(BOOTSTRAP_SHA) && \
	export FONTAWESOME_URL=$(FONTAWESOME_URL) && \
	export FONTAWESOME_SHA=$(FONTAWESOME_SHA) && \
	envsubst '$$BOOTSTRAP_URL $$BOOTSTRAP_SHA $$FONTAWESOME_URL $$FONTAWESOME_SHA' < nginx_template.xslt.tmpl.xslt > nginx_template.xslt

.PHONY: all


#################
# Private tasks #
#################

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: help
