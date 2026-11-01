package benar

import (
	"context"
	"log/slog"
	"os"
)

// NewLogger membuat logger JSON standar (GO-607).
func NewLogger() *slog.Logger {
	return slog.New(slog.NewJSONHandler(os.Stdout, nil))
}

// CatatPengiriman mencatat pengiriman dengan pesan konstan dan correlationId,
// tanpa token atau data rahasia.
func CatatPengiriman(ctx context.Context, log *slog.Logger, cid, idDokumen string) {
	log.InfoContext(ctx, "kirim dokumen",
		slog.String("correlationId", cid),
		slog.String("idDokumen", idDokumen),
	)
}
