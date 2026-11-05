import Toast from 'react-native-toast-message';
import { StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { AppButton } from '../../../shared/components/AppButton';
import { colors, spacing, typography } from '../../../shared/theme/theme';
import { logError } from '../../../shared/utils/logger';
import { useAuthStore } from '../../auth/store/authStore';

/** Contoh menu beranda. Ganti dengan menu aplikasi yang sebenarnya. */
const menus = [
  { id: 'menu-1', title: 'Menu 1' },
  { id: 'menu-2', title: 'Menu 2' },
] as const;

/** Layar beranda setelah login. */
export function HomeScreen() {
  const signOut = useAuthStore((state) => state.signOut);

  function handleMenuPress(title: string): void {
    Toast.show({ type: 'info', text1: title, text2: 'Fitur belum tersedia di template.' });
  }

  async function handleSignOut(): Promise<void> {
    try {
      await signOut();
    } catch (error) {
      logError('Gagal keluar.', error);
    }
  }

  return (
    <SafeAreaView edges={['top', 'bottom']} style={styles.container}>
      <Text accessibilityRole="header" style={styles.title}>
        Beranda
      </Text>
      <View style={styles.menuList}>
        {menus.map((menu) => (
          <View key={menu.id} style={styles.menuItem}>
            <AppButton
              title={menu.title}
              onPress={() => {
                handleMenuPress(menu.title);
              }}
            />
          </View>
        ))}
      </View>
      <AppButton
        title="Keluar"
        onPress={() => {
          void handleSignOut();
        }}
        testID="home-sign-out"
      />
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: spacing.lg,
    backgroundColor: colors.background,
  },
  title: {
    ...typography.title,
    color: colors.textPrimary,
    marginBottom: spacing.lg,
  },
  menuList: {
    flex: 1,
  },
  menuItem: {
    marginBottom: spacing.md,
  },
});
