package main

import (
	"github.com/kataras/iris"
)

func main() {
	// render JSON
	iris.Get("/hello", func(c *iris.Context) {
		c.JSON(iris.StatusOK, iris.Map{
			"hello": "World!",
		})
	})
	iris.Listen(":8080")
}
