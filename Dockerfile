FROM ruby:2.7.3

WORKDIR /usr/src/app/

RUN apt-get update && apt-get install -qq -y \
    shellcheck \
  && rm -rf /var/lib/apt/lists/*

COPY Gemfile* /usr/src/app/
COPY scripts/install_dependencies.sh /usr/src/app/scripts/install_dependencies.sh
RUN scripts/install_dependencies.sh

COPY . /usr/src/app/

