# docs/ — GitHub Pages PANDAWA

Situs statis untuk **https://iwanhe.github.io/pandawa/** (Pages: branch `main`, folder `/docs`).

| File | Isi |
|------|-----|
| `index.html` | Landing page |
| `css/style.css` | Tema gelap |
| `js/app.js` | Data section (EBS, skills, standar, DevOps) + kartu aplikasi dari `custom_apps.json` |
| `img/` | Logo & favicon |
| `.nojekyll` | Mematikan pemrosesan Jekyll |

**Menambah aplikasi APEX:** daftarkan di `/custom_apps.json` (root repo) — kartu di situs ikut ter-update otomatis. Detail versi APEX/App ID ada di `APP_EXTRA` pada `js/app.js`.

**Mengubah isi section lain:** edit array `EBS`, `SKILLS`, `STANDARDS`, `DEVOPS`, atau `OTHER_APPS` di `js/app.js`.
