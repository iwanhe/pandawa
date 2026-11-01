package benar

import "errors"

var errTipeTidakSesuai = errors.New("tipe tidak sesuai")

// SebagaiTeks mengubah nilai menjadi string dengan aman (GO-117).
func SebagaiTeks(v any) (string, error) {
	s, ok := v.(string)
	if !ok {
		return "", errTipeTidakSesuai
	}
	return s, nil
}
