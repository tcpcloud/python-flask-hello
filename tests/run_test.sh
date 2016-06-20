#!/bin/bash -e

RET=1

check_proc() {
    if [ ! -d /proc/$1 ]; then
        echo "ERROR: Process did not start" 1>&2
        unset PID
        exit 1
    fi
}

cleanup() {
    set +e
    [ -z $PID ] || kill $PID
    [ $RET -ne 0 ] && echo "== Test execution failed, retval=$RET" 1>&2
    exit $RET
}
trap cleanup EXIT

python hello.py &
PID=$!

sleep 1
check_proc $PID

curl -m 10 -s -v -f http://127.0.0.1:5000/ | grep -i "Hello World"
RET=$?
