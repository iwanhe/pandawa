import React, { useState } from 'react';
import { vaultApi } from '../api/client.js';
import { useAuth } from '../api/AuthContext.jsx';

/**
 * Menampilkan password ter-mask dengan tombol "Reveal" (khusus ADMIN).
 * Setiap reveal tercatat di audit log server-side.
 */
export default function RevealPassword({ accessId, maskedValue }) {
  const [revealed, setRevealed] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const { user, isAdmin } = useAuth();

  async function handleReveal() {
    setLoading(true);
    setError('');
    try {
      const res = await vaultApi.reveal(accessId, user.username);
      setRevealed(res.data.password);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }

  function handleCopy() {
    if (revealed) navigator.clipboard.writeText(revealed);
  }

  if (!isAdmin) {
    return <span className="password-masked">{maskedValue || '••••••••'}</span>;
  }

  return (
    <span className="reveal-wrapper">
      {revealed ? (
        <>
          <code className="password-plain">{revealed}</code>
          <button className="icon-btn" onClick={handleCopy} title="Salin">
            Salin
          </button>
          <button className="icon-btn" onClick={() => setRevealed(null)} title="Sembunyikan">
            Sembunyikan
          </button>
        </>
      ) : (
        <>
          <span className="password-masked">{maskedValue || '••••••••'}</span>
          <button className="icon-btn" onClick={handleReveal} disabled={loading}>
            {loading ? '...' : 'Reveal'}
          </button>
        </>
      )}
      {error && <span className="error-text-inline">{error}</span>}
    </span>
  );
}
