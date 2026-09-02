import React from 'react';

const LABELS = {
  COMPLETE: 'Lengkap',
  PARTIAL: 'Sebagian',
  MISSING: 'Belum Ada',
};

export default function StatusBadge({ status }) {
  return (
    <span className={`status-badge status-${status?.toLowerCase()}`}>
      {LABELS[status] || status}
    </span>
  );
}
