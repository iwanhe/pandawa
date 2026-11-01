package salah

// SebagaiTeks melanggar GO-117: panic bila v bukan string.
func SebagaiTeks(v any) string {
	return v.(string)
}
