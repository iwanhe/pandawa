# APEX-SERT Version 5.1 - Panduan Lengkap

## Daftar Isi

1. [Tentang APEX-SERT](#tentang-apex-sert)
2. [Konvensi Dokumen](#konvensi-dokumen)
3. [Terminologi Keamanan](#terminologi-keamanan)
4. [Memulai APEX-SERT](#memulai-apex-sert)
5. [Navigasi dan Interface](#navigasi-dan-interface)
6. [Klasifikasi Keamanan](#klasifikasi-keamanan)
7. [Evaluasi Aplikasi](#evaluasi-aplikasi)
8. [Sistem Scoring dan Exception](#sistem-scoring-dan-exception)
9. [Notasi](#notasi)
10. [Laporan (Reports)](#laporan-reports)
11. [Preferensi](#preferensi)
12. [Penjadwalan Evaluasi](#penjadwalan-evaluasi)
13. [Administrasi](#administrasi)
14. [Best Practices](#best-practices-keseluruhan)
15. [Troubleshooting](#troubleshooting)
16. [Appendix](#appendix)

---

## Tentang APEX-SERT

### Pengenalan

**APEX-SERT** (APEX Security Evaluation and Recommendation Tool) adalah aplikasi APEX gratis yang dikembangkan oleh Oracle untuk mengevaluasi kerentanan keamanan pada aplikasi Oracle Application Express (APEX).

### Audience

Panduan ini ditujukan untuk:
- APEX Application Developers
- Development Managers
- Security Teams
- APEX Administrators
- Siapa saja dengan peran serupa dalam pengembangan APEX

---

## Konvensi Dokumen

### Typeset Conventions

Dokumen ini menggunakan konvensi penulisan berikut:

**Plain Text**
- Text narrative standar
- Tidak ada action khusus yang diperlukan

**Fixed Width** 
```
Fixed width digunakan untuk input dari user
Text dalam font ini harus dimasukkan ke field atau region
```

**Bold**
- Digunakan untuk menunjukkan action
- Contoh: klik link, tekan tombol
- Corresponds ke value dari Bold text

**Bold Underline**
- Merujuk ke label atau section dari page
- Menandakan WHERE action harus terjadi
- Bukan action itu sendiri

### Fokus Keamanan

**Catatan Penting**: APEX-SERT berfokus pada **keamanan tingkat aplikasi** (application level security).

Area keamanan lain yang juga sangat penting tetapi TIDAK dicakup oleh APEX-SERT:
- **Application Server Security**: Konfigurasi dan hardening web server
- **Firewall Configuration**: Network security dan filtering
- **Database Security**: Database-level security settings
- **APEX Instance Level Settings**: Workspace dan instance configuration

Area-area ini harus ditangani secara terpisah sebagai bagian dari strategi keamanan menyeluruh.

### Filosofi Keamanan

> **"Security is hard. If it's not, then you're probably not doing it right."**

Realita keamanan modern:
- Companies dari semua ukuran mengalami security breaches
- Major manufacturers dan credit card issuers di-hack
- Federal employees dengan excessive privileges membocorkan data
- Berita dipenuhi dengan contoh security compromises

**Tujuan APEX-SERT dan Panduan Ini**:
- Memahami potential security risks dalam APEX applications
- Mengidentifikasi vulnerabilities
- Memberikan guidance untuk mitigasi risks
- Meningkatkan security posture secara sistematis

**Pentingnya Security**:
Perusahaan yang "seharusnya tahu lebih baik" masih mengalami security compromises yang sangat public. APEX-SERT membantu Anda menghindari menjadi headline berita negatif berikutnya.

---

## Terminologi Keamanan

### 1. Authentication (Autentikasi)

**Definisi**: Proses "login" ke dalam aplikasi.

**Di APEX**:
- Menentukan halaman mana yang memerlukan user login
- Setting yang salah dapat membiarkan user tidak terautentikasi mengakses data sensitif
- Merupakan lapisan keamanan paling dasar

**Best Practice**:
- Gunakan authentication schemes bawaan APEX
- Terapkan strong password policies
- Gunakan HTTPS untuk semua autentikasi
- Implementasikan account lockout setelah failed login attempts

### 2. Authorization (Otorisasi)

**Definisi**: Lapisan di bawah authentication yang mengatur akses user yang sudah login.

**Di APEX**:
- Authorization schemes dapat diterapkan di berbagai level:
  - Page level
  - Region level
  - Item level
  - Column level dalam report
- Memungkinkan pembatasan akses data spesifik hanya untuk user yang berwenang

**Best Practice**:
- Implementasikan authorization schemes untuk setiap page
- Gunakan Access Control Lists
- Terapkan Principle of Least Privilege
- Regular review user privileges

### 3. SQL Injection

**Definisi**: Teknik injeksi kode yang mengeksploitasi kerentanan pada database layer aplikasi.

**Di APEX, SQL Injection dapat terjadi melalui**:
1. Penggunaan notasi `&ITEM.` dalam SQL statement
2. Pemanggilan `DBMS_SQL` yang menggunakan user input
3. Pemanggilan `EXECUTE IMMEDIATE` yang menggunakan user input

**Contoh Kerentanan**:

```sql
-- VULNERABLE CODE
SELECT COUNT(*) FROM users
WHERE username = '&USERNAME.'
AND password = '&PASSWORD.'
```

Jika user memasukkan password: `i_dont_know' OR 'x' = 'x`

SQL yang dieksekusi menjadi:
```sql
SELECT COUNT(*) FROM users
WHERE username = 'SCOTT'
AND password = 'i_dont_know' OR 'x' = 'x'
```

Ini akan mengembalikan 1 (true) dan membiarkan user login!

**Solusi: Gunakan Bind Variables**:

```sql
-- SECURE CODE
SELECT COUNT(*) FROM users
WHERE username = :USERNAME
AND password = :PASSWORD
```

Dengan bind variables, input `i_dont_know' OR 'x' = 'x` akan diperlakukan sebagai literal string, bukan bagian dari SQL.

### 4. Cross-Site Scripting (XSS)

**Definisi**: Kerentanan yang memungkinkan attacker menyuntikkan client-side script (seperti JavaScript) ke halaman web.

**Risiko XSS**:
- Bypass access control
- Expose cookie information
- Capture dan kirim data ke situs lain
- Session hijacking

**Contoh Kerentanan**:

User memasukkan dalam field COMMENT:
```html
<script type="text/javascript">
alert('Hello world');
</script>
```

Jika data ditampilkan kembali tanpa escape yang tepat, JavaScript akan dieksekusi.

**Solusi**:
- Escape semua user input saat ditampilkan
- Gunakan proper display types di APEX
- Validasi dan sanitasi input
- Implementasikan Content Security Policy

### 5. URL Tampering

**Definisi**: Manipulasi URL untuk mengakses data yang tidak seharusnya dapat diakses.

**Bahaya**:
- Tidak memerlukan skill programming
- Mudah dilakukan oleh siapa saja
- Banyak developer tidak terlatih untuk melindungi dari serangan ini

**Contoh Kerentanan**:

```
http://server/apex/f?p=134:10:24612647691::NO::P10_ATTRIBUTE_ID:83
```

User dapat dengan mudah mengubah nilai `P10_ATTRIBUTE_ID` menjadi `84`, `85`, dll. dan berpotensi melihat data yang tidak diotorisasi.

**Solusi**:
- Implementasikan Session State Protection
- Gunakan checksums untuk operasi sensitif
- Validasi authorization untuk setiap item yang diakses
- Implementasikan proper page authorization

---

## Memulai APEX-SERT

### Cara Meluncurkan APEX-SERT

#### Metode Peluncuran

1. **Dari APEX Development Environment**:
   - Login ke APEX Builder sebagai workspace developer atau administrator
   - Cari **System Messages window** (tersedia di seluruh APEX development environment)
   - Klik link **"Launch APEX-SERT"**
   
2. **Keuntungan Integrated Launch**:
   - **Tidak perlu re-enter credentials**
   - APEX-SERT securely verify authentication Anda
   - Automatic workspace detection
   - APEX-SERT terbuka di **tab browser baru**
   - Session tetap terkoneksi dengan APEX Builder

3. **Tampilan Awal**:
   - Pada **peluncuran pertama**, home page akan terlihat sparse (minimal)
   - Belum ada data karena evaluasi belum dijalankan
   - Tidak ada metrics atau history
   
4. **Setelah Penggunaan**:
   - Home page akan populate dengan data
   - Metrics tentang evaluations
   - Exception statistics
   - Recent activity history
   - Score trends

#### Screenshot Tampilan

Setelah klik "Launch APEX-SERT", Anda akan melihat:
- Clean interface dengan navigation tabs di atas
- Sidebar di kiri (pada home page dan evaluation pages)
- Main content area di tengah
- Ready untuk memulai evaluasi pertama

### Menjalankan Evaluasi Pertama

#### Quick Start Evaluation

Dari Home Page, Anda dapat langsung memulai evaluasi:

1. **Select Workspace**
   - Dropdown list menampilkan workspaces yang accessible
   - Pilih workspace yang berisi aplikasi yang ingin dievaluasi

2. **Select Application** 
   - Dropdown populate berdasarkan workspace yang dipilih
   - Menampilkan semua applications dalam workspace
   - Pilih application untuk dievaluasi

3. **Select Attribute Set**
   - Default: **DEFAULT** attribute set
   - DEFAULT set berisi ~150 attributes
   - Custom attribute sets (jika ada) juga available
   
4. **Klik Evaluate Button**
   - Evaluation process mulai immediately
   - Progress indicator muncul
   - Wait untuk completion

#### Durasi Evaluasi

**Faktor yang Mempengaruhi**:
- **Ukuran Aplikasi**: 
  - Small apps (< 10 pages): Beberapa detik
  - Medium apps (10-50 pages): 30 detik - 1 menit
  - Large apps (50+ pages): 1-2 menit atau lebih
  
- **Kompleksitas**:
  - Jumlah pages
  - Jumlah regions
  - Jumlah items
  - Complexity dari SQL queries
  - Jumlah processes
  
- **Server Resources**:
  - CPU power
  - Memory availability
  - Database performance
  - Concurrent users

**Typical Times**:
- **Simple application**: 5-10 detik
- **Standard application**: 30-60 detik
- **Complex application**: 1-3 menit
- **Very large application**: 3-5 menit

**Tips**:
- First evaluation biasanya paling lama
- Subsequent evaluations faster (especially Page Score)
- Schedule large evaluations during off-peak hours
- Consider evaluating individual pages untuk faster feedback

---

## Navigasi dan Interface

### Komponen Utama Interface

APEX-SERT menggunakan layout konsisten dengan 3 region utama:
1. **Sidebar** (kiri)
2. **Navigation Controls** (atas)
3. **Page Contents** (tengah)

### 1. Sidebar (Kiri)

**Digunakan di**:
- Home page only
- Halaman evaluasi aplikasi only
- **TIDAK** digunakan di pages lain

#### Sidebar di Home Page

**Recent Events Section**:
- List chronological dari recent activities
- Informasi yang ditampilkan:
  - **Evaluations**: Which applications evaluated, when, by whom
  - **Exceptions Created**: New exceptions logged
  - **Exceptions Approved**: Approved exceptions dengan approver info
  - **Exceptions Rejected**: Rejected exceptions dengan reason
  - **User Activity**: Login/logout events

**Purpose**: Quick visibility into team activities dan application changes

#### Sidebar di Halaman Evaluasi

Sidebar dalam evaluation jauh lebih complex dan serves sebagai **mini-dashboard**.

##### View As Select List

**Lokasi**: Top of sidebar

**3 Options**:
- **Raw**: Ignore semua exceptions, show actual vulnerabilities
- **Pending**: Include pending exceptions dalam score
- **Approved**: Include approved exceptions dalam score

**Impact**: Mengubah value ini akan **immediately re-compute score** dan update semua displays

**Use Cases**:
- **Raw**: See true security posture, identify all issues
- **Pending**: Developer view, track work in progress
- **Approved**: Management view, official score

##### Score Display Section

**Three Percentage Scores Displayed**:

1. **Approved Score** (hijau)
   - Most important score
   - Includes approved exceptions
   - Target untuk 100%
   - Official score untuk reporting

2. **Pending Score** (kuning)
   - Development score
   - Includes pending exceptions
   - Shows potential score if approved
   - Useful untuk tracking progress

3. **Raw Score** (merah)
   - Actual vulnerabilities
   - No exceptions counted
   - True security posture
   - Baseline measurement

**Points Display**:
Di bawah percentage scores:
```
Current Points / Potential Points
Example: 167 / 480
```

**Interpretation**:
- Current Points: Points achieved (passed + exceptions)
- Potential Points: Maximum possible points
- Gap: Work remaining

##### Action Buttons

**Entire Score Button** (Recalculate Entire Score):

**Function**: Full re-evaluation dari entire application

**When to Use**:
- Setelah fixing multiple issues across application
- After major code changes
- When switching attribute sets
- Periodic comprehensive review

**Duration**: 
- Similar to initial evaluation
- 30 seconds - 3 minutes depending on size

**Process**:
1. Click button
2. APEX-SERT re-evaluates ALL attributes
3. All scores updated
4. All reports refreshed

**Page Score Button** (Recalculate Page Score):

**Function**: Re-evaluate specific attribute only

**When to Use**:
- After fixing issues pada current page
- Quick validation of single fix
- Iterative development
- Frequent testing

**Duration**: 
- Very fast: 1-5 seconds
- Fraction of Entire Score time

**Process**:
1. Navigate to attribute page
2. Click Page Score
3. Only that attribute re-evaluated
4. Immediate feedback

**Recommendation**: 
> **Use Page Score untuk iterative development. Use Entire Score untuk comprehensive validation.**

##### Attribute Set Select List

**Function**: Switch evaluation ke different attribute set

**Impact**: 
- Triggers **full re-evaluation**
- All data recomputed
- New scores generated
- Can take 1-3 minutes

**Use Cases**:
- Compare different evaluation criteria
- Test custom attribute sets
- Compliance dengan different standards
- Specialized security reviews

**Available Sets**:
- DEFAULT (always available)
- Custom sets (if created by admin)

##### Deficiency Bar Chart

**Display**: Horizontal bar chart dengan 5 bars

**Categories Shown**:
1. **Settings**: Configuration issues
2. **Page/Report**: Page-specific vulnerabilities
3. **XSS**: Cross-site scripting risks
4. **SQLi**: SQL injection vulnerabilities
5. **URL Tampering**: URL manipulation risks

**Information Per Bar**:
- Count of deficiencies
- Visual length represents relative count
- Color coding untuk severity

**Interaction**:
- **Click any bar**: Modal window opens
- Shows component attributes untuk that classification
- Provides summary dan details
- Quick access ke specific issues

**Purpose**: 
- At-a-glance security overview
- Identify focus areas
- Quick navigation
- Prioritization aid

##### Exception Grid (2x2)

**Display**: Four-quadrant grid

**Quadrants**:

```
┌─────────────────┬─────────────────┐
│ Pending         │ Approved        │
│ (to Approve)    │                 │
├─────────────────┼─────────────────┤
│ Pending         │ Rejected        │
│ (to Reject)     │                 │
└─────────────────┴─────────────────┘
```

**Information Per Quadrant**:
- Count of exceptions dalam status
- Color coding
- Clickable untuk details

**Interaction**:
- **Click any quadrant**: Detail view opens
- Shows component attributes
- Lists all exceptions dalam that status
- Action buttons untuk approve/reject (if authorized)

**Purpose**:
- Track exception workflow
- Identify pending approvals
- Monitor rejections
- Quick access dari any evaluation page

**Availability**: Visible throughout evaluation pages untuk easy access

### 2. Navigation Bar (Atas Kanan)

**Availability**: Every page dalam APEX-SERT

**Komponen** (dari kiri ke kanan):

#### 1. User Information Display

**Format**: `USERNAME (WORKSPACE)`

**Example**: `ADMIN (INTRO)`

**Information Shown**:
- Currently logged in username
- Workspace context dalam parentheses

**Purpose**: 
- Confirm identity
- Verify workspace context
- Quick reference

#### 2. APEX Builder Link

**Label**: "APEX Builder"

**Function**: Return ke APEX Builder session

**Behavior**:
- Keeps APEX-SERT session open
- Returns to same APEX Builder session
- Seamless transition
- No re-authentication needed

**Restriction**: Only works jika evaluating application dari same workspace tempat login

**Use Case**: 
- Fix issues identified dalam APEX-SERT
- Navigate back to application code
- Make configuration changes
- Return to APEX-SERT untuk re-evaluation

#### 3. Admin Application Link

**Label**: "APEX-SERT Admin"

**Visibility**: Only visible untuk users dengan **APEX-SERT Administrator role**

**Function**: Access APEX-SERT admin application

**Important Notes**:
- This is merely a link
- **Separate credentials required**
- Different from APEX Builder authentication
- Admin application bisa di different workspace
- Additional security layer

**Purpose**: 
- Access advanced administrative functions
- Manage system-wide settings
- Configure attributes dan categories

#### 4. Logout Link

**Label**: "Logout"

**Function**: Log out dari APEX-SERT

**Behavior**:
- Terminates APEX-SERT session
- Does NOT log out dari APEX Builder
- Separate session management
- Can return via "Launch APEX-SERT" link

**Best Practice**: Always logout saat selesai untuk security

### 3. Main Tabs

**Location**: Below navigation bar, span full width

**Always Visible**: Available dari every page

#### Tab Visibility by Role

**Standard User Tabs**:
- **Home**: Dashboard dan quick evaluation
- **Reports**: Workspace reports
- **Preferences**: User settings
- **About**: Application information

**Scheduler Role Additional Tabs**:
- **Scheduler**: Schedule evaluations (requires specific role)

**Administrator Role Additional Tabs**:
- **Admin**: Administration functions (requires admin role)

#### Tab Descriptions

**Home Tab**:
- Main dashboard
- Quick application evaluation
- Recent activity
- Metrics overview
- Exception statistics

**Reports Tab**:
- Workspace-level reports
- Cross-application analysis
- Hot spots
- Trends
- Summaries

**Preferences Tab**:
- User-specific settings
- Scoring preferences
- Help file locations
- Printing preferences
- Notification preferences (coming soon)

**Scheduler Tab** (if authorized):
- Schedule evaluations
- Manage notification lists
- Configure scheduling groups
- View scheduled jobs

**Admin Tab** (if authorized):
- Manage categories
- Configure attributes
- Create attribute sets
- Purge data
- View logs

**About Tab**:
- Version information
- Credits
- Documentation links
- Support information

#### Tab Behavior

**Click Tab**:
- Navigate to corresponding section
- Breadcrumb updates
- Context-sensitive content loads

**Active Tab Highlighting**:
- Current tab highlighted
- Visual indicator of location
- Consistent navigation experience

### 4. Breadcrumbs

Digunakan untuk navigasi dan menunjukkan lokasi saat ini dalam aplikasi.

### 5. Application Info Bar

Saat menjalankan evaluasi, ditampilkan:
- Application ID
- Application Name

### 6. Evaluation Sub-Tabs

Tabs khusus saat browsing evaluation:
- **Settings**
- **Pages & Reports**
- **SQLi** (dengan sub-tabs)
- **XSS** (dengan sub-tabs)
- **URL** (dengan sub-tabs)
- **Admin** (untuk Administrator role)

### 7. Interactive Reports

APEX-SERT menggunakan APEX interactive reports yang memungkinkan:
- Select/hide columns
- Apply filters
- Sort data
- Save personal views
- Export data

---

## Klasifikasi Keamanan

APEX-SERT mengevaluasi attributes yang dibagi dalam **5 klasifikasi utama**:

### 1. Settings
Evaluasi configuration dan settings level aplikasi

### 2. Page & Reports
Evaluasi keamanan pada page dan report components

### 3. SQL Injection (SQLi)
Deteksi kerentanan SQL injection

### 4. Cross-Site Scripting (XSS)
Deteksi kerentanan XSS

### 5. URL Tampering
Deteksi kerentanan URL tampering

### Classification Summary Page

**Cara Akses**: Klik top-level item di sub-tab klasifikasi

**Informasi yang Ditampilkan**:
- **Score** untuk klasifikasi tersebut (persentase)
- **Points Achieved / Total Possible Points**
- **Approximate Time to Fix**: Estimasi waktu untuk remedy issues
- **Score Cards**: Per attribute atau category
- **Exceptions Ready to Approve**
- **Stale Exceptions**

**Actions**:
- Klik bar chart atau card untuk detail attribute
- Klik print icon untuk generate PDF report
- Score berubah sesuai mode (Raw/Pending/Approved)

---

## Evaluasi Aplikasi

### Attributes dan Attribute Sets

#### Attributes
**Definisi**: Rules yang digunakan APEX-SERT untuk evaluasi aplikasi

**Karakteristik**:
- Mencari dan melaporkan potential security vulnerabilities
- Beberapa sederhana (inspect single component)
- Beberapa sophisticated (require SQL query dan function)
- APEX-SERT memiliki ~150 attributes

**Sebagai End User**:
- Tidak perlu memahami bagaimana attributes dihitung
- Fokus pada interpretasi hasil
- Lakukan corrective action jika diperlukan

#### Attribute Sets
**Definisi**: Grouping dari attributes

**DEFAULT Attribute Set**:
- Include ~150 attributes
- Tidak dapat dimodifikasi
- Disediakan out-of-the-box

**Custom Attribute Sets**:
- Dapat dibuat oleh Administrator
- Dapat berisi attribute apa saja
- Tidak ada batasan jumlah attribute sets

### Menjalankan Evaluasi

**Langkah-langkah**:
1. Select Workspace
2. Select Application
3. Select Attribute Set
4. Klik **Evaluate**

**Proses**:
- APEX-SERT akan evaluasi aplikasi berdasarkan attribute set yang dipilih
- Durasi: beberapa detik sampai beberapa menit
- Tergantung hardware dan kompleksitas aplikasi

---

## Sistem Scoring dan Exception

### Tiga Jenis Score

#### 1. Raw Score
**Definisi**: Hasil aktual dari evaluasi

**Karakteristik**:
- Tidak memperhitungkan exceptions
- Setiap attribute yang FAIL mengurangi 1 point dari total
- Mencerminkan kondisi keamanan sebenarnya

**Rumus**:
```
Raw Score = (Total Points - Failed Points) / Total Points × 100%
```

#### 2. Pending Score
**Definisi**: Kombinasi raw score + pending exceptions

**Karakteristik**:
- Include exceptions yang belum diapprove
- Memungkinkan developer track progress
- Membedakan failures yang perlu diaddress vs yang sudah di-mitigate

**Rumus**:
```
Pending Score = (Total Points - Failed Points + Pending Exception Points) / Total Points × 100%
```

#### 3. Approved Score
**Definisi**: Kombinasi raw score + approved exceptions

**Karakteristik**:
- Include hanya exceptions yang sudah diapprove
- Merupakan score "official"
- Target untuk mencapai 100%

**Rumus**:
```
Approved Score = (Total Points - Failed Points + Approved Exception Points) / Total Points × 100%
```

### Siklus Evaluasi dan Scoring

**Evaluasi Pertama**:
- Ketiga score akan sama (belum ada exceptions)

**Langkah-langkah Improvement**:

1. **Fix Vulnerabilities**
   - Developer fix sebanyak mungkin issues
   - Re-evaluate page atau entire application
   - Score akan meningkat

2. **Create Exceptions**
   - Untuk issues yang tidak bisa diperbaiki
   - Provide justification
   - Status berubah menjadi PENDING

3. **Approve Exceptions**
   - Reviewer approve exceptions
   - Approved score meningkat
   - Target 100%

**Catatan Penting**:
> "If you get a raw score of 100%, your application likely won't run at all!"

Beberapa failures adalah by design dan memerlukan exceptions, bukan fixes.

### Exception Management

#### Apa itu Exception?

**Definisi**: Justifikasi mengapa sebuah component yang failed evaluation sebenarnya aman atau acceptable.

**Contoh Use Case**:
- Public pages yang by design tidak require authentication
- Pages dengan URL tampering yang di-mitigate dengan authorization checks
- Custom security implementations

**Karakteristik**:
- Bisa singkat (beberapa kata) atau panjang (beberapa kalimat)
- Menjelaskan mengapa configuration saat ini acceptable
- Must provide valid security reasoning

#### Creating Exceptions

**Single Exception**:

1. Klik icon **"** next to failed component
2. Popup region akan muncul
3. Enter **Justification**
4. Klik **Create Exception**
5. Status berubah dari FAIL → PENDING

**Contoh Justification**:
```
"This page is intentionally public as it serves as the 
application's landing page. Access to sensitive data 
is controlled through authorization schemes on internal pages."
```

**Multiple Exceptions (Bulk)**:

1. Klik **Submit All** button
2. Single exception dibuat untuk semua failures dari attribute tersebut
3. Each exception dapat di-edit individually nanti

**Editing Exceptions**:

- Klik icon **"** untuk edit
- Dapat alter justification
- Dapat delete exception
- **Restriction**: Hanya developer yang create exception yang bisa edit/delete

**Viewing Others' Exceptions**:

- Klik icon **"** untuk view
- Cannot modify
- Read-only access

#### Approving & Rejecting Exceptions

**Requirement**:
- Minimal 2 APEX users berbeda
- Approver harus memiliki **Approver role**
- Cannot self-approve exceptions

**Cara Approve/Reject**:

**Individual Exception**:

1. Klik icon **"** di exception
2. Popup window muncul dengan 2 options:
   - **Approve**: Set Result to Approve → Submit
   - **Reject**: Set Result to Reject → Enter Rejection reason → Submit

3. Status berubah:
   - PENDING → APPROVED (jika approve)
   - PENDING → REJECTED (jika reject)

**Batch Approve/Reject**:

1. Klik **Approve/Reject All**
2. Popup shows all pending exceptions submitted by others
3. Choose Approve atau Reject all
4. Enter reason jika rejecting
5. Klik **Submit Action**
6. All exceptions updated sekaligus

**Lokasi Approve/Reject**:
- Exception grid di sidebar (klik quadrant)
- Classification Summary page
- Exception Detail reports

**Best Practice**:
- Provide clear rejection reasons
- Review justifications thoroughly
- Approve hanya jika security reasoning valid
- Document approval decision

#### Stale Exceptions

**Konsep**:
> "Security is not an event, but rather a process."

**Definisi**: Exception menjadi "stale" jika underlying value dari attribute berubah setelah exception diapprove.

**Mengapa Stale Exceptions Penting**:
- Code changes dapat introduce vulnerabilities baru
- Exception mungkin tidak lagi valid
- Requires re-evaluation

**Proses Automatic**:
- Terjadi setiap evaluation dijalankan
- APEX-SERT compare nilai saat ini dengan nilai saat exception dibuat
- Jika berbeda → exception marked as STALE

**Handling Stale Exceptions**:

1. **View Details**:
   - Status column menampilkan STALE
   - Klik icon **"** untuk detail

2. **Information Displayed**:
   - Value saat exception submitted
   - Current value
   - "Diff" view highlighting changes:
     - Green: Code added
     - Red: Code removed

3. **Actions**:
   
   **Option A - Code change tidak mengubah exception**:
   - Provide new justification
   - Re-submit exception
   
   **Option B - Code change introduce vulnerability**:
   - Withdraw exception
   - Fix the defect properly

**Stale Exception Locations**:
- Classification Summary page
- Exception reports
- Attribute detail pages

#### Deleting Approved Exceptions

**Restriction**: Hanya Administrator yang dapat delete approved exceptions

**Cara Delete**:

1. Select **Exceptions** dari Admin tab
2. Locate exception di interactive report
3. Klik trash can icon
4. Confirm deletion
5. Re-run evaluation untuk see changes

**Kapan Delete**:
- Exception tidak lagi relevant
- Security requirements berubah
- Vulnerability sudah di-fix properly

#### Importing & Exporting Exceptions

**Use Case**:
- Move exceptions dari Development → QA → Production
- Backup exceptions
- Share exceptions across environments

**Restrictions**:
- Source dan target applications harus similar
- Same Attribute Set must be used
- Differences akan dilaporkan setelah import

**Export Process**:

1. Select **Exceptions** dari Admin menu
2. Klik **Export** button
3. Save file ke local disk

**Import Process**:

1. Switch ke target application
2. Evaluate target application
3. Select **Exceptions** dari Admin tab
4. Klik **Import** button
5. Browse dan locate export file
6. Decide: Purge existing exceptions? (Yes/No)
7. Klik **Import**

**Import Duration**:
- Beberapa detik sampai beberapa menit
- APEX-SERT juga perform full evaluation

**Post-Import**:
- Report menampilkan exceptions yang tidak bisa diimport
- All successful imports visible seperti native entries

#### Purging Exceptions

**Restriction**: Administrator only

**Cara Purge**:

1. Select **Exceptions** dari Admin tab
2. Klik **Purge All** button
3. Confirm action
4. All exceptions untuk application & attribute set deleted

**Important**:
- Action cannot be undone
- No automatic re-evaluation
- Manual re-run required (click Recalculate Entire Score)

---

## Notasi

### Tentang Notations

**Definisi**: Comments atau notes yang dapat ditambahkan pada discrete instance dari attribute

**Karakteristik**:
- Tidak mempengaruhi score aplikasi
- Purely informational
- Untuk documentation dan tracking

**Use Cases**:
- Mark items yang memerlukan research lebih lanjut
- Document decisions
- Track pending questions
- Collaboration notes antar developers

### Creating Notations

**Langkah-langkah**:

1. Klik icon **"** dalam report
2. Popup window muncul
3. Enter text di **Notation** field
4. Klik **Create Notation**

**Indikator**:
- Icon berubah setelah notation dibuat
- Menandakan element memiliki notation

### Viewing Notations

- Klik icon notation untuk view
- Read-only untuk semua users
- Visible untuk semua yang dapat access evaluation

### Deleting Notations

**Restriction**: Hanya Administrator (SV_SERT_ADMIN group)

**Cara Delete**:

1. Select **Notations** dari Admin tab
2. Locate notation di interactive report
3. Klik trash can icon
4. Confirm deletion
5. Re-run evaluation untuk see changes

**Important**:
- Notations cannot be modified once created
- Only deletion available
- Requires re-evaluation untuk update display

### Importing & Exporting Notations

**Purpose**:
- Move notations across environments
- Backup notation data
- Share collaboration notes

**Restrictions**:
- Source dan target applications harus similar
- Same Attribute Set required
- Mapping issues akan dilaporkan

**Export Process**:

1. Select **Notations** dari Admin menu
2. Klik **Export** button
3. Save file to local disk

**Import Process**:

1. Switch ke target application
2. Evaluate target application
3. Select **Notations** dari Admin tab
4. Klik **Import** button
5. Browse file
6. Decide: Purge existing notations? (Yes/No)
7. Klik **Import**

**Import Duration**:
- Beberapa detik sampai beberapa menit
- Include full evaluation

**Post-Import**:
- Report show notations yang tidak bisa diimport
- Successful imports visible seperti native entries

### Purging Notations

**Restriction**: Administrator only

**Cara Purge**:

1. Select **Notations** dari Admin tab
2. Klik **Purge All** button
3. Confirm action
4. All notations untuk application & attribute set deleted

**Important**:
- Cannot be undone
- Requires manual re-evaluation

---

## Laporan (Reports)

### Overview

**Lokasi Reports**:
1. **Workspace Level**: Reports tab (main)
2. **Application Level**: Reports sub-tab (dalam evaluation)

**Format Export**:
- Semua reports dapat di-print sebagai PDF
- Menggunakan PL/FPDF (free open source library)
- Well-formatted tanpa additional software

**Report Configuration**:
- Klik gear icon untuk configure
- Select/deselect columns
- Define length, alignment, display order
- Save personal views

### Workspace Reports

**Akses**: Klik **Reports** tab di main navigation

#### 1. All Evaluations

**Deskripsi**: Summary semua aplikasi yang pernah dievaluasi

**Informasi**:
- Application name
- Top level scores (Raw, Pending, Approved)
- Evaluation dates
- Attribute sets used

**Use Case**:
- Quick overview semua applications
- Compare scores across applications
- Track evaluation history

#### 2. Attribute Hot Spots

**Deskripsi**: Identifikasi Attributes dengan unusually high number of vulnerabilities

**Konfigurasi**:
- Adjust Scoring Method
- Set minimum number of vulnerabilities

**Use Case**:
- Focus remediation efforts
- Identify common vulnerability patterns
- Prioritize fixes across applications

#### 3. Category Hot Spots

**Deskripsi**: Identifikasi Categories dengan unusually high number of vulnerabilities

**Konfigurasi**:
- Adjust Scoring Method
- Set minimum number of vulnerabilities

**Use Case**:
- Identify category-level issues
- Pattern recognition
- Training opportunities

#### 4. Classification Hot Spots

**Deskripsi**: Identifikasi Classifications dengan unusually high number of vulnerabilities

**Konfigurasi**:
- Adjust Scoring Method
- Set minimum number of vulnerabilities

**Use Case**:
- High-level security posture view
- Strategic planning
- Resource allocation

#### 5. Completed Scheduled Evaluations

**Deskripsi**: List semua completed scheduled evaluations

**Features**:
- Click edit pencil untuk details
- Drill-down ke classifications dan categories
- View evaluation results

**Use Case**:
- Track scheduled evaluation history
- Verify automation
- Audit trail

#### 6. Recent Evaluations

**Deskripsi**: Summary dari most recent evaluation per application

**Features**:
- Quick re-evaluation (click green triangle)
- Latest scores
- Quick access

**Use Case**:
- Current state overview
- Quick re-evaluation trigger
- Dashboard view

#### 7. Score Trends

**Deskripsi**: Chart menampilkan scoring trend dari specific application & attribute set

**Features**:
- Line/bar chart
- Time series data
- Compare Raw, Pending, Approved scores

**Use Case**:
- Track improvement over time
- Demonstrate progress
- Identify trends

#### 8. Stale Evaluations

**Deskripsi**: Highlight applications yang never evaluated atau updated setelah last evaluation

**Information**:
- Applications never evaluated
- Applications modified after last evaluation
- Out-of-date evaluations

**Use Case**:
- Identify applications needing attention
- Ensure evaluations are current
- Compliance monitoring

### Application Reports

**Akses**: **Reports** sub-tab dalam evaluation

#### 1. Authorization Scheme Impact

**Deskripsi**: List component associations dengan authorization schemes

**Features**:
- Click edit icon untuk results
- Filter by Authorization Scheme atau Page
- Two sub-tabs:
  - Page Components
  - Shared Components

**Use Case**:
- Understand authorization coverage
- Identify gaps
- Plan authorization strategy

#### 2. Evaluation Summary

**Deskripsi**: PDF-only comprehensive summary

**Configuration**:
- Select Classifications to include
- Click printer icon

**Use Case**:
- Executive reports
- Documentation
- Stakeholder communication

#### 3. Events Summary

**Deskripsi**: Audit trail semua events untuk application

**Events Include**:
- Evaluations
- Exception creation
- Exception approvals
- Exception rejections
- Notation activities

**Use Case**:
- Audit trail
- Track activities
- Compliance documentation

#### 4. Exceptions Detail

**Deskripsi**: Detailed list semua exceptions

**Information**:
- Exception justification
- Status
- Created by
- Approved by
- Timestamps

**Use Case**:
- Exception review
- Documentation
- Audit purposes

#### 5. Exceptions Summary

**Deskripsi**: Summary view of exceptions

**Information**:
- Count by status
- Count by attribute
- Summary statistics

**Use Case**:
- High-level exception view
- Quick statistics
- Management reporting

#### 6. Failures Summary

**Deskripsi**: Summary failures per attribute

**Features**:
- Click Category column → redirect ke corresponding page
- Count of failures per attribute
- Severity information

**Use Case**:
- Prioritize remediation
- Focus on high-impact areas
- Track progress

#### 7. Issues by Category

**Deskripsi**: Chart summary berdasarkan category

**Features**:
- Visual representation
- Category breakdown
- Issue counts

**Use Case**:
- Visual analysis
- Pattern recognition
- Presentations

#### 8. Issues by Classification

**Deskripsi**: Chart summary berdasarkan classification

**Features**:
- 5 major classifications
- Visual breakdown
- Issue distribution

**Use Case**:
- High-level view
- Strategic planning
- Executive reporting

#### 9. Issues by Impact

**Deskripsi**: Chart summary berdasarkan impact level

**Impact Levels**:
- Critical
- High
- Medium
- Low

**Use Case**:
- Risk assessment
- Prioritization
- Resource allocation

#### 10. Issues by Page

**Deskripsi**: Summary issues segmented by page

**Features**:
- Page-level breakdown
- Issue counts per page
- Page identification

**Use Case**:
- Page-specific remediation
- Focus efforts
- Developer assignment

#### 11. Issues by Time to Fix

**Deskripsi**: Summary estimated time to fix broken down by category

**Information**:
- Time estimates per category
- Total time estimates
- Resource planning data

**Use Case**:
- Sprint planning
- Resource allocation
- Timeline estimation

#### 12. Notations Summary

**Deskripsi**: Summary notations per attribute

**Features**:
- Click Attribute Name → go to attribute page
- Count of notations
- Quick navigation

**Use Case**:
- Review notations
- Track pending items
- Team communication

#### 13. Score Trend

**Deskripsi**: Line/bar chart untuk Approved, Pending, dan Raw scores

**Features**:
- Time series
- Multiple score types
- Trend analysis

**Use Case**:
- Track progress
- Visualize improvement
- Stakeholder updates

---

## Preferensi

### Overview

**Akses**: Main **Preferences** tab

**Scope**: User-specific preferences

### Preference Categories

#### 1. Scoring Tolerances & Precision

**Options**:
- Score calculation methods
- Decimal precision
- Rounding rules

**Impact**:
- How scores are displayed
- Calculation accuracy

#### 2. Help File Locations

**Options**:
- Help documentation URLs
- External resource links

**Impact**:
- Where help opens
- Documentation access

#### 3. Printing Preferences

**Options**:
- PDF output settings
- Report formatting
- Page orientation
- Font sizes

**Impact**:
- PDF report appearance
- Print quality

### Future Features

**Note**: Notification Preferences currently not enabled

**Coming Soon**:
- Email notification settings
- Alert preferences
- Notification frequency

---

## Penjadwalan Evaluasi

### Overview

**Requirement**: User harus memiliki role:
- **Evaluate & Schedule in All Workspaces**, atau
- **Schedule in a Specific Workspace**

**Capabilities**:
- Schedule evaluations weekly atau daily
- Choose scoring method (Approved, Pending, atau Raw)
- Email results ke user groups
- Recipients tidak perlu APEX