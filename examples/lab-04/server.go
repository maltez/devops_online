package main

import (
	"fmt"
	"log"
	"net/http"
)

func homeRouterHandler(w http.ResponseWriter, r *http.Request) {
	err := r.ParseForm()
	if err != nil {
		log.Panic("Parse with err\n")
	}

	fmt.Println(r.Form)
	fmt.Println("path", r.URL.Path)
	fmt.Println("scheme", r.URL.Scheme)

	fmt.Println(w, "Hello VasCos")
}

func main() {
	http.HandleFunc("/", homeRouterHandler)

	err := http.ListenAndServe(":9000", nil)

	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
