// RCT-403, TS-402, RCT-307: useReducer dengan action bertipe (discriminated union),
// state diperbarui tanpa mutasi, switch exhaustive.
import { useReducer } from 'react';

export interface BarisPengajuan {
  readonly kodeItem: string;
  readonly qty: string;
}

export interface StatePengajuan {
  readonly baris: readonly BarisPengajuan[];
  readonly status: 'draft' | 'diajukan';
}

export type AksiPengajuan =
  | { readonly type: 'tambahBaris'; readonly baris: BarisPengajuan }
  | { readonly type: 'hapusBaris'; readonly kodeItem: string }
  | { readonly type: 'ajukan' };

export function pengajuanReducer(state: StatePengajuan, aksi: AksiPengajuan): StatePengajuan {
  switch (aksi.type) {
    case 'tambahBaris':
      return { ...state, baris: [...state.baris, aksi.baris] };
    case 'hapusBaris':
      return { ...state, baris: state.baris.filter((b) => b.kodeItem !== aksi.kodeItem) };
    case 'ajukan':
      return { ...state, status: 'diajukan' };
    default: {
      const tidakMungkin: never = aksi;
      return tidakMungkin;
    }
  }
}

const stateAwal: StatePengajuan = { baris: [], status: 'draft' };

export function usePengajuanReducer(): [StatePengajuan, (aksi: AksiPengajuan) => void] {
  return useReducer(pengajuanReducer, stateAwal);
}
