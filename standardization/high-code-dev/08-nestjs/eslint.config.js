// Konfigurasi ESLint standar PANDAWA untuk NestJS (ESLint flat config).
// = standar JS/TS (eslint.base.js, salinan dari folder 02) + penyesuaian NestJS.
// Komentar di samping rule menyebut ID aturan di Standar_NestJS.xlsx.
//
// Pemakaian:   npx eslint . --max-warnings 0
//
// Catatan decorator: tsconfig memakai experimentalDecorators + emitDecoratorMetadata.
// typescript-eslint membaca keduanya dari tsconfig, sehingga consistent-type-imports
// tidak memaksa `import type` untuk kelas yang dipakai sebagai tipe parameter
// constructor (tipe itu dibutuhkan saat runtime oleh dependency injection).

import base from './eslint.base.js';

// Method TypeORM/driver yang menerima teks SQL.
const SQL_API =
  '/^(query|where|andWhere|orWhere|having|andHaving|orHaving|orderBy|select|addSelect)$/';

export default [
  { ignores: ['**/dist/**', '**/coverage/**'] },
  ...base,

  {
    files: ['**/*.ts'],
    rules: {
      // Module, controller, dan provider Nest adalah kelas yang isinya diberikan decorator.
      '@typescript-eslint/no-extraneous-class': ['error', { allowWithDecorator: true }], // NST-102
      // Jangan pakai forwardRef untuk menutupi dependensi melingkar.
      'no-restricted-syntax': [
        'error',
        {
          selector: 'ForInStatement',
          message: 'Gunakan for...of, Object.keys/entries, atau method array (JS-311).',
        },
        {
          selector: "CallExpression[callee.name='forwardRef']",
          message: 'forwardRef menandakan dependensi melingkar; pecah modulnya (NST-105).',
        },
        // SQL wajib berparameter: teks SQL tidak boleh disusun dari template berisi nilai
        // atau penyambungan string. Pemeriksaan ini tidak menangkap semua pola (lihat NST-402).
        {
          selector: `CallExpression[callee.property.name=${SQL_API}] > TemplateLiteral.arguments[expressions.length>0]`,
          message: 'SQL disusun dari template berisi nilai; pakai parameter $1, $2 (NST-402).',
        },
        {
          selector: `CallExpression[callee.property.name=${SQL_API}] > BinaryExpression.arguments[operator='+']`,
          message: 'SQL disusun dengan penyambungan string; pakai parameter $1, $2 (NST-402).',
        },
      ],
      // Konfigurasi hanya dibaca lewat ConfigService yang sudah divalidasi.
      'no-restricted-properties': [
        'error',
        { property: 'innerHTML', message: 'Gunakan textContent atau sanitasi (JS-804).' },
        { property: 'outerHTML', message: 'Gunakan textContent atau sanitasi (JS-804).' },
        { object: 'document', property: 'write', message: 'document.write dilarang (JS-804).' },
        {
          object: 'process',
          property: 'env',
          message: 'Baca konfigurasi lewat ConfigService (NST-702).',
        },
      ],
      'no-restricted-imports': [
        'error',
        {
          patterns: [
            {
              regex: '(^|/)index(\\.js)?$',
              message:
                'Jangan impor lewat barrel file index; impor file sumbernya langsung (NST-105).',
            },
          ],
        },
      ],
      // Logging lewat Logger Nest (JSON), bukan console.
      'no-console': ['error', {}], // NST-801
    },
  },

  // process.env hanya boleh dibaca di modul konfigurasi dan titik masuk test.
  {
    files: ['**/src/konfigurasi/**/*.ts', '**/test/**/*.ts'],
    rules: { 'no-restricted-properties': 'off' },
  },

  // Test: respons supertest bertipe any, dan matcher Vitest menerima method mock.
  {
    files: ['**/test/**/*.ts'],
    rules: {
      '@typescript-eslint/no-unsafe-member-access': 'off',
      '@typescript-eslint/no-unsafe-assignment': 'off',
      '@typescript-eslint/unbound-method': 'off',
    },
  },

  // File konfigurasi alat wajib default export.
  {
    files: ['**/vitest.config.ts', '**/eslint.config.js', '**/eslint.base.js'],
    rules: { 'no-restricted-exports': 'off' },
  },
];
