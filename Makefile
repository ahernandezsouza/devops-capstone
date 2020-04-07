SHELL=/bin/bash
setup:
	# #
	./setup.sh

lint:
	# This is a linter for Python source code linter: https://www.pylint.org/
	./lint.sh
	# This is linter for Dockerfiles
	hadolint Dockerfile

container:
	# Build Image
	./run_docker.sh

all: setup lint container
