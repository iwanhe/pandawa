package salah

import "database/sql"

// Simpan melanggar GO-116: error Commit diabaikan.
func Simpan(tx *sql.Tx) {
	tx.Commit()
}
