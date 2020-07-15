package main

import (
	"fmt"
	"os"
	"strconv"
)

func main() {
	var k int

	if len(os.Args) > 1 {
		var mSt = os.Args[1]
		k = findk(inputArg(mSt))
		fmt.Println("k =", k)
	}
}

func findk(x int) int {
	var mulFour = 1

	var k int

	for i := 0; x > mulFour; i++ {
		mulFour *= 4
		k = i
	}

	return k
}

func inputArg(x string) int {
	var m, err = strconv.Atoi(x)
	if err != nil {
		panic(err)
	}

	return m
}
