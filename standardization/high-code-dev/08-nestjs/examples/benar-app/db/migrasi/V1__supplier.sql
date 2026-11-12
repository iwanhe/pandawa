-- NST-401: skema dikelola migrasi terversi (penamaan Flyway). Aplikasi tidak mengubah skema.
create table supplier (
   supplier_id   bigint generated always as identity primary key
 , kode          varchar(20)    not null
 , nama          varchar(100)   not null
 , kota          varchar(60)    not null
 , batas_kredit  numeric(18, 2) not null default 0
 , dibuat_pada   timestamptz    not null default now()
 , constraint supplier_kode_uk unique (kode)
);

-- NST-406: pesan ke sistem lain ditulis dalam transaksi yang sama dengan data bisnis.
create table outbox (
   outbox_id      bigint generated always as identity primary key
 , jenis          varchar(50)  not null
 , kunci_agregat  varchar(100) not null
 , muatan         jsonb        not null
 , status         varchar(20)  not null default 'BARU'
 , jumlah_coba    integer      not null default 0
 , dibuat_pada    timestamptz  not null default now()
);
create index outbox_n1 on outbox (status, outbox_id);

-- NST-407: kunci idempotensi disimpan di database, bukan di memori proses.
create table idempotensi (
   kunci        varchar(100) primary key
 , sidik        char(64)     not null
 , status_http  integer
 , respons      jsonb
 , dibuat_pada  timestamptz  not null default now()
);
