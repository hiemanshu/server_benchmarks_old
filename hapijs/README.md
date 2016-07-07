hapijs - sample app for benchmarking
-----------------------------------

## Setup

run 
```
npm install 
```

and you're set!

## Running

```
node index.js
```

## Note:
update the postgres server uri in config/manifest.js

## Known Issues
If the postgres uri is not correct, the app will return 500 for any request.
I'm unsure at this moment why the server doesn't report the error. Will look
into it in the future.
