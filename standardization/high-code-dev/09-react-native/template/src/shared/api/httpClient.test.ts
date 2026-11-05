import axios, { AxiosError, AxiosHeaders } from 'axios';
import type { AxiosAdapter, InternalAxiosRequestConfig } from 'axios';

import { installAuthInterceptors, toUserMessage } from './httpClient';

function createClient(status: number, captured: InternalAxiosRequestConfig[]) {
  const adapter: AxiosAdapter = (config) => {
    captured.push(config);
    const response = { data: {}, status, statusText: '', headers: {}, config };
    if (status >= 400) {
      return Promise.reject(new AxiosError('gagal', 'ERR_BAD_RESPONSE', config, null, response));
    }
    return Promise.resolve(response);
  };
  return axios.create({ baseURL: 'https://api.test.invalid', adapter });
}

describe('installAuthInterceptors', () => {
  it('menambahkan header Authorization dari token di memori', async () => {
    const captured: InternalAxiosRequestConfig[] = [];
    const client = createClient(200, captured);
    installAuthInterceptors(client, { getAccessToken: () => 'abc', onUnauthorized: jest.fn() });

    await client.get('/profil');

    expect(AxiosHeaders.from(captured[0]?.headers).get('Authorization')).toBe('Bearer abc');
  });

  it('memanggil onUnauthorized saat server membalas 401', async () => {
    const onUnauthorized = jest.fn();
    const client = createClient(401, []);
    installAuthInterceptors(client, { getAccessToken: () => null, onUnauthorized });

    await expect(client.get('/profil')).rejects.toBeInstanceOf(AxiosError);
    expect(onUnauthorized).toHaveBeenCalledTimes(1);
  });
});

describe('toUserMessage', () => {
  it('tidak menampilkan detail teknis untuk error yang tidak dikenal', () => {
    expect(toUserMessage(new TypeError('x is undefined'))).toBe(
      'Terjadi kesalahan. Silakan coba lagi.',
    );
  });
});
