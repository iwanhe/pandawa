import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { useEffect } from 'react';

import { LoginScreen } from '../features/auth/screens/LoginScreen';
import { useAuthStore } from '../features/auth/store/authStore';
import { HomeScreen } from '../features/home/screens/HomeScreen';
import { LoadingView } from '../shared/components/LoadingView';
import type { RootStackParamList } from './types';

const Stack = createNativeStackNavigator<RootStackParamList>();

/**
 * Navigator akar (RN-403). Layar yang tersedia ditentukan oleh status sesi, sehingga
 * pengguna yang belum login tidak dapat membuka layar terproteksi lewat navigasi.
 */
export function RootNavigator() {
  const status = useAuthStore((state) => state.status);
  const restoreSession = useAuthStore((state) => state.restoreSession);

  useEffect(() => {
    void restoreSession();
  }, [restoreSession]);

  if (status === 'loading') {
    return <LoadingView label="Memuat aplikasi..." />;
  }

  return (
    <Stack.Navigator screenOptions={{ headerShown: false }}>
      {status === 'signedIn' ? (
        <Stack.Screen name="Home" component={HomeScreen} />
      ) : (
        <Stack.Screen
          name="Login"
          component={LoginScreen}
          options={{ animationTypeForReplace: 'pop' }}
        />
      )}
    </Stack.Navigator>
  );
}
