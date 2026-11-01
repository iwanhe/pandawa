// Command GO-125_exit_sekali menunjukkan os.Exit / log.Fatal hanya sekali di main.
package main

import (
	"errors"
	"fmt"
	"log"
	"os"
)

func main() {
	if err := run(os.Args[1:]); err != nil {
		log.Fatal(err) // GO-125: satu-satunya titik keluar
	}
}

func run(args []string) error {
	if len(args) != 1 {
		return errors.New("pemakaian: program <file>")
	}
	data, err := os.ReadFile(args[0])
	if err != nil {
		return fmt.Errorf("baca %s: %w", args[0], err)
	}
	fmt.Println(len(data))
	return nil
}
