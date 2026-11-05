import { Component } from 'react';
import type { ErrorInfo, ReactNode } from 'react';
import { StyleSheet, Text, View } from 'react-native';

import { colors, spacing, typography } from '../theme/theme';
import { logError } from '../utils/logger';
import { AppButton } from './AppButton';

/** Props error boundary. */
export interface ErrorBoundaryProps {
  readonly children: ReactNode;
}

interface ErrorBoundaryState {
  readonly hasError: boolean;
}

/**
 * Error boundary akar aplikasi (RN-904, RCT-902). Tanpa ini, error saat render menutup aplikasi
 * di build rilis tanpa pesan apa pun bagi pengguna.
 * Class component adalah satu-satunya cara membuat error boundary (pengecualian RCT-201).
 */
export class ErrorBoundary extends Component<ErrorBoundaryProps, ErrorBoundaryState> {
  override state: ErrorBoundaryState = { hasError: false };

  static getDerivedStateFromError(): ErrorBoundaryState {
    return { hasError: true };
  }

  override componentDidCatch(error: Error, info: ErrorInfo): void {
    logError(`Error saat render: ${info.componentStack ?? ''}`, error);
  }

  private readonly handleRetry = (): void => {
    this.setState({ hasError: false });
  };

  override render(): ReactNode {
    if (!this.state.hasError) {
      return this.props.children;
    }
    return (
      <View style={styles.container}>
        <Text accessibilityRole="header" style={styles.title}>
          Terjadi kesalahan
        </Text>
        <Text style={styles.message}>Aplikasi mengalami masalah. Silakan coba lagi.</Text>
        <AppButton title="Coba lagi" onPress={this.handleRetry} />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    padding: spacing.lg,
    backgroundColor: colors.background,
  },
  title: {
    ...typography.title,
    color: colors.textPrimary,
    marginBottom: spacing.sm,
  },
  message: {
    ...typography.body,
    color: colors.textSecondary,
    marginBottom: spacing.lg,
  },
});
