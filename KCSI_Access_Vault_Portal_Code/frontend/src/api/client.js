const ORDS_BASE_URL = import.meta.env.VITE_ORDS_BASE_URL;
const API_BASE = `${ORDS_BASE_URL}/api/vault`;

let cachedToken = null;
let cachedTokenExpiry = 0;

/**
 * Ambil OAuth2 access token lewat Netlify Function /.netlify/functions/token
 * (client_secret disimpan server-side, tidak pernah sampai ke browser)
 */
async function getAccessToken() {
  const now = Date.now();
  if (cachedToken && now < cachedTokenExpiry) {
    return cachedToken;
  }

  const resp = await fetch('/.netlify/functions/token', { method: 'POST' });
  if (!resp.ok) {
    throw new Error('Gagal mendapatkan access token');
  }
  const data = await resp.json();

  cachedToken = data.access_token;
  // beri buffer 30 detik sebelum expiry sesungguhnya
  cachedTokenExpiry = now + (data.expires_in - 30) * 1000;

  return cachedToken;
}

async function request(path, { method = 'GET', body } = {}) {
  const token = await getAccessToken();

  const resp = await fetch(`${API_BASE}${path}`, {
    method,
    headers: {
      Authorization: `Bearer ${token}`,
      'Content-Type': 'application/json',
    },
    body: body ? JSON.stringify(body) : undefined,
  });

  const data = await resp.json().catch(() => ({}));

  if (!resp.ok || data.status === 'ERROR') {
    throw new Error(data.message || `Request gagal (${resp.status})`);
  }

  return data;
}

export const vaultApi = {
  whoami: (username) => request('/auth/whoami', { method: 'POST', body: { username } }),

  list: ({ company, env, sysType, search } = {}) => {
    const params = new URLSearchParams();
    if (company) params.set('company', company);
    if (env) params.set('env', env);
    if (sysType) params.set('sys_type', sysType);
    if (search) params.set('search', search);
    return request(`/access/list?${params.toString()}`);
  },

  detail: (accessId) => request(`/access/detail/${accessId}`),

  reveal: (accessId, username) =>
    request(`/access/reveal/${accessId}`, { method: 'POST', body: { username } }),

  summary: () => request('/access/summary'),

  save: (payload) => request('/access/save', { method: 'POST', body: payload }), // payload wajib berisi `username`

  remove: (accessId, username) =>
    request(`/access/${accessId}`, { method: 'DELETE', body: { username } }),

  auditLog: (username, accessId) => {
    const params = new URLSearchParams({ username });
    if (accessId) params.set('access_id', accessId);
    return request(`/audit?${params.toString()}`);
  },
};
