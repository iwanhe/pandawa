import React from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import { AuthProvider, useAuth } from './api/AuthContext.jsx';
import Login from './pages/Login.jsx';
import Dashboard from './pages/Dashboard.jsx';
import AdminForm from './pages/AdminForm.jsx';
import AuditLog from './pages/AuditLog.jsx';
import Layout from './components/Layout.jsx';

function RequireAuth({ children }) {
  const { user } = useAuth();
  if (!user) return <Navigate to="/login" replace />;
  return children;
}

function RequireAdmin({ children }) {
  const { isAdmin } = useAuth();
  if (!isAdmin) return <Navigate to="/" replace />;
  return children;
}

export default function App() {
  return (
    <AuthProvider>
      <Routes>
        <Route path="/login" element={<Login />} />
        <Route
          path="/"
          element={
            <RequireAuth>
              <Layout />
            </RequireAuth>
          }
        >
          <Route index element={<Dashboard />} />
          <Route
            path="admin/new"
            element={
              <RequireAdmin>
                <AdminForm />
              </RequireAdmin>
            }
          />
          <Route
            path="admin/edit/:accessId"
            element={
              <RequireAdmin>
                <AdminForm />
              </RequireAdmin>
            }
          />
          <Route
            path="admin/audit"
            element={
              <RequireAdmin>
                <AuditLog />
              </RequireAdmin>
            }
          />
        </Route>
      </Routes>
    </AuthProvider>
  );
}
