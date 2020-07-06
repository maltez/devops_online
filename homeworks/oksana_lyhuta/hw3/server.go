package main

import (
	"fmt"
	"log"
	"net/http"
)

func HomeRouterHandler(w http.ResponseWriter, r *http.Request) {
	r.ParseForm()
	fmt.Println(r.Form)
	fmt.Println("path", r.URL.Path)
	fmt.Println("scheme", r.URL.Scheme)

	fmt.Println(w, "Hello Nick")
}

func main() {
	http.HandleFunc("/", HomeRouterHandler)

	err := http.ListenAndServe(":9000", nil)

	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
