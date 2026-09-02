import React, { useEffect, useState } from 'react';
import { vaultApi } from '../api/client.js';
import { useAuth } from '../api/AuthContext.jsx';

export default function AuditLog() {
  const [rows, setRows] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const { user } = useAuth();

  useEffect(() => {
    vaultApi
      .auditLog(user.username)
      .then((res) => setRows(res.rowset || []))
      .catch((err) => setError(err.message))
      .finally(() => setLoading(false));
  }, [user.username]);

  return (
    <div className="audit-page">
      <h2>Audit Log</h2>
      <p className="subtitle">200 aktivitas terakhir - siapa melihat/mengubah data akses</p>

      {loading && <p>Memuat...</p>}
      {error && <p className="error-text">{error}</p>}

      {!loading && !error && (
        <div className="grid-scroll">
          <table className="access-table">
            <thead>
              <tr>
                <th>Waktu</th>
                <th>User</th>
                <th>Aksi</th>
                <th>Entri Akses</th>
                <th>Detail</th>
                <th>IP</th>
              </tr>
            </thead>
            <tbody>
              {rows.map((r) => (
                <tr key={r.log_id}>
                  <td>{r.log_at}</td>
                  <td>{r.performed_by}</td>
                  <td>
                    <span className={`action-badge action-${r.action_type?.toLowerCase()}`}>
                      {r.action_type}
                    </span>
                  </td>
                  <td>{r.label || '-'}</td>
                  <td className="truncate">{r.detail}</td>
                  <td>{r.client_ip}</td>
                </tr>
              ))}
              {rows.length === 0 && (
                <tr>
                  <td colSpan={6} className="empty-row">
                    Belum ada aktivitas.
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
}
