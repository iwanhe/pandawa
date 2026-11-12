# Kebijakan Keamanan (Security Policy)

> 🇬🇧 *In short:* do **not** open public issues for security problems. Report privately via GitHub → Security → *Report a vulnerability*. We acknowledge within 3 working days.

## Cakupan

| Komponen | Didukung |
|----------|:--------:|
| Branch `main` — script EBS, package PL/SQL, ORDS/REST | ✅ |
| Aplikasi APEX terbaru (FRITS, P-Track, Incident Tracking) | ✅ |
| Access Vault Portal (`KCSI_Access_Vault_Portal_Code/`) | ✅ |
| Isi folder `archive/` | ❌ |
| Skill pihak ketiga di `skills/` | ❌ — laporkan ke proyek asalnya |

## Melaporkan celah keamanan

**Jangan** laporkan lewat issue, pull request, atau diskusi publik.

1. Buka tab **Security** di repository ini → **Report a vulnerability** ([tautan langsung](https://github.com/iwanhe/pandawa/security/advisories/new)).
2. Sertakan:
   - komponen/file yang terdampak,
   - jenis celah (mis. SQL injection, XSS, URL tampering, kebocoran kredensial),
   - langkah reproduksi atau proof of concept,
   - dampak yang mungkin terjadi.
3. Jika fitur di atas tidak tersedia, hubungi maintainer [@iwanhe](https://github.com/iwanhe) secara pribadi melalui [LinkedIn](https://id.linkedin.com/in/iwanherdian).

## Yang bisa Anda harapkan

| Tahap | Target waktu |
|-------|--------------|
| Konfirmasi laporan diterima | 3 hari kerja |
| Penilaian awal & tingkat keparahan | 7 hari kerja |
| Perbaikan kritis / tinggi | secepatnya, lewat prosedur Emergency Change |
| Publikasi advisory | setelah perbaikan dirilis |

Kami akan mencantumkan nama pelapor di advisory bila yang bersangkutan berkenan.

## Kredensial yang bocor

Jika Anda menemukan password, wallet, token, atau data sensitif di repository ini, laporkan lewat jalur di atas. Jangan menggunakan kredensial tersebut.

## Praktik keamanan tim

- Aplikasi APEX dipindai dengan **APEX SERT** dan APEX Advisor sebelum UAT ([`apex-sert/`](https://github.com/iwanhe/pandawa/tree/main/apex-sert)).
- Checklist OWASP: `standardization/2026/` (OW010).
- Pencegahan SQL injection dengan bind variable dan `DBMS_ASSERT` sesuai [Oracle Dev Standards v1.1](https://github.com/iwanhe/pandawa/blob/main/oracle-dev-standards-v1.1.md).
