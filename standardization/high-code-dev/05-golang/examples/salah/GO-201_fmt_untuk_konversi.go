package salah

import "fmt"

// Nomor melanggar GO-201: memakai fmt untuk konversi int ke string.
func Nomor(n int) string {
	return fmt.Sprintf("%d", n)
}
