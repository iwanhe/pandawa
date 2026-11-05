// Konfigurasi ESLint standar PANDAWA untuk React Native (ESLint flat config).
// = standar JS/TS (eslint.base.mjs, salinan dari folder 02)
//   + aturan React yang berlaku di React Native (dari standar 03)
//   + aturan khusus React Native.
// Komentar di samping rule menyebut ID aturan di Standar_ReactNative.xlsx (RN-xxx)
// atau di standar 02/03 (JS-, TS-, RCT-).
//
// Pemakaian:   npx eslint . --max-warnings 0

import { fixupPluginRules } from '@eslint/compat';
import eslintReact from '@eslint-react/eslint-plugin';
import reactNativeCore from '@react-native/eslint-plugin';
import reactHooks from 'eslint-plugin-react-hooks';
import reactNative from 'eslint-plugin-react-native';
import globals from 'globals';

import base from './eslint.base.mjs';

export default [
  { ignores: ['android/**', 'ios/**', 'vendor/**', 'coverage/**', '.bundle/**'] },

  ...base,

  // Aturan komponen dan JSX (@eslint-react). Preset DOM dan Web API dimatikan:
  // React Native tidak memiliki DOM.
  { files: ['**/*.{ts,tsx}'], ...eslintReact.configs['strict-type-checked'] },
  { files: ['**/*.{ts,tsx}'], ...eslintReact.configs['disable-dom'] },
  { files: ['**/*.{ts,tsx}'], ...eslintReact.configs['disable-web-api'] },
  { files: ['**/*.{ts,tsx}'], ...eslintReact.configs['disable-rsc'] },

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

  {
    files: ['**/*.{ts,tsx}'],
    plugins: {
      // eslint-plugin-react-native 5.0 dan @react-native/eslint-plugin masih memakai API
      // ESLint lama (context.getSourceCode); fixupPluginRules menjembataninya ke ESLint 10.
      'react-native': fixupPluginRules(reactNative),
      '@react-native': fixupPluginRules(reactNativeCore),
    },
    rules: {
      // Aturan React (standar 03) yang tetap berlaku di React Native.
      'react-hooks/rules-of-hooks': 'error', // RCT-301
      'react-hooks/exhaustive-deps': 'error', // RCT-302
      'react-hooks/set-state-in-effect': 'error', // RCT-303
      'react-hooks/immutability': 'error', // RCT-307
      'react-hooks/refs': 'error', // RCT-308
      'react-hooks/purity': 'error', // RCT-311
      'react-hooks/static-components': 'error', // RCT-106
      '@eslint-react/no-class-component': 'error', // RCT-201 (pengecualian: ErrorBoundary)
      '@eslint-react/no-nested-component-definitions': 'error', // RCT-106
      '@eslint-react/no-leaked-conditional-rendering': 'error', // RCT-206, RN-206
      '@eslint-react/no-missing-key': 'error', // RCT-408
      '@eslint-react/no-array-index-key': 'error', // RCT-408
      '@eslint-react/no-unstable-context-value': 'error', // RCT-404

      // Aturan khusus React Native.
      'react-native/no-inline-styles': 'error', // RN-301
      'react-native/no-unused-styles': 'error', // RN-302
      'react-native/no-color-literals': 'error', // RN-303
      'react-native/no-single-element-style-arrays': 'error', // RN-304
      'react-native/no-raw-text': 'error', // RN-206
      'react-native/split-platform-components': 'error', // RN-207
      '@react-native/no-deep-imports': 'error', // RN-208
      '@react-native/platform-colors': 'error', // RN-303

      'no-restricted-imports': [
        'error',
        {
          paths: [
            {
              name: 'react-native',
              importNames: ['SafeAreaView'],
              message: 'Gunakan SafeAreaView dari react-native-safe-area-context (RN-204).',
            },
            {
              name: 'react-native',
              importNames: ['TouchableOpacity', 'TouchableHighlight', 'TouchableWithoutFeedback'],
              message: 'Gunakan Pressable atau komponen AppButton (RN-203).',
            },
            {
              name: 'react-navigation',
              message:
                'Paket lama (v4/v5) sudah deprecated. Gunakan @react-navigation/* v7 (RN-401).',
            },
            {
              name: 'react-test-renderer',
              message: 'Deprecated sejak React 19. Gunakan @testing-library/react-native (RN-901).',
            },
          ],
        },
      ],
      'no-restricted-syntax': [
        'error',
        {
          // Salinan aturan JS-311 dari eslint.base.mjs (no-restricted-syntax ditimpa, bukan digabung).
          selector: 'ForInStatement',
          message: 'Gunakan for...of, Object.keys/entries, atau method array (JS-311).',
        },
        {
          // RN-801: token dan kredensial tidak disimpan di AsyncStorage (tidak terenkripsi).
          selector:
            'CallExpression[callee.property.name=/^(setItem|setMany)$/] > Literal[value=/token|password|secret|credential/i]',
          message:
            'Token/kredensial wajib disimpan di Keychain/Keystore lewat tokenStorage (RN-801).',
        },
      ],
    },
  },

  // RN-305: StyleSheet.create diletakkan di akhir file komponen (konvensi React Native).
  // Pemakaian 'styles' di dalam fungsi komponen sebelum deklarasinya aman karena baru dievaluasi
  // saat render; pengecualian terbatas dari JS-103.
  {
    files: ['**/*.tsx'],
    rules: {
      '@typescript-eslint/no-use-before-define': ['error', { functions: false, variables: false }],
    },
  },

  // RCT-202: tipe kembalian komponen (JSX) boleh diinferensi; TS-203 tetap berlaku untuk file .ts.
  {
    files: ['**/*.tsx'],
    rules: { '@typescript-eslint/explicit-module-boundary-types': 'off' },
  },

  // Test dan setup Jest.
  {
    files: ['**/*.test.{ts,tsx}', 'jest.setup.ts'],
    languageOptions: { globals: globals.jest },
    rules: {
      'react-native/no-raw-text': 'off',
    },
  },

  // File konfigurasi alat React Native (Babel, Metro, Jest) wajib CommonJS dan default export.
  {
    files: ['*.config.js', 'index.js'],
    languageOptions: { sourceType: 'commonjs', globals: globals.node },
  },
  {
    files: ['*.config.js'],
    languageOptions: { sourceType: 'commonjs' },
    rules: { '@typescript-eslint/no-require-imports': 'off' },
  },
  {
    files: ['index.js'],
    languageOptions: { sourceType: 'module' },
  },
  {
    files: ['eslint.config.mjs', 'eslint.base.mjs'],
    rules: { 'no-restricted-exports': 'off' },
  },
];
