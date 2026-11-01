package benar

import (
	"context"
	"fmt"
	"io"
	"net/http"
	"time"
)

// KlienSAP memanggil API SAP dengan timeout eksplisit (GO-606).
type KlienSAP struct {
	http    *http.Client
	baseURL string
}

// NewKlienSAP membuat klien dengan batas waktu per permintaan.
func NewKlienSAP(baseURL string, timeout time.Duration) *KlienSAP {
	return &KlienSAP{
		http:    &http.Client{Timeout: timeout},
		baseURL: baseURL,
	}
}

// Ambil membaca resource dengan context dari pemanggil (GO-605).
func (k *KlienSAP) Ambil(ctx context.Context, path string) ([]byte, error) {
	req, err := http.NewRequestWithContext(ctx, http.MethodGet, k.baseURL+path, nil)
	if err != nil {
		return nil, fmt.Errorf("buat request: %w", err)
	}

	resp, err := k.http.Do(req)
	if err != nil {
		return nil, fmt.Errorf("panggil SAP %s: %w", path, err)
	}
	defer resp.Body.Close() // GO-106

	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("panggil SAP %s: status %d", path, resp.StatusCode)
	}
	return io.ReadAll(resp.Body)
}
