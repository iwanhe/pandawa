// SALAH — diadaptasi dari src/store/authStore.tsx dan src/config/axiosInstance.ts di boilerplate.
// Melanggar: RN-801 (token di AsyncStorage tanpa enkripsi), RN-601 (status login disimpan terpisah
// dari token), TS-201 (any), JS-402 (promise dibiarkan).
import AsyncStorage from '@react-native-async-storage/async-storage';
import { create } from 'zustand';

interface AuthState {
  isAuthenticated: boolean;
  accessToken: string | null;
  setToken: (token: string) => void;
}

export const useAuthStore = create<AuthState>((set) => ({
  isAuthenticated: false,
  accessToken: null,
  setToken: async (accessToken) => {
    await AsyncStorage.setItem('accessToken', accessToken);
    set({ accessToken });
  },
}));

export const loadAuthState = async (set: any) => {
  const savedToken = await AsyncStorage.getItem('accessToken');
  if (savedToken) {
    set({ accessToken: savedToken });
  }
};

export function clearAuth(): void {
  AsyncStorage.removeItem('accessToken');
}
