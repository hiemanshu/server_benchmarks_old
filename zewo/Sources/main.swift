import HTTPServer
import Router

let app = Router { route in
  route.get("/hello") { request in
    return Response(body: "Hello, World!")
  }
}

try Server(app).start()
