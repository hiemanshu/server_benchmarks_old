package main

import "github.com/gin-gonic/gin"

func hello(c *gin.Context) {
	c.JSON(200, gin.H{
		"hello": "world",
	})
}

func main() {
	r := gin.Default()

	r.GET("/hello", hello)
	r.Run() // listen and server on 0.0.0.0:8080
}
