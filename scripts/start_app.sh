#!/bin/bash

# This script starts the application

SRC_DIR=$(cd "$(dirname $0)"; pwd -P)
. $SRC_DIR/functions.sh

wait_for_service database 3306

SRC_DIR=$(cd "$(dirname "$0")"; pwd -P)
. "$SRC_DIR"/functions.sh

./gradlew bootRun
