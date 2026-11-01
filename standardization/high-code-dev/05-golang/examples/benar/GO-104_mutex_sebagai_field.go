package benar

import "sync"

// Cache menyimpan nilai per kunci dan aman dipakai beberapa goroutine.
// GO-104: mutex adalah field tak-ekspor, bukan embedded, bukan pointer.
type Cache struct {
	mu   sync.Mutex
	data map[string]string
}

// NewCache membuat Cache kosong.
func NewCache() *Cache {
	return &Cache{data: make(map[string]string)}
}

// Ambil mengembalikan nilai untuk kunci k.
func (c *Cache) Ambil(k string) (string, bool) {
	c.mu.Lock()
	defer c.mu.Unlock() // GO-106

	v, ok := c.data[k]
	return v, ok
}
