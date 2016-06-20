#!/usr/bin/make -f

PYLINT=$(shell which pylint)

install:

clean:

test: errorlint
	./tests/run_test.sh

lint:
	test -n ${PYLINT}
	python ${PYLINT} hello.py

errorlint:
	test -n ${PYLINT}
	python ${PYLINT} -E hello.py
