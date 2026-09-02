import React, { useEffect, useState } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { vaultApi } from '../api/client.js';
import { useAuth } from '../api/AuthContext.jsx';

const COMPANY_OPTIONS = [
  'NTI', 'NSTI', 'NCT', 'ATI', 'META', 'ORACONS', 'PRISMA', 'EAM', 'GLT', 'KDK', 'SKT_ATI',
];
const ENV_OPTIONS = ['DEV', 'UAT', 'PROD'];
const SYS_TYPE_OPTIONS = [
  'EBS_APP', 'APEX_WORKSPACE', 'DB_TNS', 'SSH', 'VPN', 'API_KEY', 'OTHER',
];

const EMPTY_FORM = {
  company_code: '',
  env_code: '',
  sys_type_code: '',
  label: '',
  url: '',
  host: '',
  port: '',
  service_name: '',
  instance_name: '',
  workspace_name: '',
  username: '',
  password: '',
  password_hint: '',
  tns_entry: '',
  ssh_auth_method: '',
  ssh_key_path: '',
  vpn_type: '',
  vpn_config_file: '',
  notes: '',
  expiry_date: '',
};

export default function AdminForm() {
  const { accessId } = useParams();
  const isEdit = Boolean(accessId);
  const [form, setForm] = useState(EMPTY_FORM);
  const [loading, setLoading] = useState(isEdit);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState('');
  const { user } = useAuth();
  const navigate = useNavigate();

  useEffect(() => {
    if (!isEdit) return;
    vaultApi
      .detail(accessId)
      .then((res) => {
        const d = res.data;
        setForm((f) => ({
          ...f,
          company_code: d.company_code,
          env_code: d.env_code,
          sys_type_code: d.sys_type_code,
          label: d.label,
          url: d.url || '',
          host: d.host || '',
          port: d.port || '',
          service_name: d.service_name || '',
          instance_name: d.instance_name || '',
          workspace_name: d.workspace_name || '',
          username: d.username || '',
          password: '', // password tidak di-prefill - kosongkan berarti tidak diubah
          password_hint: d.password_hint || '',
          ssh_auth_method: d.ssh_auth_method || '',
          vpn_type: d.vpn_type || '',
          notes: d.notes || '',
          expiry_date: d.expiry_date || '',
        }));
      })
      .catch((err) => setError(err.message))
      .finally(() => setLoading(false));
  }, [accessId, isEdit]);

  function update(field, value) {
    setForm((f) => ({ ...f, [field]: value }));
  }

  async function handleSubmit(e) {
    e.preventDefault();
    setSaving(true);
    setError('');
    try {
      const { username: accessUsername, ...rest } = form;
      await vaultApi.save({
        username: user.username,           // pelaku aksi (portal caller) - divalidasi role ADMIN
        access_username: accessUsername,   // username LOGIN untuk entri akses ini (mis. username EBS/SSH)
        access_id: isEdit ? Number(accessId) : null,
        ...rest,
        port: form.port ? Number(form.port) : null,
      });
      navigate('/');
    } catch (err) {
      setError(err.message);
    } finally {
      setSaving(false);
    }
  }

  if (loading) return <p>Memuat data...</p>;

  return (
    <div className="admin-form-page">
      <h2>{isEdit ? 'Edit Akses' : 'Tambah Akses Baru'}</h2>

      <form className="admin-form" onSubmit={handleSubmit}>
        <div className="form-row">
          <label>
            Company
            <select
              value={form.company_code}
              onChange={(e) => update('company_code', e.target.value)}
              required
            >
              <option value="">-- pilih --</option>
              {COMPANY_OPTIONS.map((c) => (
                <option key={c} value={c}>
                  {c}
                </option>
              ))}
            </select>
          </label>

          <label>
            Environment
            <select
              value={form.env_code}
              onChange={(e) => update('env_code', e.target.value)}
              required
            >
              <option value="">-- pilih --</option>
              {ENV_OPTIONS.map((c) => (
                <option key={c} value={c}>
                  {c}
                </option>
              ))}
            </select>
          </label>

          <label>
            Jenis Akses
            <select
              value={form.sys_type_code}
              onChange={(e) => update('sys_type_code', e.target.value)}
              required
            >
              <option value="">-- pilih --</option>
              {SYS_TYPE_OPTIONS.map((c) => (
                <option key={c} value={c}>
                  {c}
                </option>
              ))}
            </select>
          </label>
        </div>

        <label>
          Label
          <input
            type="text"
            value={form.label}
            onChange={(e) => update('label', e.target.value)}
            placeholder="mis. EBS Login NTI DEV"
            required
          />
        </label>

        <label>
          URL
          <input type="text" value={form.url} onChange={(e) => update('url', e.target.value)} />
        </label>

        <div className="form-row">
          <label>
            Host
            <input type="text" value={form.host} onChange={(e) => update('host', e.target.value)} />
          </label>
          <label>
            Port
            <input type="number" value={form.port} onChange={(e) => update('port', e.target.value)} />
          </label>
          <label>
            Service Name / SID
            <input
              type="text"
              value={form.service_name}
              onChange={(e) => update('service_name', e.target.value)}
            />
          </label>
        </div>

        <label>
          Workspace Name (khusus APEX)
          <input
            type="text"
            value={form.workspace_name}
            onChange={(e) => update('workspace_name', e.target.value)}
          />
        </label>

        <div className="form-row">
          <label>
            Username
            <input
              type="text"
              value={form.username}
              onChange={(e) => update('username', e.target.value)}
            />
          </label>
          <label>
            Password {isEdit && <span className="hint-inline">(kosongkan jika tidak diubah)</span>}
            <input
              type="password"
              value={form.password}
              onChange={(e) => update('password', e.target.value)}
              autoComplete="new-password"
            />
          </label>
        </div>

        <label>
          Password Hint (non-sensitif)
          <input
            type="text"
            value={form.password_hint}
            onChange={(e) => update('password_hint', e.target.value)}
            placeholder="mis. sama seperti akun email"
          />
        </label>

        {form.sys_type_code === 'DB_TNS' && (
          <label>
            TNS Entry
            <textarea
              rows={6}
              value={form.tns_entry}
              onChange={(e) => update('tns_entry', e.target.value)}
              placeholder="NTI_DEV=(DESCRIPTION=...)"
            />
          </label>
        )}

        {form.sys_type_code === 'SSH' && (
          <div className="form-row">
            <label>
              Auth Method
              <select
                value={form.ssh_auth_method}
                onChange={(e) => update('ssh_auth_method', e.target.value)}
              >
                <option value="">-- pilih --</option>
                <option value="PASSWORD">Password</option>
                <option value="PRIVATE_KEY">Private Key</option>
              </select>
            </label>
            <label>
              Path Private Key (jika pakai key)
              <input
                type="text"
                value={form.ssh_key_path}
                onChange={(e) => update('ssh_key_path', e.target.value)}
              />
            </label>
          </div>
        )}

        {form.sys_type_code === 'VPN' && (
          <div className="form-row">
            <label>
              VPN Type
              <input
                type="text"
                value={form.vpn_type}
                onChange={(e) => update('vpn_type', e.target.value)}
                placeholder="OpenVPN / GlobalProtect / WireGuard"
              />
            </label>
            <label>
              Nama File Config
              <input
                type="text"
                value={form.vpn_config_file}
                onChange={(e) => update('vpn_config_file', e.target.value)}
              />
            </label>
          </div>
        )}

        <label>
          Tanggal Expiry (opsional)
          <input
            type="date"
            value={form.expiry_date}
            onChange={(e) => update('expiry_date', e.target.value)}
          />
        </label>

        <label>
          Catatan
          <textarea
            rows={3}
            value={form.notes}
            onChange={(e) => update('notes', e.target.value)}
          />
        </label>

        {error && <p className="error-text">{error}</p>}

        <div className="form-actions">
          <button type="button" className="btn-secondary" onClick={() => navigate('/')}>
            Batal
          </button>
          <button type="submit" disabled={saving}>
            {saving ? 'Menyimpan...' : 'Simpan'}
          </button>
        </div>
      </form>
    </div>
  );
}
