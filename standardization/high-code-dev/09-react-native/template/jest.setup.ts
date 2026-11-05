// Setup Jest (RN-902): modul native diganti mock agar test berjalan tanpa perangkat.

jest.mock('@react-native-async-storage/async-storage', () =>
  jest.requireActual<Record<string, unknown>>('@react-native-async-storage/async-storage/jest'),
);

// Mock resmi react-native-safe-area-context diekspor sebagai default export.
jest.mock(
  'react-native-safe-area-context',
  () =>
    jest.requireActual<{ default: Record<string, unknown> }>(
      'react-native-safe-area-context/jest/mock',
    ).default,
);

// Keychain/Keystore tiruan di memori. Bentuk fungsi mengikuti react-native-keychain 10.
jest.mock('react-native-keychain', () => {
  const store = new Map<string, string>();
  const serviceOf = (options?: { service?: string }): string => options?.service ?? 'default';
  return {
    ACCESSIBLE: { WHEN_UNLOCKED_THIS_DEVICE_ONLY: 'AccessibleWhenUnlockedThisDeviceOnly' },
    setGenericPassword: jest.fn(
      (_username: string, password: string, options?: { service?: string }) => {
        store.set(serviceOf(options), password);
        return Promise.resolve({ service: serviceOf(options), storage: 'KC' });
      },
    ),
    getGenericPassword: jest.fn((options?: { service?: string }) => {
      const password = store.get(serviceOf(options));
      return Promise.resolve(
        password === undefined
          ? false
          : { username: 'accessToken', password, service: serviceOf(options), storage: 'KC' },
      );
    }),
    resetGenericPassword: jest.fn((options?: { service?: string }) => {
      store.delete(serviceOf(options));
      return Promise.resolve(true);
    }),
  };
});
