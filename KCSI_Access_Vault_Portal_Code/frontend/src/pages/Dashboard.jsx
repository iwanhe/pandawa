import React, { useEffect, useState, useCallback } from 'react';
import { Link } from 'react-router-dom';
import { vaultApi } from '../api/client.js';
import { useAuth } from '../api/AuthContext.jsx';
import StatusBadge from '../components/StatusBadge.jsx';
import RevealPassword from '../components/RevealPassword.jsx';
import DetailModal from '../components/DetailModal.jsx';

const SYS_TYPE_OPTIONS = [
  { code: '', label: 'Semua Jenis Akses' },
  { code: 'EBS_APP', label: 'EBS Application' },
  { code: 'APEX_WORKSPACE', label: 'APEX Workspace' },
  { code: 'DB_TNS', label: 'Database TNS' },
  { code: 'SSH', label: 'SSH' },
  { code: 'VPN', label: 'VPN' },
  { code: 'API_KEY', label: 'API Key' },
  { code: 'OTHER', label: 'Lainnya' },
];

const ENV_OPTIONS = [
  { code: '', label: 'Semua Environment' },
  { code: 'DEV', label: 'DEV' },
  { code: 'UAT', label: 'UAT' },
  { code: 'PROD', label: 'PROD' },
];

export default function Dashboard() {
  const [summary, setSummary] = useState([]);
  const [rows, setRows] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [filters, setFilters] = useState({ company: '', env: '', sysType: '', search: '' });
  const [selectedId, setSelectedId] = useState(null);
  const { isAdmin, user } = useAuth();

  const loadData = useCallback(async () => {
    setLoading(true);
    setError('');
    try {
      const [summaryRes, listRes] = await Promise.all([
        vaultApi.summary(),
        vaultApi.list(filters),
      ]);
      setSummary(summaryRes.rowset || []);
      setRows(listRes.rowset || []);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }, [filters]);

  useEffect(() => {
    loadData();
  }, [loadData]);

  async function handleDelete(accessId) {
    if (!window.confirm('Hapus (nonaktifkan) entri akses ini?')) return;
    try {
      await vaultApi.remove(accessId, user.username);
      loadData();
    } catch (err) {
      alert(err.message);
    }
  }

  const missingCount = summary.filter((s) => s.completeness_status === 'MISSING').length;
  const partialCount = summary.filter((s) => s.completeness_status === 'PARTIAL').length;

  return (
    <div className="dashboard">
      <section className="summary-strip">
        <div className="summary-card">
          <span className="summary-number">{summary.length}</span>
          <span className="summary-label">Total kombinasi company × env × jenis</span>
        </div>
        <div className="summary-card summary-card-warn">
          <span className="summary-number">{partialCount}</span>
          <span className="summary-label">Sebagian lengkap</span>
        </div>
        <div className="summary-card summary-card-danger">
          <span className="summary-number">{missingCount}</span>
          <span className="summary-label">Belum ada data</span>
        </div>
      </section>

      <section className="completeness-grid">
        <h2>Kelengkapan Data per Company &amp; Environment</h2>
        <div className="grid-scroll">
          <table className="grid-table">
            <thead>
              <tr>
                <th>Company</th>
                <th>Env</th>
                <th>Jenis Akses</th>
                <th>Jumlah Entri</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
              {summary.map((s, i) => (
                <tr key={i}>
                  <td>{s.company_code}</td>
                  <td>{s.env_code}</td>
                  <td>{s.sys_type_code}</td>
                  <td>{s.total_entry}</td>
                  <td>
                    <StatusBadge status={s.completeness_status} />
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </section>

      <section className="access-list">
        <div className="list-header">
          <h2>Daftar Akses</h2>
          <div className="filter-bar">
            <input
              type="text"
              placeholder="Cari label / host / username..."
              value={filters.search}
              onChange={(e) => setFilters((f) => ({ ...f, search: e.target.value }))}
            />
            <select
              value={filters.env}
              onChange={(e) => setFilters((f) => ({ ...f, env: e.target.value }))}
            >
              {ENV_OPTIONS.map((o) => (
                <option key={o.code} value={o.code}>
                  {o.label}
                </option>
              ))}
            </select>
            <select
              value={filters.sysType}
              onChange={(e) => setFilters((f) => ({ ...f, sysType: e.target.value }))}
            >
              {SYS_TYPE_OPTIONS.map((o) => (
                <option key={o.code} value={o.code}>
                  {o.label}
                </option>
              ))}
            </select>
          </div>
        </div>

        {loading && <p>Memuat data...</p>}
        {error && <p className="error-text">{error}</p>}

        {!loading && !error && (
          <div className="grid-scroll">
            <table className="access-table">
              <thead>
                <tr>
                  <th>Label</th>
                  <th>Company</th>
                  <th>Env</th>
                  <th>Jenis</th>
                  <th>Host / URL</th>
                  <th>Username</th>
                  <th>Password</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                {rows.map((r) => (
                  <tr key={r.access_id}>
                    <td>
                      <button className="link-btn" onClick={() => setSelectedId(r.access_id)}>
                        {r.label}
                      </button>
                    </td>
                    <td>{r.company_code}</td>
                    <td>{r.env_code}</td>
                    <td>{r.sys_type_code}</td>
                    <td className="truncate">{r.host || r.url}</td>
                    <td>{r.username}</td>
                    <td>
                      <RevealPassword accessId={r.access_id} maskedValue={r.password_masked} />
                    </td>
                    <td className="row-actions">
                      {isAdmin && (
                        <>
                          <Link to={`/admin/edit/${r.access_id}`}>Edit</Link>
                          <button className="link-btn danger" onClick={() => handleDelete(r.access_id)}>
                            Hapus
                          </button>
                        </>
                      )}
                    </td>
                  </tr>
                ))}
                {rows.length === 0 && (
                  <tr>
                    <td colSpan={8} className="empty-row">
                      Tidak ada data untuk filter ini.
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>
        )}
      </section>

      {selectedId && (
        <DetailModal accessId={selectedId} onClose={() => setSelectedId(null)} />
      )}
    </div>
  );
}
