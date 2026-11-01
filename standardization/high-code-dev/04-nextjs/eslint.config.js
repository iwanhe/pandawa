// Konfigurasi ESLint standar PANDAWA untuk Next.js (ESLint flat config).
// = standar JS/TS (eslint.base.js, salinan dari folder 02)
//   + blok React (salinan dari 03-reactjs/eslint.config.js)
//   + aturan @next/next core-web-vitals.
// Komentar di samping rule menyebut ID aturan di Standar_NextJS.xlsx atau Standar_ReactJS.xlsx.
//
// Pemakaian:   npx eslint . --max-warnings 0
// Next.js 16 tidak lagi menyediakan `next lint`; jalankan ESLint langsung (NXT-701).

import eslintReact from '@eslint-react/eslint-plugin';
import nextPlugin from '@next/eslint-plugin-next';
import jsxA11y from 'eslint-plugin-jsx-a11y';
import reactHooks from 'eslint-plugin-react-hooks';

import base from './eslint.base.js';

export default [
  { ignores: ['**/.next/**', '**/next-env.d.ts', 'out/**'] },
  ...base,

  // ---- Blok React (salinan dari standar 03) ----
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

  // ---- Next.js ----
  {
    files: ['**/*.{ts,tsx}'],
    plugins: { '@next/next': nextPlugin },
    settings: { next: { rootDir: 'examples/benar-app/' } },
    rules: {
      ...nextPlugin.configs['core-web-vitals'].rules,
      '@next/next/no-html-link-for-pages': 'error', // NXT-105
      '@next/next/no-img-element': 'error', // NXT-601
      '@next/next/no-sync-scripts': 'error', // NXT-603
      '@next/next/no-async-client-component': 'error', // NXT-201
    },
  },

  // NXT-104: default export hanya di file konvensi Next.js dan file konfigurasi alat.
  {
    files: [
      '**/app/**/{page,layout,template,loading,error,global-error,not-found,global-not-found,default,forbidden,unauthorized}.tsx',
      '**/app/**/{opengraph-image,twitter-image,icon,apple-icon,sitemap,robots,manifest}.{ts,tsx}',
      '**/{proxy,instrumentation}.ts',
      '**/next.config.ts',
      'eslint.config.js',
      'eslint.base.js',
    ],
    rules: { 'no-restricted-exports': 'off' },
  },
];
