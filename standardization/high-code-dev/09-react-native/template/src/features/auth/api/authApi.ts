import { httpClient } from '../../../shared/api/httpClient';

/** Kredensial login. Hanya hidup di memori selama proses login. */
export interface Credentials {
  readonly username: string;
  readonly password: string;
}

/** Hasil login yang sudah divalidasi. */
export interface LoginResult {
  readonly accessToken: string;
}

interface LoginResponseBody {
  readonly access_token: string;
}

/** TS-207, RN-504: respons API divalidasi saat runtime sebelum dipakai. */
function isLoginResponseBody(value: unknown): value is LoginResponseBody {
  return (
    typeof value === 'object' &&
    value !== null &&
    'access_token' in value &&
    typeof value.access_token === 'string' &&
    value.access_token.length > 0
  );
}

/** Memanggil endpoint login. Error HTTP diteruskan ke pemanggil (ditangani sekali, JS-504). */
export async function login(credentials: Credentials, signal?: AbortSignal): Promise<LoginResult> {
  const response = await httpClient.post<unknown>('/auth/login', credentials, { signal });
  if (!isLoginResponseBody(response.data)) {
    throw new Error('Respons login dari server tidak sesuai format.');
  }
  return { accessToken: response.data.access_token };
}
