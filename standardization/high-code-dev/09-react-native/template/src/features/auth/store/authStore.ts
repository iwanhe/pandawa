import { create } from 'zustand';

import { logError } from '../../../shared/utils/logger';
import { login } from '../api/authApi';
import type { Credentials } from '../api/authApi';
import { saveRememberedUsername } from '../storage/rememberedUsername';
import { clearAccessToken, readAccessToken, saveAccessToken } from '../storage/tokenStorage';

/** Status sesi. 'loading' hanya saat sesi dipulihkan ketika aplikasi dibuka. */
export type AuthStatus = 'loading' | 'signedOut' | 'signedIn';

/** Alasan keluar terakhir, untuk menampilkan pesan yang tepat di layar login. */
export type SignOutReason = 'user' | 'expired';

/** State dan aksi autentikasi (RN-601). */
export interface AuthState {
  readonly status: AuthStatus;
  readonly accessToken: string | null;
  readonly signOutReason: SignOutReason | null;
  readonly restoreSession: () => Promise<void>;
  readonly signIn: (credentials: Credentials) => Promise<void>;
  readonly signOut: () => Promise<void>;
  readonly expireSession: () => void;
}

/**
 * Store autentikasi. Token disimpan di memori untuk dipakai request dan di Keychain/Keystore
 * untuk dipulihkan saat aplikasi dibuka ulang (RN-801). Status login tidak disimpan
 * terpisah dari token, agar keduanya tidak pernah berbeda.
 */
export const useAuthStore = create<AuthState>()((set, get) => ({
  status: 'loading',
  accessToken: null,
  signOutReason: null,

  async restoreSession() {
    try {
      const accessToken = await readAccessToken();
      set(
        accessToken === null
          ? { status: 'signedOut', accessToken: null }
          : { status: 'signedIn', accessToken },
      );
    } catch (error) {
      logError('Gagal memulihkan sesi.', error);
      set({ status: 'signedOut', accessToken: null });
    }
  },

  async signIn(credentials) {
    const { accessToken } = await login(credentials);
    await Promise.all([saveAccessToken(accessToken), saveRememberedUsername(credentials.username)]);
    set({ status: 'signedIn', accessToken, signOutReason: null });
  },

  async signOut() {
    set({ status: 'signedOut', accessToken: null, signOutReason: 'user' });
    await clearAccessToken();
  },

  expireSession() {
    if (get().status !== 'signedIn') {
      return;
    }
    set({ status: 'signedOut', accessToken: null, signOutReason: 'expired' });
    clearAccessToken().catch((error: unknown) => {
      logError('Gagal menghapus token yang kedaluwarsa.', error);
    });
  },
}));
