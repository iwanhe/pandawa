package benar

import (
	"context"
	"time"
)

// Worker menjalankan fungsi secara berkala di goroutine latar.
// GO-127 dan GO-128: goroutine dapat dihentikan dan ditunggu sampai selesai.
type Worker struct {
	cancel context.CancelFunc
	done   chan struct{}
}

// StartWorker menjalankan fn setiap interval sampai Shutdown dipanggil.
func StartWorker(interval time.Duration, fn func(context.Context)) *Worker {
	ctx, cancel := context.WithCancel(context.Background())
	w := &Worker{cancel: cancel, done: make(chan struct{})}

	go func() {
		defer close(w.done)

		t := time.NewTicker(interval)
		defer t.Stop()

		for {
			select {
			case <-ctx.Done():
				return
			case <-t.C:
				fn(ctx)
			}
		}
	}()
	return w
}

// Shutdown menghentikan goroutine dan menunggu sampai benar-benar selesai.
func (w *Worker) Shutdown() {
	w.cancel()
	<-w.done
}
