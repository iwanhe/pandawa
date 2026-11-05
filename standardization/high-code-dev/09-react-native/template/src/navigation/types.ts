/**
 * Daftar layar dan parameternya (RN-402). Satu sumber untuk tipe navigasi.
 *
 * React Navigation mensyaratkan type alias (bukan interface) karena param list harus
 * memenuhi Record<string, object | undefined>; pengecualian TS-204 dicatat di RN-402.
 */
// eslint-disable-next-line @typescript-eslint/consistent-type-definitions -- syarat React Navigation (RN-402)
export type RootStackParamList = {
  Login: undefined;
  Home: undefined;
};
