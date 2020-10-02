#!/bin/sh

# This script builds the application

JEKYLL_ENV=production \
bundle exec jekyll build \
  --config "$JEKYLL_CONFIG_FILES"
