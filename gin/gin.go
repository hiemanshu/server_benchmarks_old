package main

import (
	"github.com/gin-gonic/gin"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/postgres"
)

type Fortunes struct {
	ID      int `gorm:"primary_key"`
	Message string
}

var fortunes []Fortunes
var db *gorm.DB

func hello(c *gin.Context) {
	c.JSON(200, gin.H{
		"hello": "world",
	})
}

func fortuneshtml(c *gin.Context) {
	db.Find(&fortunes)
	c.HTML(200, "fortunes.html", fortunes)
}

func fortunesjson(c *gin.Context) {
	db.Find(&fortunes)
	c.JSON(200, fortunes)
}

func main() {
	var err error

	r := gin.Default()
	r.LoadHTMLGlob("*.html")

	db, err = gorm.Open("postgres", "host=localhost sslmode=disable user=hiemanshu dbname=server_benchmarks")

	if err != nil {
		panic(err)
	}

	err = db.DB().Ping()
	if err != nil {
		panic(err)
	}

	r.GET("/hello", hello)
	r.GET("/fortunes", fortuneshtml)
	r.GET("/fortunes.json", fortunesjson)
	r.Run() // listen and server on 0.0.0.0:8080
}
