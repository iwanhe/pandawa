import {
  ACCESSIBLE,
  getGenericPassword,
  resetGenericPassword,
  setGenericPassword,
} from 'react-native-keychain';

/**
 * Penyimpanan token di Keychain (iOS) / Keystore (Android) (RN-801).
 * AsyncStorage tidak dipakai untuk token karena tidak terenkripsi.
 */
const keychainService = 'pandawa.auth.accessToken';
const keychainAccount = 'accessToken';

/** Menyimpan access token; gagal bila penyimpanan aman tidak tersedia. */
export async function saveAccessToken(token: string): Promise<void> {
  const result = await setGenericPassword(keychainAccount, token, {
    service: keychainService,
    accessible: ACCESSIBLE.WHEN_UNLOCKED_THIS_DEVICE_ONLY,
  });
  if (result === false) {
    throw new Error('Gagal menyimpan token ke penyimpanan aman.');
  }
}

/** Membaca access token; null bila belum ada. */
export async function readAccessToken(): Promise<string | null> {
  const credentials = await getGenericPassword({ service: keychainService });
  if (credentials === false || credentials.password.length === 0) {
    return null;
  }
  return credentials.password;
}

/** Menghapus access token dari penyimpanan aman. */
export async function clearAccessToken(): Promise<void> {
  await resetGenericPassword({ service: keychainService });
}
