import React, { useEffect, useState } from 'react';
import { vaultApi } from '../api/client.js';
import RevealPassword from './RevealPassword.jsx';

export default function DetailModal({ accessId, onClose }) {
  const [data, setData] = useState(null);
  const [error, setError] = useState('');

  useEffect(() => {
    let cancelled = false;
    vaultApi
      .detail(accessId)
      .then((res) => {
        if (!cancelled) setData(res.data);
      })
      .catch((err) => !cancelled && setError(err.message));
    return () => {
      cancelled = true;
    };
  }, [accessId]);

  return (
    <div className="modal-backdrop" onClick={onClose}>
      <div className="modal-card" onClick={(e) => e.stopPropagation()}>
        <button className="modal-close" onClick={onClose}>
          &times;
        </button>

        {error && <p className="error-text">{error}</p>}
        {!data && !error && <p>Memuat...</p>}

        {data && (
          <>
            <h2>{data.label}</h2>
            <p className="modal-subtitle">
              {data.company_name} &middot; {data.env_code} &middot; {data.sys_type_name}
            </p>

            <dl className="detail-list">
              {data.url && (
                <>
                  <dt>URL</dt>
                  <dd>
                    <a href={data.url} target="_blank" rel="noreferrer">
                      {data.url}
                    </a>
                  </dd>
                </>
              )}
              {data.host && (
                <>
                  <dt>Host</dt>
                  <dd>
                    {data.host}
                    {data.port ? `:${data.port}` : ''}
                  </dd>
                </>
              )}
              {data.service_name && (
                <>
                  <dt>Service Name</dt>
                  <dd>{data.service_name}</dd>
                </>
              )}
              {data.workspace_name && (
                <>
                  <dt>Workspace</dt>
                  <dd>{data.workspace_name}</dd>
                </>
              )}
              {data.username && (
                <>
                  <dt>Username</dt>
                  <dd>{data.username}</dd>
                </>
              )}
              <dt>Password</dt>
              <dd>
                <RevealPassword accessId={data.access_id} maskedValue={data.password_masked} />
              </dd>
              {data.ssh_auth_method && (
                <>
                  <dt>SSH Auth Method</dt>
                  <dd>{data.ssh_auth_method}</dd>
                </>
              )}
              {data.vpn_type && (
                <>
                  <dt>VPN Type</dt>
                  <dd>{data.vpn_type}</dd>
                </>
              )}
              {data.expiry_date && (
                <>
                  <dt>Expiry</dt>
                  <dd>{data.expiry_date}</dd>
                </>
              )}
              {data.notes && (
                <>
                  <dt>Catatan</dt>
                  <dd>{data.notes}</dd>
                </>
              )}
              <dt>Terakhir Diubah</dt>
              <dd>
                {data.updated_by || data.created_by} &middot; {data.updated_at || data.created_at}
              </dd>
            </dl>
          </>
        )}
      </div>
    </div>
  );
}
