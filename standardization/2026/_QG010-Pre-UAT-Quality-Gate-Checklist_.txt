# 📋 QG010 - Pre-UAT Quality Gate Checklist

**Dokumen Code:** `QG010`  
**Versi:** 1.0  
**Tanggal:** Desember 2025  
**Tujuan:** Mencegah defects masuk ke UAT; meningkatkan First Time Pass Rate & kualitas produksi

---

## 📌 Info Proyek & Release

- **Nama Proyek:** ______________________________
- **Release:** ______________________________
- **Target Go-Live:** ______________________________
- **Tanggal Quality Gate:** ______________________________
- **QA Lead:** ______________________________
- **Dev Lead:** ______________________________
- **Project Manager:** ______________________________

---

## ✅ MANDATORY QUALITY GATE CHECKLIST

### **A. Code Quality & Review**

| # | Item | Target | Actual | PIC | Evidence | Status |
|---|---|---|---|---|---|---|
| A. 1 | Code freeze date achieved | [Date] | | Dev Lead | Git commit tag | ☐ PASS<br>☐ FAIL |
| A.2 | **Peer code review 100%** (per Dev Standards Sec 9) | 100% | __% | Code Reviewer | Review Board Report | ☐ PASS<br>☐ FAIL |
| A.3 | **SonarQube analysis:  ZERO Blocker/Critical** | 0 | __ | QA Engineer | SonarQube Report Link | ☐ PASS<br>☐ FAIL |
| A.4 | **SAST scan (CodeQL/Trivadis): ZERO High** | 0 | __ | Security | SAST Report | ☐ PASS<br>☐ FAIL |
| A. 5 | No hardcoded credentials/secrets | 0 | __ | Security | Secret Scan Report | ☐ PASS<br>☐ FAIL |
| A.6 | No unused code or dead code paths | Yes | | Dev Lead | Code Inspection | ☐ PASS<br>☐ FAIL |
| A.7 | No deprecated APIs used | Yes | | Developer | Code Review | ☐ PASS<br>☐ FAIL |

**Sign-off:** QA Lead ____________  Dev Lead ____________

---

### **B. Testing & Coverage**

| # | Item | Target | Actual | PIC | Evidence | Status |
|---|---|---|---|---|---|---|
| B. 1 | **Unit test coverage ≥ 80%** | ≥80% | __% | QA/Developer | Coverage Report | ☐ PASS<br>☐ FAIL |
| B.2 | **All unit tests PASSED** | 100% | __% | Developer | Test Run Log | ☐ PASS<br>☐ FAIL |
| B.3 | **Integration testing PASSED** | 100% | __% | QA | Integration Test Result | ☐ PASS<br>☐ FAIL |
| B.4 | **Regression test suite RUN & PASSED** | 100% | __% | QA/Automation | Regression Test Report | ☐ PASS<br>☐ FAIL |
| B.5 | **No Showstopper bugs in backlog** | 0 | __ | QA | Bug Tracker Query | ☐ PASS<br>☐ FAIL |
| B.6 | Known bugs documented & categorized | <5 | __ | QA | Known Issues List | ☐ PASS<br>☐ FAIL |

**Sign-off:** QA Lead ____________

---

### **C. Requirements Traceability & Test Cases**

| # | Item | Target | Actual | PIC | Evidence | Status |
|---|---|---|---|---|---|---|
| C. 1 | **Requirements traceability 100%** | 100% | __% | Analyst | Traceability Matrix | ☐ PASS<br>☐ FAIL |
| C.2 | **Test cases mapped to all requirements** | 1: many | mapped | QA | Test Case Coverage Matrix | ☐ PASS<br>☐ FAIL |
| C.3 | **All test scenarios documented (TE040)** | Complete | __% | QA | TE040 Document | ☐ PASS<br>☐ FAIL |
| C.4 | **Acceptance criteria explicitly defined** | All | mapped | Analyst | Requirement Document | ☐ PASS<br>☐ FAIL |

**Sign-off:** Analyst ____________  QA Lead ____________

---

### **D. Design & Architecture**

| # | Item | Target | Actual | PIC | Evidence | Status |
|---|---|---|---|---|---|---|
| D.1 | Design review completed for all changes | All | reviewed | Architect | Design Review Minutes | ☐ PASS<br>☐ FAIL |
| D.2 | Database schema review completed | All tables | reviewed | DBA | Schema Review Report | ☐ PASS<br>☐ FAIL |
| D.3 | Performance design baseline validated | Yes | | DBA/Perf Tester | Performance Baseline | ☐ PASS<br>☐ FAIL |
| D.4 | Data model changes documented | All | documented | Data Architect | Data Model Diagram | ☐ PASS<br>☐ FAIL |

**Sign-off:** Architect ____________  DBA ____________

---

### **E. Documentation**

| # | Item | Target | Actual | PIC | Evidence | Status |
|---|---|---|---|---|---|---|
| E.1 | User guide/user procedure documented | 100% features | __% | BA/Key User | DO070/DO080 Document | ☐ PASS<br>☐ FAIL |
| E.2 | Technical design documentation complete | All modules | __% | Developer | Technical Spec (MD050) | ☐ PASS<br>☐ FAIL |
| E.3 | Test scenario documentation (TE040) complete | All features | __% | QA | TE040 Document | ☐ PASS<br>☐ FAIL |
| E. 4 | Known issues/workarounds documented | All | documented | QA | Known Issues Log | ☐ PASS<br>☐ FAIL |
| E.5 | Deployment runbook prepared | Complete | __% | DevOps | Deployment Guide | ☐ PASS<br>☐ FAIL |

**Sign-off:** Documentation Lead ____________

---

### **F. Security & Compliance (OWASP)**

| # | Item | Target | Actual | PIC | Evidence | Status |
|---|---|---|---|---|---|---|
| F.1 | OWASP compliance checklist reviewed | Passed | | Security | OWASP Checklist | ☐ PASS<br>☐ FAIL |
| F.2 | Static security analysis passed | 0 High | __ | Security | SAST Report | ☐ PASS<br>☐ FAIL |
| F.3 | Authorization test cases completed | All roles | tested | QA | Test Result | ☐ PASS<br>☐ FAIL |
| F. 4 | Input validation verified | Yes | | QA | Test Report | ☐ PASS<br>☐ FAIL |
| F.5 | SQL injection tests passed | 0 success | __ | QA | Pen Test Report | ☐ PASS<br>☐ FAIL |

**Sign-off:** Security Officer ____________

---

### **G.  Dependencies & External Blockers**

| # | Item | Requirement | Owner | Status | ETA |
|---|---|---|---|---|---|
| G.1 | External system integration ready | Tested & working | Integration Team | ☐ Ready<br>☐ Pending | |
| G.2 | Data migration/load prepared | Migration scripts tested | Data Team | ☐ Ready<br>☐ Pending | |
| G.3 | Infrastructure environment ready | Dev/Test/UAT validated | Infrastructure | ☐ Ready<br>☐ Pending | |
| G.4 | Third-party dependencies resolved | All current versions | Dev Lead | ☐ Ready<br>☐ Pending | |
| G.5 | No critical path blockers | 0 | Project Manager | ☐ Clear<br>☐ Blocked | |

---

## ⚠️ CONDITION FOR PASS / FAIL

### ✅ **GATE PASS** (Lanjut ke UAT)

Semua kondisi berikut harus terpenuhi: 
- ✓ Semua item status = **PASS**
- ✓ Blocker/Critical issues = **0**
- ✓ Unit test coverage ≥ **80%**
- ✓ Regression test = **100% passed**
- ✓ Showstopper bugs = **0**
- ✓ OWASP compliance = **Passed**
- ✓ SonarQube Blocker/Critical = **0**

### ❌ **GATE FAIL** (Return to Dev)

Jika ada satu atau lebih kondisi tidak terpenuhi:
- ❌ Ada item status = **FAIL**
- ❌ SonarQube Blocker/Critical > **0**
- ❌ Unit test coverage < **80%**
- ❌ Regression test < **100%**
- ❌ Showstopper bugs ada
- ❌ OWASP compliance failed
- ❌ Critical path blocker belum resolved

---

## 🎯 QUALITY GATE DECISION

```
┌──────────────────────────────────────────────────┐
│ FINAL QUALITY GATE RESULT                        │
├──────────────────────────────────────────────────┤
│                                                  │
│  ☐ PASS ✓   → UAT dapat dimulai                 │
│                                                  │
│  ☐ FAIL ✗   → Kembali ke Development            │
│                                                  │
└──────────────────────────────────────────────────┘
```

**Jika FAIL, tuliskan rencana perbaikan:**
```
Prioritas 1 (Critical):
  • _____________________________________________
  • _____________________________________________

Prioritas 2 (High):
  • _____________________________________________
  
Target fix date: __________________
Rescheduled QG date: __________________
```

---

## 📋 SIGN-OFF

| Role | Nama Lengkap | Tanda Tangan | Tanggal | Catatan |
|---|---|---|---|---|
| QA Lead | __________________ | __________________ | __________ | |
| Dev Lead | __________________ | __________________ | __________ | |
| Project Manager | __________________ | __________________ | __________ | |
| Security Officer (if needed) | __________________ | __________________ | __________ | |

---

## 📊 METRICS SUMMARY

| Metric | Value | Target | Status |
|---|---|---|---|
| Code Coverage | __% | ≥80% | ☐ |
| SonarQube Blocker/Critical | __ | 0 | ☐ |
| Test Pass Rate | __% | 100% | ☐ |
| Known Showstopper Bugs | __ | 0 | ☐ |
| OWASP Compliance | __ | 100% | ☐ |

---

**Document prepared by:** ___________________________  
**Gate Date:** ___________________________  
**Next Review:** ___________________________
