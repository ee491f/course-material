#!/bin/sh

# This script bootstraps the application

set -e

### define functions
SRC_DIR=$(cd "$(dirname "$0")"; pwd -P)
# shellcheck source=scripts/functions.sh
. "$SRC_DIR"/scripts/functions.sh

# set_defaults
#
# sets up the defaults to be used later
#
# example usage: set_defaults
set_defaults() {
  ENV=development
}

# gather_options
#
# gathers the options provided by the user
# based off of http://linuxcommand.org/lc3_wss0120.php
#
# example usage: gather_options "$@"
gather_options() {
  while [ "$1" != "" ]; do
    case $1 in
      -e)
        ENV=$2
        shift
      ;;
    esac
    shift
  done
}
### define functions:end

set_defaults
gather_options "$@"

case $ENV in
  'development')
    echo "Clearing out old containers"
    teardown_containers "$ENV"
    echo "Setting up $ENV containers"
    setup_containers "$ENV"
  ;;
esac
