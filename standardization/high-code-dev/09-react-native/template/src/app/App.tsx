import { NavigationContainer } from '@react-navigation/native';
import { StrictMode } from 'react';
import { StatusBar } from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';
import Toast from 'react-native-toast-message';

import { RootNavigator } from '../navigation/RootNavigator';
import { ErrorBoundary } from '../shared/components/ErrorBoundary';

/**
 * Komponen akar (RN-101). Urutan provider: StrictMode → SafeArea → ErrorBoundary →
 * Navigation. Toast dipasang sekali di sini agar Toast.show berfungsi di seluruh layar.
 */
export function App() {
  return (
    <StrictMode>
      <SafeAreaProvider>
        <StatusBar barStyle="dark-content" />
        <ErrorBoundary>
          <NavigationContainer>
            <RootNavigator />
          </NavigationContainer>
        </ErrorBoundary>
        <Toast />
      </SafeAreaProvider>
    </StrictMode>
  );
}
