const { getDefaultConfig, mergeConfig } = require('@react-native/metro-config');

/**
 * Konfigurasi Metro. https://reactnative.dev/docs/metro
 *
 * @type {import('@react-native/metro-config').MetroConfig}
 */
const config = {};

module.exports = mergeConfig(getDefaultConfig(__dirname), config);
