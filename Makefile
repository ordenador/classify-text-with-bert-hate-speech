SHELL=/bin/sh
export PATH := ./venv/bin:$(PATH)
.PHONY: help
help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf " \033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

venv:
	touch requirements.txt ;\
	test -d venv || virtualenv --python=$$PYTHON3 venv

pip-compile: venv
	python -m pip install --upgrade pip;\
	pip install pip-tools;\
	touch requirements.in ;\
	pip-compile --output-file requirements.txt requirements.in;\
	pip install -r requirements.txt

autopep8:
	autopep8 -i *.py

clean:
	rm -fr venv