// SALAH — diadaptasi dari src/services/authService.ts dan src/screen/Login.tsx di boilerplate.
// Melanggar: RN-503 (lapisan service menampilkan UI dan error mentah), RN-806 (respons berisi
// token dicetak ke log), RN-504 (respons API tidak divalidasi), TS-201 (any), JS-504 (error
// ditangani dua kali: Toast di service + Alert di layar).
import axios from 'axios';
import Toast from 'react-native-toast-message';

interface LoginResponse {
  access_token: string;
}

export class AuthServices {
  static async login(username: string, password: string): Promise<LoginResponse> {
    try {
      const response = await axios.post('/auth/login', { username, password });
      console.log('Login response:', response.data);
      return response.data;
    } catch (error: any) {
      Toast.show({ type: 'error', text1: 'Login Failed', text2: error.response?.data?.message });
      throw error;
    }
  }
}
