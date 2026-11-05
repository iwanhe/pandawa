import { ActivityIndicator, StyleSheet, Text, View } from 'react-native';

import { colors, spacing, typography } from '../theme/theme';

/** Props tampilan memuat. */
export interface LoadingViewProps {
  readonly label: string;
}

/** Tampilan memuat satu layar penuh (RCT-904). */
export function LoadingView({ label }: LoadingViewProps) {
  return (
    <View accessibilityRole="progressbar" accessibilityLabel={label} style={styles.container}>
      <ActivityIndicator size="large" color={colors.primary} />
      <Text style={styles.label}>{label}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: colors.background,
  },
  label: {
    ...typography.body,
    color: colors.textSecondary,
    marginTop: spacing.md,
  },
});
