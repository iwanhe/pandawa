/**
 * Design token aplikasi (RN-303). Warna, jarak, dan ukuran huruf hanya diambil dari sini;
 * StyleSheet tidak berisi literal warna.
 */
export const colors = {
  primary: '#1F3864',
  primaryPressed: '#16294A',
  onPrimary: '#FFFFFF',
  background: '#FFFFFF',
  surface: '#F5F6F8',
  border: '#D9DCE1',
  textPrimary: '#111827',
  textSecondary: '#4B5563',
  placeholder: '#6B7280',
  disabled: '#C7CBD1',
  danger: '#B42318',
  info: '#1D4ED8',
} as const;

export const spacing = {
  xs: 4,
  sm: 8,
  md: 16,
  lg: 24,
  xl: 32,
} as const;

export const typography = {
  title: { fontSize: 28, fontWeight: '700' },
  subtitle: { fontSize: 16, fontWeight: '400' },
  label: { fontSize: 14, fontWeight: '600' },
  body: { fontSize: 16, fontWeight: '400' },
  button: { fontSize: 16, fontWeight: '600' },
} as const;

export const radius = {
  md: 12,
} as const;

/** Tinggi minimum area sentuh (RN-702): 48 dp Android, 44 pt iOS. */
export const minTouchSize = 48;
