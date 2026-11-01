package benar

import (
	"testing"

	"github.com/shopspring/decimal"
)

// GO-401: table-driven test dengan tests, tt, give, dan want.
func TestTotalTagihan(t *testing.T) {
	t.Parallel()

	d := decimal.RequireFromString
	tests := []struct {
		name string
		give []Baris
		want string
	}{
		{name: "kosong", give: nil, want: "0"},
		{
			name: "pecahan tidak hilang",
			give: []Baris{
				{KodeItem: "A", Qty: d("3"), Harga: d("0.1")},
				{KodeItem: "B", Qty: d("1"), Harga: d("0.2")},
			},
			want: "0.5",
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			if got := TotalTagihan(tt.give); !got.Equal(d(tt.want)) {
				t.Fatalf("TotalTagihan() = %s, want %s", got, tt.want)
			}
		})
	}
}
