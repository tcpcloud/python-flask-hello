#!/usr/bin/make -f

PYLINT=$(shell which pylint)
ORGANIZATION?="tcpcloud"
NAME?="python-flask-hello"

install:

clean:
	[ -d log ] && rm -rf log

test: errorlint
	./tests/run_test.sh

docker:
	mkdir log
	docker build --no-cache -t ${ORGANIZATION}/${NAME} . 2>&1 | tee log/${NAME}.log

lint:
	test -n ${PYLINT}
	python ${PYLINT} hello.py

errorlint:
	test -n ${PYLINT}
	python ${PYLINT} -E hello.py
