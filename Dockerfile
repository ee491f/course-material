FROM ruby:2.5.3

WORKDIR /usr/src/app/

# delete this locales workaround when possible
# it's better to keep workaround at the bottom of Dockerfile,
# but having this at the bottom didn't make use of docker's caching.
COPY scripts/fix_locales.sh /usr/src/app/scripts/
RUN scripts/fix_locales.sh
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
# end: delete this locales workaround when possible

RUN apt-get update && apt-get install -qq -y \
  shellcheck

COPY Gemfile* /usr/src/app/
RUN bundle

COPY . /usr/src/app/
