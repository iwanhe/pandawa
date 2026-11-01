// Command GO-125_exit_di_banyak_tempat melanggar GO-125.
package main

import (
	"fmt"
	"log"
	"os"
)

func main() {
	fmt.Println(len(bacaFile()))
}

func bacaFile() []byte {
	if len(os.Args) != 2 {
		log.Fatal("pemakaian: program <file>")
	}
	data, err := os.ReadFile(os.Args[1])
	if err != nil {
		log.Fatal(err)
	}
	return data
}
