import React, { createContext, useContext, useState, useCallback } from 'react';
import { vaultApi } from './client.js';

const AuthContext = createContext(null);

export function AuthProvider({ children }) {
  const [user, setUser] = useState(() => {
    const saved = localStorage.getItem('vault_user');
    return saved ? JSON.parse(saved) : null;
  });

  const login = useCallback(async (username) => {
    const res = await vaultApi.whoami(username);
    const identity = { username: res.username, role: res.role };
    localStorage.setItem('vault_user', JSON.stringify(identity));
    setUser(identity);
    return identity;
  }, []);

  const logout = useCallback(() => {
    localStorage.removeItem('vault_user');
    setUser(null);
  }, []);

  const isAdmin = user?.role === 'ADMIN';

  return (
    <AuthContext.Provider value={{ user, login, logout, isAdmin }}>
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  const ctx = useContext(AuthContext);
  if (!ctx) throw new Error('useAuth harus dipakai di dalam <AuthProvider>');
  return ctx;
}
