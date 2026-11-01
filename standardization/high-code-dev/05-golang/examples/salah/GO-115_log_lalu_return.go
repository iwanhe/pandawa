package salah

import (
	"context"
	"log/slog"
)

// Pengirim mengirim dokumen ke sistem tujuan.
type Pengirim interface {
	Kirim(ctx context.Context, idDokumen string) error
}

// KirimDokumen melanggar GO-115: error dicatat lalu tetap dikembalikan,
// sehingga tercatat berulang di setiap lapisan.
func KirimDokumen(ctx context.Context, p Pengirim, idDokumen string) error {
	err := p.Kirim(ctx, idDokumen)
	if err != nil {
		slog.Error("gagal kirim dokumen " + idDokumen) // GO-607: pesan tidak konstan
		return err
	}
	return nil
}
