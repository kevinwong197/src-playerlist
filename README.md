# src-playerlist

web based source engine server browser built with vue + sinatra

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

## setup
```
bundle --path vendor/bundle
npm i
```
make sure it's running with STEAM_API_KEY defined

## Installation
```
npm run build
bundle exec rake server:serve
```

## Development
```
npm run dev
bundle exec rake server:dev
```

## Todo (someday)
- refactoring
- sorting
- use A2S info for currently visible servers as a workaround for the masterserver's playercount inconsistency (info refresh button)
- custom dirname inputbox (with :to="'/' + dirname")