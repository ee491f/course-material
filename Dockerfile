FROM ruby:2.5.0

RUN apt-get update && apt-get install -qq -y \
  shellcheck

WORKDIR /usr/src/app/

COPY Gemfile* /usr/src/app/
RUN bundle

COPY . /usr/src/app/

RUN scripts/fix_locales.sh
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
