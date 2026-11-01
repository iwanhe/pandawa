package salah

import (
	"context"
	"database/sql"
	"errors"
	"fmt"
)

var errTidakDitemukan = errors.New("supplier tidak ditemukan")

// NamaSupplier melanggar GO-604: SQL disusun dari input pengguna.
func NamaSupplier(ctx context.Context, db *sql.DB, kode string) (string, error) {
	var nama string
	err := db.QueryRowContext(ctx, "select nama from supplier where kode = '"+kode+"'").Scan(&nama)
	if errors.Is(err, sql.ErrNoRows) {
		return "", fmt.Errorf("supplier %s: %w", kode, errTidakDitemukan)
	}
	return nama, err
}

// AdaSupplier melanggar GO-113: error yang sudah dibungkus dibandingkan dengan ==,
// sehingga perbandingan selalu salah.
func AdaSupplier(ctx context.Context, db *sql.DB, kode string) (bool, error) {
	_, err := NamaSupplier(ctx, db, kode)
	if err == errTidakDitemukan {
		return false, nil
	}
	return err == nil, err
}
