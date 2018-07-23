# src-playerlist (WIP)
just an exercise of some sort
honestly I'll probably never finish this
##### [demo](http://src-playerlist.herokuapp.com)
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
- table / table header instead of the current card list
- use A2S info for currently visible servers as a workaround for the masterserver's playercount inconsistency
- add full refresh that'd call to the api with custom filters
