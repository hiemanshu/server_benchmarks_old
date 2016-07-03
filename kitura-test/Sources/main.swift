import Kitura

let router = Router()

router.get("/hello") {
  request, response, next in
    response.send("Hello, World!")
    next()
}

Kitura.addHTTPServer(onPort: 8080, with: router)
Kitura.run()
