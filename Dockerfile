FROM ubuntu:latest

COPY . /app

RUN buildDeps='build-essential ruby-dev nodejs npm' \
  && runDeps='ruby' \
  && set -x \
  && apt-get update \
  && apt-get install -y $runDeps --no-install-recommends \
  && apt-get install -y $buildDeps --no-install-recommends \
  && gem install bundler \
  && cd /app/frontend \
  && npm i \
  && npm run build \
  && cd /app \
  && bundle install --path vendor/bundle \
  && apt-get purge -y --auto-remove $buildDeps \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /app/frontend/node_modules

WORKDIR /app
CMD bundle exec puma -C puma.rb