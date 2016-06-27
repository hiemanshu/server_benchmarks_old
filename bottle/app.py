from bottle import route, run

@route('/hello')
def index():
    return "Hello, World!"

run(host='localhost', port=8080)
