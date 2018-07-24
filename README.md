# src-playerlist (WIP)

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

just an exercise of some sort\
honestly I'll probably never finish this

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

## Todo
- sorting
- server name search
- regex support for search
- table / table header instead of the current card list
- use A2S info for currently visible servers as a workaround for the masterserver's playercount inconsistency (info refresh button)
- less short circuiting
- custom dirname inputbox (with :to="'/' + dirname")