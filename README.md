# Simple Server Benchmarks

## Hardware:
Standard Mid 2014 MacBook Pro. i7 2.2Ghz, 16GB RAM, 256GB SSD.

## Benchmarks:

### Simple no template return (/hello)
Framework | Requests/Sec | Average Latency
----|---|----
[Warp](https://hackage.haskell.org/package/warp-3.2.6)  | 102147 |  1.46 ms
[Iris](https://github.com/kataras/iris)  | 86856 |  1.69 ms
[Gin](https://github.com/gin-gonic/gin) - without Logger  | 65341 |  2.29 ms
[Plug](https://github.com/elixir-lang/plug) - without Logger  | 41210 |  9.31 ms
[Gin](https://github.com/gin-gonic/gin)  | 29388 |  10.77 ms
[Plug](https://github.com/elixir-lang/plug)  | 14918 |  11.83 ms
[Express](https://github.com/expressjs/express)  | 10118 |  14.60 ms
[Vapor](https://github.com/qutheory/vapor)  | 8196 |  18.42 ms
[Zewo](https://github.com/Zewo/Zewo)  | 4948 |  31.02 ms
[Flask + Tornado](https://github.com/tornadoweb/tornado)  | 1805 |  81.79 ms
[Sinatra](https://github.com/sinatra/sinatra)  | 974 |  203.71 ms
[Bottle](https://github.com/bottlepy/bottle) | 546 |  1.38ms
[Kitura](https://github.com/IBM-Swift/Kitura) | 545 |  321.45 us
[Flask](https://github.com/pallets/flask)  | 544 |  74.15 ms
[Falcon](https://github.com/falconry/falcon)  | 543 |  47.06 ms

### Fortunes (/fortunes)
Framework | Requests/Sec | Average Latency
----|---|----
[Warp](https://hackage.haskell.org/package/warp-3.2.6)  | 10217 |  14.60 ms
[Gin](https://github.com/gin-gonic/gin)  | 3340  |  61.20 ms
[Sinatra](https://github.com/sinatra/sinatra)  | 430 |  260.90 ms

### Fortunes.json (/fortunes.json)
Framework | Requests/Sec | Average Latency
----|---|----
[Warp](https://hackage.haskell.org/package/warp-3.2.6)  | 13255 | 11.14 ms
[Gin](https://github.com/gin-gonic/gin)  | 3222 |  56.63 ms
[Sinatra](https://github.com/sinatra/sinatra)  | 588 |  197.96 ms

## Command to benchmark
    wrk -t4 -c150 -d30s http://localhost:PORT/path


## Contributing :

If you want to add more frameworks or find a better or doing feel free to send a PR my way.

The current structure is as follow:

- `/hello` returns a simple "Hello, World!" message
- `/fortunes` returns a rendered html with all the fortune cookie messages
- `/fortunes.json` returns JSON with all the fortune cookie messages

You can find the schema for the fortunes table in `database/fortunes.sql`. All tests will use postgresql as the database.
