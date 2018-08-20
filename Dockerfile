FROM ubuntu:latest

RUN apt-get update && \
  apt-get install -y \
  build-essential \
  ruby \
  ruby-dev \
  nodejs \
  npm \
  nginx

COPY . /app

WORKDIR /app/frontend
RUN npm i
RUN npm run build

WORKDIR /app
RUN gem install bundler
RUN bundle install --path vendor/bundle

# RUN adduser -D myuser
# USER myuser

CMD ["bundle", "exec", "puma", "-C", "puma.rb"]