SHELL=/bin/bash
setup:
	# #
	./setup.sh

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	./lint.sh
	# source activate capstone
	#docker run --rm -i hadolint/hadolint < Dockerfile
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	#pylint --disable=R,C,W1203 hello.py

all: setup lint
