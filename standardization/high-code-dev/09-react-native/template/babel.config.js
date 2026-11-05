// RN-802: variabel lingkungan disuntikkan saat build oleh react-native-dotenv.
// Hanya nama di allowlist yang boleh masuk bundle; nama yang tidak terdefinisi menggagalkan build.
// File yang dibaca: .env, lalu .env.<APP_ENV> (mis. APP_ENV=uat -> .env.uat). Jest memakai .env.test.
module.exports = {
  presets: ['module:@react-native/babel-preset'],
  plugins: [
    [
      'module:react-native-dotenv',
      {
        moduleName: '@env',
        path: '.env',
        envName: 'APP_ENV',
        allowlist: ['APP_ENV_NAME', 'API_BASE_URL', 'API_TIMEOUT_MS'],
        allowUndefined: false,
        quiet: true,
      },
    ],
  ],
};
