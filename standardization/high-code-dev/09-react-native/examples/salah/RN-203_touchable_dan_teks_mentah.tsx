// SALAH — diadaptasi dari src/screen/HomeScreen.tsx di boilerplate.
// Melanggar: RN-203 (TouchableOpacity), RN-206 (teks di luar <Text>), RN-302 (style tidak dipakai),
// RN-304 (array style satu elemen), RN-701 (tombol tanpa peran aksesibilitas).
import { StyleSheet, TouchableOpacity, View } from 'react-native';

export function HomeMenu() {
  return (
    <View style={[styles.container]}>
      <TouchableOpacity onPress={() => undefined}>Menu 1</TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1 },
  menuButton: { paddingVertical: 16 },
});
