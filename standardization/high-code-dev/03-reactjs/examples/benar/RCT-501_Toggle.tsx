// RCT-501, RCT-404, RCT-503: compound components dengan context,
// hook yang memvalidasi provider, nilai context stabil, dan controlled props opsional.
import { createContext, use, useCallback, useMemo, useState } from 'react';
import type { ReactNode } from 'react';

interface ToggleContextValue {
  readonly isOn: boolean;
  readonly toggle: () => void;
}

const ToggleContext = createContext<ToggleContextValue | null>(null);

function useToggleContext(): ToggleContextValue {
  const context = use(ToggleContext);
  if (context === null) {
    throw new Error('Komponen Toggle harus dipakai di dalam <Toggle>.');
  }
  return context;
}

export interface ToggleProps {
  readonly children: ReactNode;
  readonly isOn?: boolean; // controlled bila diisi
  readonly onChange?: (isOn: boolean) => void;
}

export function Toggle({ children, isOn: isOnControlled, onChange }: ToggleProps) {
  const [isOnInternal, setIsOnInternal] = useState(false);
  const isOn = isOnControlled ?? isOnInternal;

  const toggle = useCallback(() => {
    const berikutnya = !isOn;
    if (isOnControlled === undefined) {
      setIsOnInternal(berikutnya);
    }
    onChange?.(berikutnya);
  }, [isOn, isOnControlled, onChange]);

  const value = useMemo(() => ({ isOn, toggle }), [isOn, toggle]);
  return <ToggleContext value={value}>{children}</ToggleContext>;
}

export function ToggleOn({ children }: { readonly children: ReactNode }) {
  const { isOn } = useToggleContext();
  return isOn ? children : null;
}

export function ToggleOff({ children }: { readonly children: ReactNode }) {
  const { isOn } = useToggleContext();
  return isOn ? null : children;
}

export function ToggleButton({ label }: { readonly label: string }) {
  const { isOn, toggle } = useToggleContext();
  return (
    <button type="button" aria-pressed={isOn} onClick={toggle}>
      {label}
    </button>
  );
}
