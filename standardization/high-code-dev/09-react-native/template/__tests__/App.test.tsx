import { act, render, screen, userEvent } from '@testing-library/react-native';
import { AxiosError } from 'axios';
import type { AxiosAdapter } from 'axios';
import { getGenericPassword, setGenericPassword } from 'react-native-keychain';

import { App } from '../src/app/App';
import { bootstrapApp } from '../src/app/bootstrap';
import { useAuthStore } from '../src/features/auth/store/authStore';
import { httpClient } from '../src/shared/api/httpClient';

/** Server tiruan: user "budi" / "rahasia" berhasil login, selain itu 401. */
const fakeServer: AxiosAdapter = (config) => {
  const body: unknown = typeof config.data === 'string' ? JSON.parse(config.data) : null;
  const isValid =
    typeof body === 'object' &&
    body !== null &&
    'username' in body &&
    'password' in body &&
    body.username === 'budi' &&
    body.password === 'rahasia';
  const response = {
    data: isValid ? { access_token: 'token-uji' } : { message: 'Username atau password salah.' },
    status: isValid ? 200 : 401,
    statusText: '',
    headers: {},
    config,
  };
  if (!isValid) {
    return Promise.reject(new AxiosError('401', 'ERR_BAD_REQUEST', config, null, response));
  }
  return Promise.resolve(response);
};

describe('Alur login aplikasi', () => {
  beforeAll(() => {
    httpClient.defaults.adapter = fakeServer;
    bootstrapApp();
  });

  beforeEach(() => {
    useAuthStore.setState({ status: 'loading', accessToken: null, signOutReason: null });
  });

  it('menampilkan pesan validasi bila field kosong', async () => {
    const user = userEvent.setup();
    await render(<App />);

    await user.press(await screen.findByRole('button', { name: 'Masuk' }));

    expect(screen.getByText('Username wajib diisi.')).toBeOnTheScreen();
    expect(screen.getByText('Password wajib diisi.')).toBeOnTheScreen();
  });

  it('login berhasil membuka beranda dan menyimpan token di Keychain', async () => {
    const user = userEvent.setup();
    await render(<App />);

    await user.type(await screen.findByTestId('login-username'), 'budi');
    await user.type(screen.getByTestId('login-password'), 'rahasia');
    await user.press(screen.getByRole('button', { name: 'Masuk' }));

    expect(await screen.findByRole('header', { name: 'Beranda' })).toBeOnTheScreen();
    expect(await getGenericPassword({ service: 'pandawa.auth.accessToken' })).toMatchObject({
      password: 'token-uji',
    });

    await user.press(screen.getByRole('button', { name: 'Keluar' }));
    expect(await screen.findByRole('header', { name: 'Selamat datang' })).toBeOnTheScreen();
    expect(await getGenericPassword({ service: 'pandawa.auth.accessToken' })).toBe(false);
  });

  it('respons 401 saat sudah login mengakhiri sesi', async () => {
    await setGenericPassword('accessToken', 'token-lama', { service: 'pandawa.auth.accessToken' });
    await render(<App />);
    expect(await screen.findByRole('header', { name: 'Beranda' })).toBeOnTheScreen();

    await act(async () => {
      await httpClient.post('/auth/login', { username: 'x', password: 'y' }).catch(() => undefined);
    });

    expect(
      await screen.findByText('Sesi Anda telah berakhir. Silakan masuk kembali.'),
    ).toBeOnTheScreen();
  });
});
