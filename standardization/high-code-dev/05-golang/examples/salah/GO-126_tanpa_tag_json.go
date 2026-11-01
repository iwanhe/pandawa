package salah

import "encoding/json"

// Baris melanggar GO-126 (tanpa tag JSON) dan GO-602 (float64 untuk nominal).
type Baris struct {
	KodeItem string
	Harga    float64
}

// KeJSON menyerialisasi baris tanpa kontrak nama field yang eksplisit.
func KeJSON(b Baris) ([]byte, error) {
	return json.Marshal(b)
}
