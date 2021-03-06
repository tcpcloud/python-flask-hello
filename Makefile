#!/usr/bin/make -f

PYLINT=$(shell which pylint)
ORGANIZATION?="tcpcloud"
NAME?="python-flask-hello"
TAG_VERSION?="latest"

install:

clean:
	[ ! -d log ] || rm -rf log

test: errorlint
	./tests/run_test.sh

docker:
	[ -d log ] || mkdir log
	docker build --no-cache -t ${ORGANIZATION}/${NAME}:${TAG_VERSION} . 2>&1 | tee log/${NAME}.log

lint:
	test -n ${PYLINT}
	python ${PYLINT} hello.py

errorlint:
	test -n ${PYLINT}
	python ${PYLINT} -E hello.py
