# Setup

Install urweb
```
brew install urweb
brew install libpqxx
```

## Building
```
export C_INCLUDE_PATH="/usr/local/include/"
urweb bench
```

## Running
```
./bench.exe -q -k -t 8
```

It will run on port 8080