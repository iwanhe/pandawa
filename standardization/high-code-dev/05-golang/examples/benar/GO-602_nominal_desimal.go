package benar

import "github.com/shopspring/decimal"

// Baris adalah satu baris tagihan.
// GO-126 dan GO-603: tag JSON camelCase, nominal diserialisasi sebagai string.
type Baris struct {
	KodeItem string          `json:"kodeItem"`
	Qty      decimal.Decimal `json:"qty"`
	Harga    decimal.Decimal `json:"harga"`
}

// TotalTagihan menjumlahkan qty x harga dengan tipe desimal (GO-602).
func TotalTagihan(baris []Baris) decimal.Decimal {
	total := decimal.Zero
	for _, b := range baris {
		total = total.Add(b.Qty.Mul(b.Harga))
	}
	return total
}
