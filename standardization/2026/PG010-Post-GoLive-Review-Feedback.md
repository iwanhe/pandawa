# 📋 PG010 - Post-Go-Live Review & Continuous Feedback Loop

**Dokumen Code:** `PG010`  
**Versi:** 1.0  
**Tanggal:** Desember 2025  
**Tujuan:** Menangkap feedback, monitor issues, dan continuous improvement pasca produksi

---

## 📌 Info Proyek

- **Nama Proyek:** ______________________________
- **Go-Live Date:** ______________________________
- **Project Manager:** ______________________________
- **QA Lead:** ______________________________
- **Support Lead:** ______________________________

---

## 📅 Jadwal Post-Go-Live Review

- [ ] **T+2 hari** - Alert Response Check
- [ ] **T+1 minggu** - Initial Feedback Collection
- [ ] **T+1 bulan** - Stability Assessment
- [ ] **T+3 bulan** - Success Metrics & Lessons Learned

---

## 🚨 PHASE A:  T+2 HARI - Go-Live Alert Response

**Form:  `PG010-A`**

| Item | Target | Actual | Owner | Evidence/Notes | Status |
|---|---|---|---|---|---|
| System uptime | > 99.5% | __% | Infrastructure | Monitoring dashboard | ☐ OK<br>☐ ISSUE |
| Critical bugs reported | 0 | __ | QA/Support | Incident log | ☐ CLEAR<br>☐ ISSUES |
| Users accessing system | > 80% | __% | Support | User count report | ☐ OK<br>☐ LOW |
| Performance (baseline) | Normal | __ms | Infrastructure | Response time log | ☐ OK<br>☐ SLOW |
| Security incidents | 0 | __ | Security | Incident log | ☐ CLEAR<br>☐ FOUND |
| **Data integrity check** | OK | | DBA | Reconciliation report | ☐ OK<br>☐ ISSUES |

**Action if issues found:**
- Priority:  ___________________
- Owner: ___________________
- Target resolution: ___________________

**Sign-off:** Infrastructure Lead ____________  Project Manager ____________

---

## 📝 PHASE B: T+1 MINGGU - Initial Feedback Collection

**Form: `PG010-B`**

### **B1.  User Satisfaction Survey**

**Target:** End Users (min.  30 responses), Key Users, Management  
**Method:** Online survey / Interviews  
**Timing:** Day 7-10 post go-live  
**Scale:** 1 = Sangat Buruk | 5 = Sangat Baik

#### **Survey Questions:**

| No. | Question | Score (1-5) | Comments |
|---|---|---|---|
| 1 | **Kemudahan penggunaan sistem** | ☐1 ☐2 ☐3 ☐4 ☐5 | |
| 2 | **Kecepatan/performance sistem** | ☐1 ☐2 ☐3 ☐4 ☐5 | |
| 3 | **Akurasi data yang ditampilkan** | ☐1 ☐2 ☐3 ☐4 ☐5 | |
| 4 | **Responsiveness tim support** | ☐1 ☐2 ☐3 ☐4 ☐5 | |
| 5 | **Kualitas training yang diterima** | ☐1 ☐2 ☐3 ☐4 ☐5 | |
| 6 | **Kepuasan keseluruhan** | ☐1 ☐2 ☐3 ☐4 ☐5 | |

#### **Survey Metrics Calculation:**

```
CSAT (Customer Satisfaction Score) = Average of all scores
Target: > 4.0 / 5.0

NPS (Net Promoter Score) = % Promoters (score 4-5) - % Detractors (score 1-2)
Target: > 40

Formula: 
  Promoters = Skor 5 = ___%
  Passives = Skor 4 = ___%
  Detractors = Skor 1-3 = ___%
  NPS = Promoters - Detractors = ___%
```

**Result:**
- **CSAT Score:** ___/5 | Status: ☐ Excellent | ☐ Good | ☐ Need Improvement | ☐ Poor
- **NPS Score:** ___% | Status: ☐ Excellent | ☐ Good | ☐ Need Improvement | ☐ Poor

---

### **B2. Incident & Bug Report Summary**

**Periode:** Day 1 - Day 10 post go-live

| Severity | Count | Examples | Status | Owner |
|---|---|---|---|---|
| **CRITICAL** | __ | List:  _______________ | ☐ Resolved<br>☐ In Progress | |
| **HIGH** | __ | List: _______________ | ☐ Resolved<br>☐ In Progress | |
| **MEDIUM** | __ | List: _______________ | ☐ Resolved<br>☐ In Progress | |
| **LOW** | __ | List: _______________ | ☐ Backlog | |

---

### **B3. Root Cause Analysis (for Critical/High bugs)**

**Template for each Critical/High issue:**

```
─────────────────────────────────────────────
Bug ID: ________________
Severity: ☐ CRITICAL  ☐ HIGH
Title: _________________________________
Description: 
  ____________________________________
  ____________________________________
  
Root Cause Analysis:
  Primary Cause: _____________________
  Contributing Factors: ______________
  
Category: 
  ☐ Code defect / Logic error
  ☐ Design flaw
  ☐ Environment/Infrastructure issue
  ☐ Data/Migration issue
  ☐ Configuration error
  ☐ Other:  ________________________
  
Business Impact:
  Users affected: ____________
  Workaround: ________________
  
Resolution:
  Fix approach: ________________
  Owner: ________________ 
  ETA: ________
  
Resolution date: ________________
─────────────────────────────────────────────
```

---

### **B4. Feedback dari Users & Management**

**Open-ended questions:**

1. **Apa fitur atau proses yang paling membantu sejak go-live?**
   ```
   _____________________________________________
   _____________________________________________
   ```

2. **Apakah ada kesulitan, bug, atau masalah utama yang dihadapi?**
   ```
   _____________________________________________
   _____________________________________________
   ```

3. **Saran perbaikan atau enhancement untuk tim development:**
   ```
   _____________________________________________
   _____________________________________________
   ```

---

**Sign-off:** QA Lead ____________  PM ____________  
**Survey Compiled Date:** __________________

---

## 📊 PHASE C: T+1 BULAN - Stability & Performance Assessment

**Form: `PG010-C`**

### **C1. System Health Metrics (1 month cumulative)**

| Metric | Target | Actual | Status | Owner | Notes |
|---|---|---|---|---|---|
| **System Availability** | > 99.5% | __% | ☐ PASS<br>☐ FAIL | Infra | Downtime:  ___min |
| **Average Response Time** | < 2 sec | ___sec | ☐ OK<br>☐ SLOW | Infra | Peak: ___sec |
| **Critical Issues Resolved** | 100% | ___% | ☐ PASS<br>☐ FAIL | QA | Pending: ___ |
| **High Issues Resolved** | 95% | ___% | ☐ PASS<br>☐ FAIL | QA | Pending: ___ |
| **User Adoption Rate** | > 90% | ___% | ☐ PASS<br>☐ FAIL | PM | Coverage: ___ |
| **Support Ticket SLA (first response)** | > 95% met | ___% | ☐ PASS<br>☐ FAIL | Support | Avg response: ___ |
| **Security Incidents** | 0 | __ | ☐ CLEAR<br>☐ FOUND | Security | Incidents: ___ |
| **Data Loss / Corruption Incidents** | 0 | __ | ☐ CLEAR<br>☐ FOUND | DBA | Count: ___ |

---

### **C2. Data Integrity Check**

**Activities to perform:**

- [ ] Sample data validation (compare 5-10 records with legacy system)
- [ ] Opening balance reconciliation (ledger vs. system)
- [ ] Transaction volume consistency (count vs. legacy)
- [ ] Archive/cleanup processes verified
- [ ] Data quality metrics reviewed

**Findings:**
```
Data Validation Result:   ☐ PASSED  ☐ ISSUES FOUND

If issues found:
  Issue:  _________________________________
  Impact: _________________________________
  Fix: _________________________________
  Owner: _____________ ETA: __________
```

---

### **C3. Performance Baseline Validation**

| Component | Baseline | Current | Status | Notes |
|---|---|---|---|---|
| DB Query Time (top 10 queries) | __ms | __ms | ☐ OK | |
| Report generation time | __sec | __sec | ☐ OK | |
| Batch job duration | __min | __min | ☐ OK | |
| File upload speed | __MB/s | __MB/s | ☐ OK | |
| System Load during peak hours | __% | __% | ☐ OK | |

---

**Sign-off:** Infrastructure Lead ____________  PM ____________

---

## 💡 PHASE D: T+3 BULAN - Success Metrics & Lessons Learned

**Form: `PG010-D`**

### **D1. Business Success Metrics**

**Compare:** Baseline (Legacy System) vs. Current (1-month) vs. Current (3-month)

| KPI / Business Metric | Baseline<br>(Legacy) | Target<br>Post-Implementation | Actual<br>(1 Month) | Actual<br>(3 Months) | Variance | Status |
|---|---|---|---|---|---|---|
| **Process cycle time** | _____ | _____ | _____ | _____ | ___% | ☐ |
| **Cost per transaction** | _____ | _____ | _____ | _____ | ___% | ☐ |
| **Error/exception rate** | ___% | ___% | ___% | ___% | ___% | ☐ |
| **User productivity (trans/hr)** | _____ | _____ | _____ | _____ | ___% | ☐ |
| **Customer satisfaction** | ___/5 | ___/5 | ___/5 | ___/5 | ___% | ☐ |
| **ROI realization** | N/A | ___% | ___% | ___% | ___% | ☐ |

**Conclusion:**
```
Overall business value realization:  ☐ Exceeded  ☐ Met  ☐ Below Target
Summary: ____________________________________________________________________
```

---

### **D2. Technical Success Metrics (3-month cumulative)**

| Metric | Target | Achieved | Status | Notes |
|---|---|---|---|---|
| **System uptime (3-month average)** | > 99.5% | __% | ☐ PASS<br>☐ FAIL | |
| **Critical bugs in production** | 0-2 | __ | ☐ PASS<br>☐ FAIL | |
| **Security incidents** | 0 | __ | ☐ PASS<br>☐ FAIL | |
| **Data loss / corruption incidents** | 0 | __ | ☐ PASS<br>☐ FAIL | |
| **Change success rate (hotfixes/patches)** | > 95% | __% | ☐ PASS<br>☐ FAIL | |
| **Performance compliance (vs. baseline)** | > 95% | __% | ☐ PASS<br>☐ FAIL | |

---

### **D3. Lessons Learned Documentation**

**Team Retrospective Session:**
- **Date:** __________________
- **Attendees:** __________________
- **Facilitator:** __________________

#### **What Went Well ✓**

| Category | Achievement | Owner | Impact |
|---|---|---|---|
| **Process** | | | |
| **People** | | | |
| **Technology** | | | |
| **Communication** | | | |

---

#### **What Could Improve**

| Category | Issue | Root Cause | Suggested Action | Owner | Priority |
|---|---|---|---|---|---|
| **Process** | | | | | HIGH<br>MEDIUM<br>LOW |
| **People** | | | | | |
| **Technology** | | | | | |
| **Communication** | | | | | |
| **Risks/Assumptions** | | | | | |

---

#### **Action Items & Continuous Improvement**

| Item | Action | Owner | Target Date | Status | Update To |
|---|---|---|---|---|---|
| 1. | | | | ☐ Open | ☐ apps-implementation-methodology. md<br>☐ oracle-dev-standards.md<br>☐ Other guideline |
| 2. | | | | ☐ Open | |
| 3. | | | | ☐ Open | |

---

### **D4. Stakeholder Satisfaction & Executive Summary Report**

**Report Date:** ___________________  
**Reporting Period:** T+0 hingga T+3 bulan

#### **Executive Summary**

```
PROJECT CLOSURE ASSESSMENT
Project: _______________
Go-Live Date: _______________
Assessment Date: _______________

KEY METRICS:
  ├─ CSAT Score (User Satisfaction): __/5
  ├─ NPS Score (Net Promoter Score): ___%
  ├─ System Uptime: ___%
  ├─ Critical Issues: __ (target: 0)
  ├─ Data Integrity: ☐ Passed ☐ Issues
  ├─ ROI Status: __% realized (target: ___%)
  └─ Overall Project Status: ☐ SUCCESS ☐ SUCCESS w/ ISSUES ☐ CHALLENGES

RECOMMENDATION: 
  ☐ Project CLOSED - Ready for sustainment
  ☐ Project CLOSED with known issues (list below)
  ☐ Project EXTENDED - Continue optimization phase

Known Issues / Pending Items:
  • _________________________________________________
  • _________________________________________________

Next Steps:
  • _________________________________________________
  • _________________________________________________
```

---

### **D5. Stakeholder Communications**

**Report audience:** Steering Committee, Executive Management, Sponsor

- [ ] Executive summary prepared
- [ ] Presentation scheduled for Steering Committee
- [ ] Success stories documented
- [ ] Lessons learned shared with organization
- [ ] Project closure approved

---

## 🔄 PHASE E:  ONGOING - Continuous Feedback & Monitoring

**Post-project continuous improvement:**

### **Monitoring Cadence**

```
├─ Daily (T+1 week to T+1 month):
│   ├─ Infrastructure monitoring (uptime, performance)
│   ├─ Incident log review
│   └─ Critical issue escalation
│
├─ Weekly (T+1 month onwards):
│   ├─ Support team standup
│   ├─ Bug triage & prioritization
│   └─ User feedback summary
│
├─ Monthly: 
│   ├─ User feedback session (quick survey / town hall)
│   ├─ Metrics review & dashboard update
│   └─ Performance health check
│
└─ Quarterly:
    ├─ Full assessment against success metrics
    ├─ Roadmap planning for enhancements
    └─ Security & compliance review
```

---

### **Continuous Improvement Log**

**Updated monthly, reviewed quarterly**

| Date | Issue/Feedback | Category | Owner | Status | Resolution/Next Step |
|---|---|---|---|---|---|
| | | ☐ Bug<br>☐ Enhancement<br>☐ Process<br>☐ Performance | | ☐ Open<br>☐ In Progress<br>☐ Closed | |
| | | | | | |
| | | | | | |

---

## 📋 SIGN-OFF & APPROVAL

| Phase | Activity | Date | Owner | Sign-off |
|---|---|---|---|---|
| T+2 days | Alert Response | | Infra Lead | |
| T+1 week | Initial Feedback | | PM | |
| T+1 month | Stability Assessment | | Tech Lead | |
| T+3 months | Success Metrics & LL | | PM | |
| Final | Project Closure | | Project Sponsor | |

---

**Document prepared by:** ___________________________  
**First Review Date:** ___________________________  
**Last Updated:** ___________________________  
**Next Quarterly Review:** ___________________________
