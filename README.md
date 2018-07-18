# src-playerlist
just an exercise of some sort
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
- refactor backend
- table / table header instead of the current card list
- map search
- a button to filter away local servers
- workaround for the inconsistency between the playercount retrieved from masterserver and the actual playercount