#!/bin/bash -e

RET=1

cleanup() {
    set +e
    [ -z $PID ] || kill $PID
    exit $RET
}
trap cleanup EXIT

python hello.py &
PID=$!

curl http://127.0.0.1:5000/ | grep "Hello world"
RET=$?
