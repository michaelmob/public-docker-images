.PHONY: help
SHELL         := /bin/bash
MAKEFILE_PATH := ./Makefile
MAKEFILES_DIR := ./@bin/makefiles

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'


init-makefiles: ## initialize makefiles
	rm -rf ${MAKEFILES_DIR}
	mkdir -p ${MAKEFILES_DIR}
	git clone https://github.com/binbashar/le-dev-makefiles.git ${MAKEFILES_DIR}
	echo "" >> ${MAKEFILE_PATH}
	sed -i '/^#include.*/s/^#//' ${MAKEFILE_PATH}

#
## IMPORTANT: Automatically managed -> don't uncomment this line
#
#include ./@bin/makefiles/circleci/circleci.mk
#include ./@bin/makefiles/release-mgmt/release.mk