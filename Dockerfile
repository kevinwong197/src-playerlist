FROM ubuntu:latest

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  build-essential \
  ruby \
  ruby-dev \
  nodejs \
  npm \
  nginx
RUN gem install bundler

WORKDIR /app/frontend
COPY frontend/package.json frontend/package-lock.json /app/frontend/
RUN npm i
COPY frontend /app/frontend
RUN npm run build

WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN bundle install --path vendor/bundle

COPY . /app
CMD ["bundle", "exec", "puma", "-C", "puma.rb"]