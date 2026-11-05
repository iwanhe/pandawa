import { StyleSheet, Text, TextInput, View } from 'react-native';
import type { TextInputProps } from 'react-native';

import { colors, minTouchSize, radius, spacing, typography } from '../theme/theme';

/** Props input teks standar. Atribut TextInput yang diteruskan dibatasi secara eksplisit. */
export interface AppTextInputProps extends Pick<
  TextInputProps,
  | 'autoCapitalize'
  | 'autoComplete'
  | 'autoCorrect'
  | 'editable'
  | 'onChangeText'
  | 'onSubmitEditing'
  | 'placeholder'
  | 'returnKeyType'
  | 'secureTextEntry'
  | 'testID'
  | 'textContentType'
  | 'value'
> {
  readonly label: string;
  readonly errorMessage?: string | null;
}

/**
 * Input teks dengan label yang terlihat dan terbaca pembaca layar (RN-701),
 * serta pesan error di bawah field.
 */
export function AppTextInput({ label, errorMessage = null, ...inputProps }: AppTextInputProps) {
  const hasError = errorMessage !== null;

  return (
    <View style={styles.wrapper}>
      <Text style={styles.label}>{label}</Text>
      <TextInput
        {...inputProps}
        accessibilityLabel={label}
        accessibilityHint={hasError ? errorMessage : undefined}
        placeholderTextColor={colors.placeholder}
        style={[styles.input, hasError && styles.inputError]}
      />
      {hasError ? (
        <Text accessibilityLiveRegion="polite" style={styles.error}>
          {errorMessage}
        </Text>
      ) : null}
    </View>
  );
}

const styles = StyleSheet.create({
  wrapper: {
    marginBottom: spacing.md,
  },
  label: {
    ...typography.label,
    color: colors.textSecondary,
    marginBottom: spacing.xs,
  },
  input: {
    ...typography.body,
    minHeight: minTouchSize,
    borderRadius: radius.md,
    borderWidth: 1,
    borderColor: colors.border,
    backgroundColor: colors.surface,
    color: colors.textPrimary,
    paddingHorizontal: spacing.md,
  },
  inputError: {
    borderColor: colors.danger,
  },
  error: {
    color: colors.danger,
    marginTop: spacing.xs,
  },
});
