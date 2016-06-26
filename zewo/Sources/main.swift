import HTTPServer
import Router

let app = Router { route in
  route.get("/hello/:name") { request in
    guard let name = request.pathParameters["name"] else {
      return Response(status: .internalServerError)
    }
    return Response(body: "Hello, \(name)!")
  }
}

try Server(app).start()
