package benar

import (
	"context"
	"fmt"
)

// Pengirim mengirim dokumen ke sistem tujuan.
type Pengirim interface {
	Kirim(ctx context.Context, idDokumen string) error
}

// KirimDokumen meneruskan error ke pemanggil dengan konteks, tanpa mencatatnya
// di sini. Pencatatan dilakukan satu kali oleh lapisan paling atas (GO-115).
func KirimDokumen(ctx context.Context, p Pengirim, idDokumen string) error {
	if err := p.Kirim(ctx, idDokumen); err != nil { // GO-316
		return fmt.Errorf("kirim dokumen %s: %w", idDokumen, err)
	}
	return nil
}
