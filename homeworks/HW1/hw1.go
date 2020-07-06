package main

import (
	"bufio"
	"flag"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	filename := flag.String("f", "", "Take argument from file")
	flag.Parse()

	var k int

	switch {
	case len(*filename) != 0:
		k = findk(inputArg(inputFile(filename)))
		fmt.Println("k =", k)

	case len(os.Args) > 1:
		var mSt = os.Args[1]
		k = findk(inputArg(mSt))
		fmt.Println("k =", k)

	default:
		k = findk(inputArg(inputConsole()))
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

func inputFile(filename *string) string {
	file, err := os.Open(*filename)
	if err != nil {
		panic(err)
	}
	defer file.Close()

	var fileData []string

	scanner := bufio.NewScanner(file)

	for scanner.Scan() {
		fileData = append(fileData, scanner.Text())
	}

	mFile := strings.Join(fileData, "")

	return mFile
}

func inputConsole() string {
	var consoleData string

	fmt.Println("Enter a natural number grater than 1:")
	fmt.Fscan(os.Stdin, &consoleData)

	return consoleData
}
