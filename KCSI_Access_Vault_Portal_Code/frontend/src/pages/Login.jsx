import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../api/AuthContext.jsx';

export default function Login() {
  const [username, setUsername] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const { login } = useAuth();
  const navigate = useNavigate();

  async function handleSubmit(e) {
    e.preventDefault();
    setError('');
    setLoading(true);
    try {
      await login(username.trim());
      navigate('/');
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="login-page">
      <form className="login-card" onSubmit={handleSubmit}>
        <h1>KCSI Access Vault Portal</h1>
        <p className="subtitle">Tim PANDAWA - IT Upstream Development</p>

        <label htmlFor="username">Username KCSI</label>
        <input
          id="username"
          type="text"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
          placeholder="mis. iwan.herdian"
          autoFocus
          required
        />

        {error && <p className="error-text">{error}</p>}

        <button type="submit" disabled={loading || !username.trim()}>
          {loading ? 'Memeriksa...' : 'Masuk'}
        </button>

        <p className="hint-text">
          Belum terdaftar? Hubungi admin Tim PANDAWA untuk didaftarkan sebagai
          VIEWER atau ADMIN.
        </p>
      </form>
    </div>
  );
}
