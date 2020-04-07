SHELL=/bin/bash
setup:
	# #
	./setup.sh

lint:
	# This is a linter for Python source code linter: https://www.pylint.org/
	./lint.sh
	# This is linter for Dockerfiles
	hadolint Dockerfile

all: setup lint
