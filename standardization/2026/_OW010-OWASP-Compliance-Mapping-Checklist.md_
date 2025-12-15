# 📋 OW010 - OWASP Compliance Mapping & Audit Trail

**Dokumen Code:** `OW010`  
**Versi:** 1.0  
**Tanggal:** Desember 2025  
**Tujuan:** Memastikan seluruh proses pengembangan comply pada OWASP Top 10

---

## 📌 Info Proyek

- **Nama Proyek:** ______________________________
- **Periode:** __________________ s/d __________________
- **Project Manager:** ______________________________
- **Security Officer:** ______________________________

---

## 1. OWASP Top 10 Mapping ke SDLC Phase

| SDLC Phase | OWASP Category | Checklist / Evidence | PIC | Status |
|---|---|---|---|---|
| **Business Requirement / Blueprint** (BP070, BR010) | A01:  Broken Access Control<br>A03: Injection | Risk assessment per requirement, sensitive data mapping, security requirements documented | Analyst, Security Officer | ☐ |
| **Solution Design** (BP080, MD050) | A05: Security Misconfiguration<br>A07: Auth & Session Mgmt | Threat model, authentication flow diagram, authorization matrix | Architect, Developer | ☐ |
| **Development** (MD060, MD070) | A01–A10: All categories | Secure coding review, peer code review, static analysis report | Developer, Code Reviewer | ☐ |
| **Testing** (TE040, SV010) | All categories | Penetration test, vulnerability scan, APEX Sert/Advisor/Visualizer results | QA, Security Officer | ☐ |
| **Deployment** (SV010, SC020) | A09: Security Logging & Monitoring | Configuration review, audit logging enabled, security gate approval | Infrastructure, DevOps, Security | ☐ |
| **Go-Live & Post-Go-Live** (SA050) | All categories | Security incident monitoring, audit trail access, follow-up scan | Security, Project Manager | ☐ |

---

## 2. Phase-by-Phase Detailed Checklist

### **Phase 1: Business Requirement Analysis (BP070, BR010)**

**Focus:** Identifikasi data sensitif, akses control, security requirements

| No. | OWASP Item | Checklist | Owner | Evidence | Status |
|---|---|---|---|---|---|
| 1.1 | A01 - Broken Access Control | Identifikasi user roles & privilege mapping | Key User, Analyst | RACI Matrix, Role Definition | ☐ |
| 1.2 | A03 - Injection | Identifikasi input points yang perlu validasi | Analyst | Data flow diagram | ☐ |
| 1.3 | A04 - Insecure Design | Risk assessment:  data sensitivity level | Security Officer | Risk Register | ☐ |
| 1.4 | General | Security requirements documented dalam Blueprint | Analyst | Blueprint Doc with Sec Req section | ☐ |
| 1.5 | General | Risk assessment sign-off oleh management | Steering Committee | Approval signature | ☐ |

**Deliverable:** Risk Assessment Form + Signed Blueprint  
**Sign-off by:** Steering Committee, Security Officer

---

### **Phase 2: Solution Design & Technical Specification (BP080, MD050)**

**Focus:** Arkeitektur keamanan, konfigurasi, design review

| No. | OWASP Item | Checklist | Owner | Evidence | Status |
|---|---|---|---|---|---|
| 2.1 | A01, A07 | Authentication & authorization flow documented | Architect, Developer | Architecture Diagram, Flow Chart | ☐ |
| 2.2 | A02, A05 | Security configuration baseline defined | Architect | Configuration Specification | ☐ |
| 2.3 | A03 | Input validation & SQL injection prevention design | Developer | Technical Spec with validation rules | ☐ |
| 2.4 | A06 | Dependency list & vulnerable component check | Developer | Component Inventory | ☐ |
| 2.5 | A09 | Logging & monitoring points identified | DevOps, Security | Logging Design Document | ☐ |
| 2.6 | A08 | Data integrity mechanisms (checksums, hashing) | Architect | Data Integrity Design | ☐ |
| 2.7 | General | Threat Modeling session conducted | Architect, Security | Threat Model Diagram | ☐ |
| 2.8 | General | Design review sign-off | Project Manager, Security Officer | Design Review Meeting Notes | ☐ |

**Deliverable:** Technical Design Document + Threat Model  
**Sign-off by:** Project Manager, Security Officer

---

### **Phase 3: Development & Coding (MD060, MD070)**

**Focus:** Secure coding practices, code review, static analysis

| No. | OWASP Item | Checklist | Owner | Evidence | Status |
|---|---|---|---|---|---|
| 3.1 | All | Code follows secure coding standards (oracle-dev-standards. md) | Developer | Code Repository | ☐ |
| 3.2 | A03, A01 | **Peer code review COMPLETED** (Dev Standards Section 9 checklist) | Code Reviewer | Code Review Board / GitHub PR | ☐ |
| 3.3 | A01-A10 | **Static code analysis:  ZERO Blocker/Critical findings** | QA Engineer | SonarQube Report Link | ☐ |
| 3.4 | A03 | **No hardcoded credentials/secrets** | Security | SAST Secret Scan Report | ☐ |
| 3.5 | A07 | No hardcoded URLs, API keys, tokens | Developer | Code inspection | ☐ |
| 3.6 | A09 | Logging implemented per design (no sensitive data logged) | Developer | Code Inspection | ☐ |
| 3.7 | A02 | Encryption used for sensitive data at rest & transit | Developer | Code Review, Crypto Usage | ☐ |
| 3.8 | All | No use of deprecated/vulnerable APIs | Developer | SAST Report, Dependency Check | ☐ |
| 3.9 | General | Code review minutes & findings documented | Code Reviewer | Review Board Minutes | ☐ |
| 3.10 | General | Development lead sign-off | Dev Lead | Sign-off Form | ☐ |

**Deliverable:** Source code + Code Review Board minutes + SonarQube Report  
**Sign-off by:** Dev Lead, Security Officer

---

### **Phase 4: Testing & QA (TE040, SV010)**

**Focus:** Security testing, vulnerability scanning, UAT readiness

| No. | OWASP Item | Checklist | Owner | Evidence | Status |
|---|---|---|---|---|---|
| 4.1 | A01 | Authorization test:  All user roles tested per requirement | QA | Test Case Matrix & Results | ☐ |
| 4.2 | A03 | SQL Injection test cases:  ZERO successful injection | QA | Penetration Test Report | ☐ |
| 4.3 | A07 | Session timeout, re-authentication, logout tested | QA | Test Result | ☐ |
| 4.4 | A02, A09 | Encryption, audit logging verified in test environment | Security | Verification Report | ☐ |
| 4.5 | A05 | Configuration hardening validated | QA | Config Checklist | ☐ |
| 4.6 | A09 | Audit trail accessible, timestamps correct | QA | Audit Query Sample | ☐ |
| 4.7 | A10 | SSRF test cases (if applicable) | QA | Test Result | ☐ |
| 4.8 | All | **APEX Sert security scan COMPLETED** | Security | APEX Sert Report | ☐ |
| 4.9 | All | **APEX Advisor best practices CHECK** | Security | APEX Advisor Report | ☐ |
| 4.10 | All | **APEX Visualizer architecture review COMPLETED** | Security | APEX Visualizer Diagram | ☐ |
| 4.11 | All | Vulnerability remediation:  ALL Critical/High items FIXED | Developer, Security | Remediation Log, Rescan Report | ☐ |
| 4.12 | General | Security scan report (SV010) generated & reviewed | Security | SV010 Document | ☐ |
| 4.13 | General | Security gate decision:  APPROVED for deployment | Security Officer | Gate Approval Form | ☐ |

**Deliverable:** Test Report + Security Vulnerability Assessment Report (SV010)  
**Sign-off by:** Security Officer, QA Lead

---

### **Phase 5: Pre-Deployment & Configuration (SV010, SC020)**

**Focus:** Production readiness, configuration security, final checks

| No. | OWASP Item | Checklist | Owner | Evidence | Status |
|---|---|---|---|---|---|
| 5.1 | A05 | Production configuration reviewed vs. baseline | Infrastructure | Config Checklist | ☐ |
| 5.2 | A02 | Encryption certificates valid & configured correctly | Infrastructure | Cert Verification | ☐ |
| 5.3 | A09 | Audit logging fully configured & tested in production | DevOps | Log Sample Output | ☐ |
| 5.4 | A10 | HTTPS/TLS enabled for all endpoints, no HTTP | Infrastructure | SSL Report | ☐ |
| 5.5 | A05 | Debug mode DISABLED in production | Infrastructure | Config Check | ☐ |
| 5.6 | A07 | Session management configured (timeout, secure flags) | Developer | Config Review | ☐ |
| 5.7 | A01 | Authorization schemes double-checked in production | Developer | Verification | ☐ |
| 5.8 | All | **Security gate PASSED** (SV010 approved) | Security Officer | SV010 Approval | ☐ |
| 5.9 | All | **Pre-deployment security checklist (SC020) SIGNED** | Security Officer | SC020 Checklist | ☐ |
| 5.10 | General | Deployment plan reviewed for security implications | Deployment Lead | Deployment Plan | ☐ |

**Deliverable:** Deployment plan + SC020 signed checklist  
**Sign-off by:** Security Officer, Deployment Lead

---

### **Phase 6: Go-Live & Post-Go-Live Monitoring (SA050)**

**Focus:** Production monitoring, incident response, continuous compliance

| No. | OWASP Item | Checklist | Owner | Evidence | Status |
|---|---|---|---|---|---|
| 6.1 | All | Security incident log MONITORED (real-time, 24x7 for 1 week) | Security, Support | Incident Log | ☐ |
| 6.2 | A09 | Audit trail ACCESSIBLE & monitored for anomalies | Security | Audit Query | ☐ |
| 6.3 | All | Post-go-live security scan SCHEDULED (1 month post-live) | Security Officer | Schedule Confirmation | ☐ |
| 6.4 | All | Vulnerability disclosure policy ACTIVE | Security | Policy Doc | ☐ |
| 6.5 | A09 | Error logs monitored for security-related messages | Support | Log Report | ☐ |
| 6.6 | All | Patch management process for vulnerabilities initiated | Security | Patch Plan | ☐ |
| 6.7 | All | Security training refresher scheduled for support team | PM | Training Schedule | ☐ |
| 6.8 | General | Monthly security review meeting scheduled | Security Officer | Meeting Calendar | ☐ |

**Deliverable:** Monitoring log + Post-go-live incident report  
**Sign-off by:** Security Officer, Project Manager

---

## 3. Evidence Repository Structure

```
Project_Folder/
├── OWASP_Compliance/
│   ├── 1_Business_Requirements/
│   │   ├── Risk_Assessment. xlsx
│   │   ├── Approved_Blueprint.pdf
│   │   └── Risk_Register.xlsx
│   │
│   ├── 2_Solution_Design/
│   │   ├── Architecture_Diagram.pdf
│   │   ├── Threat_Model.pdf
│   │   ├── Technical_Specification. docx
│   │   └── Design_Review_Approval.pdf
│   │
│   ├── 3_Development/
│   │   ├── Code_Review_Board/
│   │   │   ├── Review_Checklist_Completed.xlsx
│   │   │   └── Review_Minutes. docx
│   │   ├── SonarQube_Reports/
│   │   │   ├── Report_v1.pdf
│   │   │   └── Report_Final.pdf
│   │   ├── SAST_Scan/
│   │   │   └── Secret_Scan_Report.pdf
│   │   └── Source_Code_Repo/
│   │       └── [GitHub/GitLab Link]
│   │
│   ├── 4_Testing/
│   │   ├── Test_Case_Matrix.xlsx
│   │   ├── Penetration_Test_Report.pdf
│   │   ├── APEX_Sert_Report. pdf
│   │   ├── APEX_Advisor_Report.pdf
│   │   ├── APEX_Visualizer_Analysis.pdf
│   │   └── Remediation_Log.xlsx
│   │
│   ├── 5_Deployment/
│   │   ├── Configuration_Checklist.pdf
│   │   ├── SC020_Security_Checklist.pdf
│   │   ├── Deployment_Plan. docx
│   │   └── Deployment_Approval.pdf
│   │
│   ├── 6_PostGoLive/
│   │   ├── Incident_Log.xlsx
│   │   ├── Audit_Trail_Sample.pdf
│   │   └── Security_Review_Minutes. docx
│   │
│   └── OWASP_Compliance_Summary.pdf (Final Report)
```

---

## 4. Evidence Checklist Summary

**Harus dipenuhi untuk closure:**

- [ ] Risk Assessment Form (ditandatangani)
- [ ] Threat Model Diagram
- [ ] Secure Code Review Checklist & Board Minutes
- [ ] SonarQube Static Analysis Report (0 Blocker/Critical)
- [ ] SAST Secret Scan Report
- [ ] Penetration Test / Security Scan Report
- [ ] APEX Sert Scan Report
- [ ] APEX Advisor Report
- [ ] Security Vulnerability Assessment Report (SV010)
- [ ] Security Checklist (SC020) - Signed
- [ ] Post-Go-Live Incident Log (1-2 minggu)
- [ ] Audit Trail Sample Query Result

---

## 5. Sign-off Authority

| Phase | Document | Signed by | Date |
|---|---|---|---|
| BP070/BR010 | Risk Assessment | Steering Committee | |
| BP080/MD050 | Design Review | Security Officer | |
| MD060/MD070 | Code Review Board | Dev Lead | |
| TE040/SV010 | Security Assessment | Security Officer | |
| SC020 | Pre-Deployment Security | Security Officer | |
| SA050 | Post-Go-Live | Project Manager | |

---

## 6. OWASP Compliance Metrics (Monthly)

| Metric | Target | Current | Status |
|---|---|---|---|
| % of findings remediated | 100% of Critical<br>90% of High | ___% | ☐ |
| SonarQube blocker issues | 0 | __ | ☐ |
| Penetration test passed | Yes | ☐ | ☐ |
| Security gate approved | Yes | ☐ | ☐ |

---

**Document prepared by:** ___________________________  
**Last Updated:** ___________________________  
**Next Review:** ___________________________
