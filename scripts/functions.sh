#!/bin/sh

# teardown_containers
#
# clear out containers of any remnants of the application
#
# example usage: teardown_containers
teardown_containers() {
  local environment=$1

  case $environment in
    'development')
      docker-compose down -v
    ;;
  esac
}

# setup_containers
#
# set up containers to run application
#
# example usage: setup_containers
setup_containers() {
  local environment=$1

  case $environment in
    'development')
      docker-compose build
    ;;
  esac
}

# wait_for_service
#
# waits for service to be ready for connection
#
# example usage: wait_for_service http://localhost 27017
wait_for_service() {
  local host=$1
  local port=$2

  local service_up=1 #assume service is not up yet
  until [ "$service_up" -eq 0 ]; do
    sleep 5
    netcat $host $port </dev/null
    service_up=$?
  done
}
