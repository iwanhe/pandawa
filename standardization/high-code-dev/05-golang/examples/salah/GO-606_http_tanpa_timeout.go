package salah

import (
	"io"
	"net/http"
)

// Ambil melanggar GO-605 dan GO-606: tanpa context dan memakai klien default tanpa timeout.
func Ambil(url string) ([]byte, error) {
	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	return io.ReadAll(resp.Body) // GO-106: body tidak ditutup
}
