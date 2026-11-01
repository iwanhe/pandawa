// Konfigurasi ESLint standar PANDAWA untuk React (ESLint flat config).
// = standar JS/TS (eslint.base.js, salinan dari folder 02) + aturan React.
// Komentar di samping rule menyebut ID aturan di Standar_ReactJS.xlsx.
//
// Pemakaian:   npx eslint . --max-warnings 0
// --max-warnings 0 membuat peringatan bawaan plugin ikut memblokir CI.

import eslintReact from '@eslint-react/eslint-plugin';
import jsxA11y from 'eslint-plugin-jsx-a11y';
import reactHooks from 'eslint-plugin-react-hooks';

import base from './eslint.base.js';

export default [
  ...base,

  // Aturan komponen, JSX, DOM, dan RSC (@eslint-react, preset strict + type information).
  { files: ['**/*.{ts,tsx}'], ...eslintReact.configs['strict-type-checked'] },
  // Aturan hooks memakai plugin resmi tim React; duplikatnya di @eslint-react dimatikan.
  reactHooks.configs.flat['recommended-latest'],
  {
    files: ['**/*.{ts,tsx}'],
    rules: {
      '@eslint-react/rules-of-hooks': 'off',
      '@eslint-react/exhaustive-deps': 'off',
      '@eslint-react/static-components': 'off',
      '@eslint-react/purity': 'off',
      '@eslint-react/set-state-in-effect': 'off',
      '@eslint-react/set-state-in-render': 'off',
      '@eslint-react/use-memo': 'off',
      '@eslint-react/unsupported-syntax': 'off',
      '@eslint-react/error-boundaries': 'off',
    },
  },
  // Aksesibilitas.
  jsxA11y.flatConfigs.recommended,

  {
    files: ['**/*.{ts,tsx}'],
    rules: {
      'react-hooks/rules-of-hooks': 'error', // RCT-301
      'react-hooks/exhaustive-deps': 'error', // RCT-302
      'react-hooks/set-state-in-effect': 'error', // RCT-303
      'react-hooks/immutability': 'error', // RCT-307
      'react-hooks/refs': 'error', // RCT-308
      'react-hooks/purity': 'error', // RCT-311
      'react-hooks/static-components': 'error', // RCT-106
      '@eslint-react/no-class-component': 'error', // RCT-201
      '@eslint-react/no-nested-component-definitions': 'error', // RCT-106
      '@eslint-react/no-leaked-conditional-rendering': 'error', // RCT-206
      '@eslint-react/no-missing-key': 'error', // RCT-408
      '@eslint-react/no-array-index-key': 'error', // RCT-408
      '@eslint-react/no-unstable-context-value': 'error', // RCT-404
      '@eslint-react/dom-no-dangerously-set-innerhtml': 'error', // RCT-801
      '@eslint-react/dom-no-script-url': 'error', // RCT-802
      '@eslint-react/dom-no-unsafe-target-blank': 'error', // RCT-804
      '@eslint-react/web-api-no-leaked-event-listener': 'error', // RCT-304
      '@eslint-react/web-api-no-leaked-interval': 'error', // RCT-304
      '@eslint-react/web-api-no-leaked-timeout': 'error', // RCT-304
    },
  },

  // RCT-202: tipe kembalian komponen (JSX) boleh diinferensi; TS-203 tetap berlaku untuk file .ts.
  {
    files: ['**/*.tsx'],
    rules: { '@typescript-eslint/explicit-module-boundary-types': 'off' },
  },

  // File konfigurasi alat wajib memakai default export.
  {
    files: ['eslint.config.js', 'eslint.base.js', 'vitest.config.ts'],
    rules: { 'no-restricted-exports': 'off' },
  },
];
