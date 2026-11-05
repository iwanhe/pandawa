import { createAsyncStorage } from '@react-native-async-storage/async-storage';

import { logWarning } from '../../../shared/utils/logger';

/**
 * Data non-rahasia boleh disimpan di AsyncStorage (RN-801). Username bukan kredensial;
 * password dan token tidak pernah disimpan di sini.
 */
const storage = createAsyncStorage('pandawa-app');
const usernameKey = 'auth.rememberedUsername';

/** Membaca username terakhir; null bila tidak ada atau storage gagal dibaca. */
export async function readRememberedUsername(): Promise<string | null> {
  try {
    return await storage.getItem(usernameKey);
  } catch {
    logWarning('Gagal membaca username tersimpan.');
    return null;
  }
}

/** Menyimpan username terakhir. Kegagalan tidak menghentikan proses login. */
export async function saveRememberedUsername(username: string): Promise<void> {
  try {
    await storage.setItem(usernameKey, username);
  } catch {
    logWarning('Gagal menyimpan username.');
  }
}
