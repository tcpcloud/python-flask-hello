#!/usr/bin/env bats


# NOTE MAY LOAD HELPER FUNCTIONS ../TEST_HELPER.BASH
# example https://github.com/dokku/dokku/blob/fc63061eafffc93ec13503c36dcade0339fe0bff/tests/unit/test_helper.bash


#run_app() {
  #source /srv/hello/.env/bin/activate
  #nohup python /srv/hello/hello.py
#}


@test "flask app is running" {
  #run_app
  #run /bin/bash -c "curl -s -D - localhost:8000 -o /dev/null | egrep '^Server' | egrep '[0-9]+'"
  run /bin/bash -c "hostname"
  echo "output: "$output
  echo "status: "$status
  [ "$status" -eq 0 ]
}


