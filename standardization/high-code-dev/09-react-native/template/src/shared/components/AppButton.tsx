import { ActivityIndicator, Pressable, StyleSheet, Text } from 'react-native';

import { colors, minTouchSize, radius, spacing, typography } from '../theme/theme';

/** Props tombol utama aplikasi. */
export interface AppButtonProps {
  readonly title: string;
  readonly onPress: () => void;
  readonly isDisabled?: boolean;
  readonly isLoading?: boolean;
  readonly testID?: string;
}

/**
 * Tombol standar (RN-203, RN-701). Memakai Pressable, punya peran aksesibilitas,
 * dan menyampaikan status nonaktif atau sedang memproses ke pembaca layar.
 */
export function AppButton({
  title,
  onPress,
  isDisabled = false,
  isLoading = false,
  testID,
}: AppButtonProps) {
  const isInactive = isDisabled || isLoading;

  return (
    <Pressable
      accessibilityRole="button"
      accessibilityState={{ disabled: isInactive, busy: isLoading }}
      disabled={isInactive}
      onPress={onPress}
      style={({ pressed }) => [
        styles.button,
        pressed && styles.buttonPressed,
        isInactive && styles.buttonDisabled,
      ]}
      testID={testID}
    >
      {isLoading ? (
        <ActivityIndicator color={colors.onPrimary} />
      ) : (
        <Text style={styles.title}>{title}</Text>
      )}
    </Pressable>
  );
}

const styles = StyleSheet.create({
  button: {
    minHeight: minTouchSize,
    borderRadius: radius.md,
    backgroundColor: colors.primary,
    alignItems: 'center',
    justifyContent: 'center',
    paddingHorizontal: spacing.md,
  },
  buttonPressed: {
    backgroundColor: colors.primaryPressed,
  },
  buttonDisabled: {
    backgroundColor: colors.disabled,
  },
  title: {
    ...typography.button,
    color: colors.onPrimary,
  },
});
