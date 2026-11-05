import { useEffect, useState } from 'react';
import { KeyboardAvoidingView, Platform, ScrollView, StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Toast from 'react-native-toast-message';

import { toUserMessage } from '../../../shared/api/httpClient';
import { AppButton } from '../../../shared/components/AppButton';
import { AppTextInput } from '../../../shared/components/AppTextInput';
import { colors, spacing, typography } from '../../../shared/theme/theme';
import { readRememberedUsername } from '../storage/rememberedUsername';
import { useAuthStore } from '../store/authStore';

interface FieldErrors {
  readonly username: string | null;
  readonly password: string | null;
}

const noFieldErrors: FieldErrors = { username: null, password: null };

function validate(username: string, password: string): FieldErrors {
  return {
    username: username.trim().length === 0 ? 'Username wajib diisi.' : null,
    password: password.length === 0 ? 'Password wajib diisi.' : null,
  };
}

/** Layar login (RN-205, RN-503, RN-701). */
export function LoginScreen() {
  const signIn = useAuthStore((state) => state.signIn);
  const signOutReason = useAuthStore((state) => state.signOutReason);
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [fieldErrors, setFieldErrors] = useState<FieldErrors>(noFieldErrors);
  const [isSubmitting, setIsSubmitting] = useState(false);

  // Mengisi username terakhir sekali saat layar dibuka; hasil diabaikan bila layar sudah ditutup.
  useEffect(() => {
    let isActive = true;
    readRememberedUsername()
      .then((savedUsername) => {
        if (isActive && savedUsername !== null) {
          setUsername((current) => (current.length === 0 ? savedUsername : current));
        }
      })
      .catch(() => {
        // readRememberedUsername sudah menangani dan mencatat error-nya sendiri.
      });
    return () => {
      isActive = false;
    };
  }, []);

  async function handleSubmit(): Promise<void> {
    const errors = validate(username, password);
    setFieldErrors(errors);
    if (errors.username !== null || errors.password !== null) {
      return;
    }

    setIsSubmitting(true);
    try {
      await signIn({ username: username.trim(), password });
    } catch (error) {
      Toast.show({ type: 'error', text1: 'Login gagal', text2: toUserMessage(error) });
      setPassword('');
      setIsSubmitting(false);
    }
  }

  return (
    <SafeAreaView edges={['top', 'bottom']} style={styles.safeArea}>
      <KeyboardAvoidingView
        behavior={Platform.OS === 'ios' ? 'padding' : undefined}
        style={styles.flex}
      >
        <ScrollView
          contentContainerStyle={styles.content}
          keyboardShouldPersistTaps="handled"
          showsVerticalScrollIndicator={false}
        >
          <View style={styles.header}>
            <Text accessibilityRole="header" style={styles.title}>
              Selamat datang
            </Text>
            <Text style={styles.subtitle}>Masuk untuk melanjutkan</Text>
          </View>

          {signOutReason === 'expired' ? (
            <Text accessibilityLiveRegion="polite" style={styles.notice}>
              Sesi Anda telah berakhir. Silakan masuk kembali.
            </Text>
          ) : null}

          <AppTextInput
            label="Username"
            value={username}
            onChangeText={setUsername}
            placeholder="Masukkan username"
            autoCapitalize="none"
            autoCorrect={false}
            autoComplete="username"
            textContentType="username"
            returnKeyType="next"
            editable={!isSubmitting}
            errorMessage={fieldErrors.username}
            testID="login-username"
          />
          <AppTextInput
            label="Password"
            value={password}
            onChangeText={setPassword}
            placeholder="Masukkan password"
            secureTextEntry
            autoCapitalize="none"
            autoCorrect={false}
            autoComplete="current-password"
            textContentType="password"
            returnKeyType="done"
            editable={!isSubmitting}
            errorMessage={fieldErrors.password}
            onSubmitEditing={() => {
              void handleSubmit();
            }}
            testID="login-password"
          />

          <AppButton
            title="Masuk"
            isLoading={isSubmitting}
            onPress={() => {
              void handleSubmit();
            }}
            testID="login-submit"
          />
        </ScrollView>
      </KeyboardAvoidingView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safeArea: {
    flex: 1,
    backgroundColor: colors.background,
  },
  flex: {
    flex: 1,
  },
  content: {
    flexGrow: 1,
    justifyContent: 'center',
    paddingHorizontal: spacing.lg,
    paddingVertical: spacing.xl,
  },
  header: {
    marginBottom: spacing.xl,
  },
  title: {
    ...typography.title,
    color: colors.textPrimary,
    marginBottom: spacing.sm,
  },
  subtitle: {
    ...typography.subtitle,
    color: colors.textSecondary,
  },
  notice: {
    ...typography.body,
    color: colors.info,
    marginBottom: spacing.md,
  },
});
