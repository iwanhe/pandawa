package salah

import "sync"

// Cache melanggar GO-104: mutex di-embed sehingga Lock/Unlock ikut menjadi API publik.
type Cache struct {
	sync.Mutex
	data map[string]string
}

// Ambil mengembalikan nilai untuk kunci k.
func (c *Cache) Ambil(k string) string {
	c.Lock()
	v := c.data[k]
	c.Unlock() // GO-106: tidak memakai defer
	return v
}
