FROM alpine:latest

COPY Gemfile config.ru puma.rb /app/
COPY frontend /app/frontend
COPY lib /app/lib

RUN set -x \
  && buildDeps='build-base ruby-dev nodejs nodejs-npm' \
  && runDeps='ruby ruby-json ruby-bundler libstdc++ tzdata bash ca-certificates' \
  && apk add --no-cache $runDeps \
  && apk add --no-cache $buildDeps \
  && echo 'gem: --no-document' > /etc/gemrc \
  && cd /app/frontend \
  && npm install \
  && npm run build \
  && find . -maxdepth 1 ! -mindepth 1 -iname dist -exec rm -r {} \; \
  && cd /app \
  && bundle install --path vendor/bundle \
  && apk del $buildDeps \
  && rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

WORKDIR /app
CMD bundle exec puma -C puma.rb