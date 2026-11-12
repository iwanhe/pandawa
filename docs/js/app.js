/* PANDAWA GitHub Pages — render konten dari data di bawah + custom_apps.json */
(function () {
  "use strict";

  var REPO = "https://github.com/iwanhe/pandawa";
  var TREE = REPO + "/tree/main/";
  var BLOB = REPO + "/blob/main/";
  var MANIFEST = "https://raw.githubusercontent.com/iwanhe/pandawa/main/custom_apps.json";

  // Info tambahan untuk app yang ada di custom_apps.json (berdasarkan internalName)
  var APP_EXTRA = {
    P_TRACK: { icon: "PT", apex: "24.2.11", appId: "114" },
    INCIDENT_TRACK: { icon: "IT", apex: "24.2.11", appId: "101" }
  };

  // Fallback bila custom_apps.json gagal dimuat
  var GALLERY_FALLBACK = [
    {
      internalName: "P_TRACK", name: "PERMADI",
      description: "Project Tracking Application — tool manajemen & tracking project untuk Oracle APEX.",
      version: "1.0.0", url: TREE + "p-track",
      source: "https://raw.githubusercontent.com/iwanhe/pandawa/main/p-track/f114.sql",
      zip: "https://raw.githubusercontent.com/iwanhe/pandawa/main/p-track/f114.zip"
    },
    {
      internalName: "INCIDENT_TRACK", name: "Incident Tracking",
      description: "Sistem manajemen & tracking insiden IT untuk Oracle APEX.",
      version: "1.0.0", url: TREE + "incident-tracking",
      source: "https://raw.githubusercontent.com/iwanhe/pandawa/main/incident-tracking/f101.sql",
      zip: "https://raw.githubusercontent.com/iwanhe/pandawa/main/incident-tracking/f101.zip"
    }
  ];

  // Aplikasi lain (belum terdaftar di App Gallery)
  var OTHER_APPS = [
    { icon: "FR", name: "FRITS", desc: "Form Request IT System — pengajuan & approval permintaan layanan IT.", tags: ["APEX 24.1.5", "App 216180"], url: TREE + "frits" },
    { icon: "AV", name: "Access Vault Portal", desc: "Portal internal rekap data akses/koneksi. React + Vite di frontend, ORDS + OAuth2 di backend.", tags: ["React", "ORDS", "OAuth2"], url: TREE + "KCSI_Access_Vault_Portal_Code" },
    { icon: "OL", name: "OutSystems Log", desc: "Aplikasi APEX untuk melihat dan menelusuri log OutSystems.", tags: ["APEX", "App 105"], url: TREE + "meta" },
    { icon: "SSO", name: "APEX ↔ EBS SSO", desc: "Integrasi single sign-on Oracle APEX dengan Oracle EBS lewat JSP gateway.", tags: ["EBS R12.2", "Java", "JSP"], url: TREE + "apextoebs" }
  ];

  var EBS = [
    { icon: "AP", name: "Accounts Payable", desc: "API Bank, Single Payment, Void Payment.", path: "ap" },
    { icon: "FA", name: "Fixed Assets", desc: "Create Accounting, Retirement, Mass Copy, Delete Asset.", path: "fa" },
    { icon: "GL", name: "General Ledger", desc: "Script reset saldo GL dan dokumentasinya.", path: "gl" },
    { icon: "INV", name: "Inventory", desc: "Query on-hand per lot.", path: "inv" },
    { icon: "PO", name: "Purchasing", desc: "Troubleshooting autocreate PR → PO, reset approval.", path: "po" },
    { icon: "OPM", name: "Process Manufacturing", desc: "OPM Costing, period end, batch & recipe testing.", path: "opm" },
    { icon: "OPC", name: "Project Costing", desc: "Cancel Work Confirmation dengan backup table.", path: "opc" },
    { icon: "SLA", name: "Subledger Accounting", desc: "Query setup SLA: ADR, AAD, JLD, JED, custom source.", path: "sla" },
    { icon: "TAX", name: "E-Business Tax", desc: "Setup tambahan EB-Tax.", path: "ebtax" },
    { icon: "SYS", name: "System Administration", desc: "13 audit query: privilege, login, session, PAT.", path: "sysadmin" },
    { icon: "AIM", name: "AIM 3.0 Templates", desc: "Template dokumen Oracle AIM 3.0 & PJM 2.6.1.", path: "om30" },
    { icon: "NTI", name: "Dokumentasi Entitas", desc: "Ringkasan BP080, training, dan setup per entitas.", path: "oracle-ebs-nti" }
  ];

  var SKILLS = [
    { icon: "ADT", name: "ADT & ADT Setup", desc: "Export DB/APEX, buat & deploy patch, recompile — plus instalasi ADT.", tags: ["adt.skill", "adt-setup.skill"] },
    { icon: "APX", name: "APEX via SQLcl", desc: "Export, patch, dan import komponen APEX lewat SQLcl.", tags: ["apex.skill"] },
    { icon: "CM", name: "APEX Component Modifier", desc: "Pola global untuk memodifikasi page, region, IR/IG, chart, dan lainnya.", tags: ["global-patterns", "evals"] },
    { icon: "QA", name: "APEX QA & REST PANDAWA", desc: "Standar QA (MVC, naming APX_) dan standar REST/ORDS.", tags: ["apex-qa-pandawa", "apex-rest-pandawa"] },
    { icon: "SQL", name: "SQLcl & Oracle DB", desc: "SQLcl MCP plus 150 referensi Oracle Database dalam 17 kategori.", tags: ["sqlcl.skill", "oracle-db"] },
    { icon: "RW", name: "Redwood, SERT, APEXlang", desc: "Redwood Design System, security scanning APEX SERT, dan APEXlang.", tags: ["redwood-apex", "apex-sert", "apexlang"] }
  ];

  var STANDARDS = [
    { icon: "DEV", name: "Oracle Dev Standards v1.1", desc: "Standar pengembangan Oracle EBS & APEX — versi terkini.", url: BLOB + "oracle-dev-standards-v1.1.md", tags: ["Wajib"] },
    { icon: "NC", name: "Naming Convention", desc: "Prefix XTD_ (EBS), APX_ (APEX), suffix objek, konvensi variabel.", url: BLOB + "naming-convention-oracle.md" },
    { icon: "AIM", name: "Apps Implementation Methodology", desc: "Fase, deliverable, dan template implementasi berbasis Oracle AIM 3.0.", url: BLOB + "apps-implementation-methodology.md" },
    { icon: "CR", name: "Kebijakan Manajemen Perubahan", desc: "Klasifikasi perubahan, alur approval, checklist deployment, rollback.", url: BLOB + "Kebijakan_Manajemen_Perubahan_IT_Upstream_Development.md", tags: ["Wajib"] },
    { icon: "STD", name: "Standardization", desc: "Technical paper, quality gate pre-UAT, OWASP checklist, post go-live review.", url: TREE + "standardization" },
    { icon: "LIC", name: "Oracle Licensing", desc: "Analisis lisensi APEX, komparasi platform DB, cek kapasitas 23ai Free.", url: TREE + "oracle-licensing" }
  ];

  var DEVOPS = [
    { icon: "CI", name: "CI/CD Oracle APEX & EBS", desc: "Standar deployment berbasis ADT dan panduan FNDLOAD R12.2.", url: TREE + "ci-cd-oracle-apex-ebs" },
    { icon: "SEC", name: "APEX SERT", desc: "User guide APEX SERT 5.1 dan ringkasan security scanning.", url: TREE + "apex-sert" },
    { icon: "TRN", name: "Training", desc: "Materi integrasi PO ↔ SO, latihan SQL hands-on beserta ERD.", url: TREE + "training" }
  ];

  // ---------- helpers ----------
  function el(tag, attrs, children) {
    var n = document.createElement(tag);
    if (attrs) Object.keys(attrs).forEach(function (k) {
      if (k === "text") n.textContent = attrs[k];
      else n.setAttribute(k, attrs[k]);
    });
    (children || []).forEach(function (c) { if (c) n.appendChild(c); });
    return n;
  }

  function tags(list, hot) {
    if (!list || !list.length) return null;
    return el("div", { "class": "tags" }, list.map(function (t) {
      return el("span", { "class": "tag" + (hot && hot.indexOf(t) > -1 ? " tag-hot" : ""), text: t });
    }));
  }

  function card(item, opts) {
    opts = opts || {};
    var root = item.url && !opts.actions
      ? el("a", { "class": "card", href: item.url })
      : el("article", { "class": "card" });
    root.appendChild(el("div", { "class": "card-top" }, [
      el("span", { "class": "icon", "aria-hidden": "true", text: item.icon || "•" }),
      el("h3", { text: item.name })
    ]));
    root.appendChild(el("p", { text: item.desc }));
    var t = tags(item.tags, ["Wajib", "App Gallery"]);
    if (t) root.appendChild(t);
    if (opts.actions) root.appendChild(el("div", { "class": "card-actions" }, opts.actions));
    return root;
  }

  function render(id, items, opts) {
    var host = document.getElementById(id);
    if (!host) return;
    host.textContent = "";
    items.forEach(function (it) { host.appendChild(card(it, opts)); });
  }

  // ---------- apps (custom_apps.json + lainnya) ----------
  function renderApps(gallery) {
    var host = document.getElementById("apps-grid");
    host.textContent = "";
    gallery.forEach(function (a) {
      var x = APP_EXTRA[a.internalName] || {};
      var t = ["App Gallery"];
      if (x.apex) t.push("APEX " + x.apex);
      if (x.appId) t.push("App " + x.appId);
      if (a.version) t.push("v" + a.version);
      var actions = [
        a.url ? el("a", { "class": "btn btn-small", href: a.url, text: "Detail" }) : null,
        a.source ? el("a", { "class": "btn btn-small", href: a.source, text: ".sql" }) : null,
        a.zip ? el("a", { "class": "btn btn-small", href: a.zip, text: ".zip" }) : null
      ].filter(Boolean);
      host.appendChild(card({
        icon: x.icon || (a.name || "?").slice(0, 2).toUpperCase(),
        name: a.name,
        desc: a.description,
        tags: t
      }, { actions: actions }));
    });
    OTHER_APPS.forEach(function (a) { host.appendChild(card(a)); });
    var stat = document.getElementById("stat-apps");
    if (stat) stat.textContent = String(gallery.length + OTHER_APPS.length);
  }

  function loadApps() {
    renderApps(GALLERY_FALLBACK);
    if (!window.fetch) return;
    fetch(MANIFEST, { cache: "no-cache" })
      .then(function (r) { if (!r.ok) throw new Error(r.status); return r.json(); })
      .then(function (j) { if (j && j.customApps && j.customApps.length) renderApps(j.customApps); })
      .catch(function () { /* tetap pakai fallback */ });
  }

  // ---------- copy buttons ----------
  function initCopy() {
    document.querySelectorAll("[data-copy]").forEach(function (btn) {
      btn.addEventListener("click", function () {
        var src = document.getElementById(btn.getAttribute("data-copy"));
        if (!src) return;
        var text = src.textContent.trim();
        var done = function () {
          var old = btn.textContent;
          btn.textContent = "Tersalin ✓";
          setTimeout(function () { btn.textContent = old; }, 1600);
        };
        if (navigator.clipboard && navigator.clipboard.writeText) {
          navigator.clipboard.writeText(text).then(done, function () {});
        } else {
          var r = document.createRange(); r.selectNodeContents(src);
          var s = window.getSelection(); s.removeAllRanges(); s.addRange(r);
          try { document.execCommand("copy"); done(); } catch (e) {}
          s.removeAllRanges();
        }
      });
    });
  }

  // ---------- init ----------
  loadApps();
  render("ebs-grid", EBS.map(function (m) { return { icon: m.icon, name: m.name, desc: m.desc, url: TREE + m.path }; }));
  render("skills-grid", SKILLS.map(function (s) { s.url = TREE + "skills"; return s; }));
  render("std-grid", STANDARDS);
  render("devops-grid", DEVOPS);
  initCopy();
  var y = document.getElementById("year");
  if (y) y.textContent = String(new Date().getFullYear());
})();
