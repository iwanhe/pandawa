package benar

import (
	"context"
	"database/sql"
	"errors"
	"fmt"
)

// ErrSupplierTidakDitemukan dikembalikan bila kode supplier tidak ada (GO-111, GO-114).
var ErrSupplierTidakDitemukan = errors.New("supplier tidak ditemukan")

// NamaSupplier mengambil nama supplier berdasarkan kode.
func NamaSupplier(ctx context.Context, db *sql.DB, kode string) (string, error) {
	const q = `select nama
                 from supplier
                where kode = $1` // GO-318, GO-604

	var nama string
	err := db.QueryRowContext(ctx, q, kode).Scan(&nama)
	if errors.Is(err, sql.ErrNoRows) { // GO-113
		return "", ErrSupplierTidakDitemukan
	}
	if err != nil {
		return "", fmt.Errorf("ambil supplier %s: %w", kode, err) // GO-112
	}
	return nama, nil
}
