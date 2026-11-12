import { defineConfig } from 'vitest/config';

// Vitest 5 (Vite 8 + Oxc) membaca experimentalDecorators dan emitDecoratorMetadata
// dari tsconfig, sehingga dependency injection NestJS berjalan tanpa plugin SWC.
// File e2e berbagi satu database, jadi dijalankan berurutan.
export default defineConfig({
  test: {
    include: ['test/**/*.spec.ts', 'test/**/*.e2e-spec.ts'],
    fileParallelism: false,
  },
});
