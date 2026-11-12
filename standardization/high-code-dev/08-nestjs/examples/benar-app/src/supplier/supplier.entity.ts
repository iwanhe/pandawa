// NST-403: NUMERIC dipetakan ke string, tidak pernah ke number.
import { Column, CreateDateColumn, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity({ name: 'supplier' })
export class SupplierEntity {
  @PrimaryGeneratedColumn('identity', {
    name: 'supplier_id',
    type: 'bigint',
    generatedIdentity: 'ALWAYS',
  })
  supplierId!: string;

  @Column({ type: 'varchar', length: 20 })
  kode!: string;

  @Column({ type: 'varchar', length: 100 })
  nama!: string;

  @Column({ type: 'varchar', length: 60 })
  kota!: string;

  @Column({ name: 'batas_kredit', type: 'numeric', precision: 18, scale: 2 })
  batasKredit!: string;

  @CreateDateColumn({ name: 'dibuat_pada', type: 'timestamptz' })
  dibuatPada!: Date;
}
