import React from 'react';
import { Outlet, Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../api/AuthContext.jsx';

export default function Layout() {
  const { user, logout, isAdmin } = useAuth();
  const navigate = useNavigate();

  function handleLogout() {
    logout();
    navigate('/login');
  }

  return (
    <div className="app-shell">
      <header className="topbar">
        <Link to="/" className="brand">
          KCSI Access Vault
        </Link>

        <nav className="topbar-nav">
          {isAdmin && (
            <>
              <Link to="/admin/new">+ Tambah Akses</Link>
              <Link to="/admin/audit">Audit Log</Link>
            </>
          )}
        </nav>

        <div className="topbar-user">
          <span className={`role-badge role-${user?.role?.toLowerCase()}`}>
            {user?.role}
          </span>
          <span className="username">{user?.username}</span>
          <button onClick={handleLogout} className="link-btn">
            Keluar
          </button>
        </div>
      </header>

      <main className="app-content">
        <Outlet />
      </main>
    </div>
  );
}
