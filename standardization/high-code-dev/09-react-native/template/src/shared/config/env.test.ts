import { parseEnv } from './env';

describe('parseEnv', () => {
  it('menerima konfigurasi https yang valid', () => {
    expect(
      parseEnv({ name: 'prod', apiBaseUrl: 'https://api.example.co.id', apiTimeoutMs: '15000' }),
    ).toEqual({ name: 'prod', apiBaseUrl: 'https://api.example.co.id', apiTimeoutMs: 15000 });
  });

  it('menolak http di luar lingkungan dev', () => {
    expect(() =>
      parseEnv({ name: 'uat', apiBaseUrl: 'http://api.example.co.id', apiTimeoutMs: '15000' }),
    ).toThrow('wajib memakai https://');
  });

  it('menolak nama lingkungan dan timeout yang tidak valid', () => {
    expect(() =>
      parseEnv({ name: 'staging', apiBaseUrl: 'https://a.b', apiTimeoutMs: '15000' }),
    ).toThrow('APP_ENV_NAME tidak dikenal');
    expect(() => parseEnv({ name: 'dev', apiBaseUrl: 'https://a.b', apiTimeoutMs: 'abc' })).toThrow(
      'API_TIMEOUT_MS',
    );
  });
});
