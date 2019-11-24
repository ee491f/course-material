#!/bin/sh

# This script starts the application

SRC_DIR=$(cd "$(dirname "$0")"; pwd -P)
. "$SRC_DIR"/functions.sh

bundle exec jekyll serve \
  --host 0.0.0.0 \
  --config $JEKYLL_CONFIG_FILES
