package salah

import "os"

var lokasiKonfigurasi string

// GO-123 dan GO-124: init membaca environment dan menjalankan goroutine.
func init() {
	lokasiKonfigurasi = os.Getenv("CFG")
	go func() {}()
}

// LokasiKonfigurasi mengembalikan lokasi konfigurasi yang dibaca init.
func LokasiKonfigurasi() string { return lokasiKonfigurasi }
