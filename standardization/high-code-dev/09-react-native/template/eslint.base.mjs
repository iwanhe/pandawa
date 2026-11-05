// SALINAN dari 02-javascript-typescript/eslint.config.js (standar JS/TS), berekstensi .mjs
// karena proyek React Native memakai CommonJS untuk file konfigurasi Babel, Metro, dan Jest.
// Jangan diubah di sini; ubah di folder 02 lalu salin ulang.
// Konfigurasi ESLint standar PANDAWA untuk JavaScript dan TypeScript (ESLint flat config).
// Sumber aturan: 02-javascript-typescript/Standar_JavaScript_TypeScript.xlsx.
// Komentar di samping setiap rule menyebut ID aturan yang ditegakkan.
//
// Pemakaian:   npx eslint .
// Format kode diserahkan ke Prettier (.prettierrc.json); eslint-config-prettier
// mematikan rule format ESLint agar keduanya tidak bertentangan.

import js from '@eslint/js';
import prettier from 'eslint-config-prettier';
import globals from 'globals';
import tseslint from 'typescript-eslint';

export default tseslint.config(
  { ignores: ['dist/**', 'build/**', 'coverage/**', 'node_modules/**'] },

  js.configs.recommended,
  ...tseslint.configs.strictTypeChecked,
  ...tseslint.configs.stylisticTypeChecked,

  {
    languageOptions: {
      ecmaVersion: 'latest',
      sourceType: 'module',
      globals: { ...globals.browser, ...globals.node },
      parserOptions: {
        projectService: true,
        tsconfigRootDir: import.meta.dirname,
      },
    },
    linterOptions: {
      reportUnusedDisableDirectives: 'error',
    },
    rules: {
      // JS-1xx Deklarasi dan penamaan
      'no-var': 'error', // JS-101
      'prefer-const': 'error', // JS-101
      'one-var': ['error', 'never'], // JS-102
      'no-multi-assign': 'error', // JS-102
      '@typescript-eslint/no-use-before-define': ['error', { functions: false }], // JS-103
      '@typescript-eslint/naming-convention': [
        'error', // JS-104, JS-105
        { selector: 'default', format: ['camelCase'] },
        { selector: 'variable', format: ['camelCase', 'UPPER_CASE', 'PascalCase'] },
        { selector: 'function', format: ['camelCase', 'PascalCase'] },
        { selector: 'parameter', format: ['camelCase'], leadingUnderscore: 'allow' },
        { selector: 'typeLike', format: ['PascalCase'] },
        { selector: 'enumMember', format: ['PascalCase', 'UPPER_CASE'] },
        { selector: 'import', format: ['camelCase', 'PascalCase'] },
        { selector: ['objectLiteralProperty', 'typeProperty'], format: null },
      ],

      // JS-2xx Fungsi
      'prefer-arrow-callback': 'error', // JS-201
      'max-params': 'off',
      '@typescript-eslint/max-params': ['error', { max: 3 }], // JS-203
      'no-param-reassign': [
        'error', // JS-204 (daftar pengecualian mengikuti Airbnb)
        {
          props: true,
          ignorePropertyModificationsFor: [
            'acc',
            'accumulator',
            'e',
            'ctx',
            'context',
            'req',
            'request',
            'res',
            'response',
          ],
        },
      ],
      '@typescript-eslint/default-param-last': 'error', // JS-205
      'prefer-rest-params': 'error', // JS-206
      'prefer-spread': 'error', // JS-206
      'no-inner-declarations': 'error', // JS-209
      'arrow-body-style': ['error', 'as-needed'], // JS-210
      'array-callback-return': 'error', // JS-211

      // JS-3xx Objek, array, string
      'no-object-constructor': 'error', // JS-301
      'no-array-constructor': 'off',
      '@typescript-eslint/no-array-constructor': 'error', // JS-301
      'object-shorthand': ['error', 'always'], // JS-302
      'prefer-object-spread': 'error', // JS-303
      'no-prototype-builtins': 'error', // JS-304
      'prefer-object-has-own': 'error', // JS-304
      'prefer-template': 'error', // JS-307
      radix: 'error', // JS-308
      'no-restricted-globals': [
        'error', // JS-308
        { name: 'isNaN', message: 'Gunakan Number.isNaN (JS-308).' },
        { name: 'isFinite', message: 'Gunakan Number.isFinite (JS-308).' },
      ],
      'no-new-wrappers': 'error', // JS-309
      'no-extend-native': 'error', // JS-310
      'no-restricted-syntax': [
        'error',
        {
          selector: 'ForInStatement',
          message: 'Gunakan for...of, Object.keys/entries, atau method array (JS-311).',
        },
      ],
      '@typescript-eslint/no-this-alias': 'error', // JS-312

      // JS-4xx Asynchronous
      '@typescript-eslint/no-floating-promises': 'error', // JS-402
      '@typescript-eslint/no-misused-promises': 'error', // JS-402
      'no-await-in-loop': 'error', // JS-403
      '@typescript-eslint/await-thenable': 'error', // JS-404

      // JS-5xx Error handling
      '@typescript-eslint/only-throw-error': 'error', // JS-501
      '@typescript-eslint/prefer-promise-reject-errors': 'error', // JS-501
      'no-empty': ['error', { allowEmptyCatch: false }], // JS-502
      'preserve-caught-error': 'error', // JS-503
      'no-console': ['error', { allow: ['warn', 'error'] }], // JS-505

      // JS-6xx Alur kontrol dan struktur
      'no-else-return': ['error', { allowElseIf: false }], // JS-603
      'no-nested-ternary': 'error', // JS-604
      'no-unneeded-ternary': 'error', // JS-604
      'default-case': 'error', // JS-606
      'default-case-last': 'error', // JS-606
      'no-case-declarations': 'error', // JS-606
      'no-fallthrough': 'error', // JS-606
      'max-depth': ['error', 3], // JS-608
      eqeqeq: ['error', 'always'], // JS-609

      // JS-7xx Modul
      '@typescript-eslint/no-require-imports': 'error', // JS-701
      'no-restricted-exports': [
        'error', // JS-702
        {
          restrictDefaultExports: {
            direct: true,
            named: true,
            defaultFrom: true,
            namedFrom: true,
            namespaceFrom: true,
          },
        },
      ],
      'no-duplicate-imports': ['error', { allowSeparateTypeImports: true }], // JS-703

      // JS-8xx Keamanan
      'no-eval': 'error', // JS-801
      '@typescript-eslint/no-implied-eval': 'error', // JS-801
      'no-new-func': 'error', // JS-801
      'no-restricted-properties': [
        'error', // JS-804
        { property: 'innerHTML', message: 'Gunakan textContent atau sanitasi (JS-804).' },
        { property: 'outerHTML', message: 'Gunakan textContent atau sanitasi (JS-804).' },
        { object: 'document', property: 'write', message: 'document.write dilarang (JS-804).' },
      ],

      // TS-xxx
      '@typescript-eslint/ban-ts-comment': [
        'error', // TS-103
        { 'ts-expect-error': 'allow-with-description', 'ts-ignore': true, 'ts-nocheck': true },
      ],
      '@typescript-eslint/no-explicit-any': 'error', // TS-201
      '@typescript-eslint/no-non-null-assertion': 'error', // TS-202
      '@typescript-eslint/consistent-type-assertions': [
        'error',
        { assertionStyle: 'as', objectLiteralTypeAssertions: 'never' },
      ], // TS-202
      '@typescript-eslint/explicit-module-boundary-types': 'error', // TS-203
      '@typescript-eslint/consistent-type-definitions': ['error', 'interface'], // TS-204
      '@typescript-eslint/consistent-type-imports': 'error', // TS-205
      '@typescript-eslint/switch-exhaustiveness-check': 'error', // TS-402
      '@typescript-eslint/prefer-optional-chain': 'error', // TS-501
      '@typescript-eslint/prefer-nullish-coalescing': 'error', // TS-501
      '@typescript-eslint/no-namespace': 'error', // TS-504
    },
  },

  // File JavaScript murni (konfigurasi build) tidak diperiksa dengan type information.
  {
    files: ['**/*.{js,mjs,cjs}'],
    ...tseslint.configs.disableTypeChecked,
  },
  {
    files: ['eslint.config.js'],
    rules: { 'no-restricted-exports': 'off' }, // file konfigurasi wajib default export
  },

  prettier,

  // eslint-config-prettier mematikan 'curly'; mode 'all' aman dipakai bersama Prettier.
  { rules: { curly: ['error', 'all'] } }, // JS-602
);
