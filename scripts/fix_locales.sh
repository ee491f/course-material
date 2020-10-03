#!/bin/bash

# This script fixes the locales issue with containers:
# https://github.com/jekyll/jekyll/issues/4268#issuecomment-167406574

# Install program to configure locales
apt-get update && apt-get install -qq -y locales
dpkg-reconfigure locales && \
  locale-gen C.UTF-8 && \
  /usr/sbin/update-locale LANG=C.UTF-8

# Install needed default locale for Makefly
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && \
  locale-gen
