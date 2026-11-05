// SALAH — diadaptasi dari src/AppNavigator.tsx dan src/App.tsx di boilerplate.
// Melanggar: RN-301 (inline style), RN-303 (literal warna), RN-204 (SafeAreaView dari react-native),
// JS-505 (console.log), JS-610 (import tidak dipakai).
import { useEffect } from 'react';
import { ActivityIndicator, SafeAreaView, Text, View } from 'react-native';

export function SplashScreen() {
  console.log('booting');
  return (
    <SafeAreaView>
      <View style={{ flex: 1, justifyContent: 'center', backgroundColor: '#1317fc' }}>
        <ActivityIndicator size="large" color="#fff" />
        <Text style={{ marginTop: 10, fontSize: 18, color: '#fff' }}>SCANNER MOBILE APPLICATION</Text>
      </View>
    </SafeAreaView>
  );
}
