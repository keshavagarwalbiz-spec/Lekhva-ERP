
# Lekhva ERP — Master Plan & Roadmap

This document outlines the 8-phase (~34 weeks) architectural roadmap for building Lekhva, the complete enterprise platform replacing Tally, Zoho People, ClearTax, and more.

## Phase 1 — Foundation & Infrastructure (Weeks 1-4)
- **Security & DPDP Act Compliance:** 2FA (TOTP/SMS), AES-256 encryption, RBAC, PII protection, audit logs.
- **Workflow Engine:** Drag-and-drop approval chains (Sequential, Parallel, Auto-Approve).
- **Notification System:** In-app, Email, SMS, WhatsApp, Push with branded templates.
- **SaaS Billing:** 14-day trial, Razorpay subscriptions, plan enforcement.
- **Ledger & Masters:** Multi-tenant double-entry bookkeeping, hierarchical COA, DMS.
- **Onboarding:** Product tour, sample data mode, setup wizard.

## Phase 2 — Invoicing, Inventory & Sales (Weeks 5-8) [MVP LAUNCH]
- **Premium Print Templates:** 30+ pre-built drag-and-drop templates (Modern, Classic, Thermal).
- **GST Invoicing Engine:** Auto tax calculation, E-way bills, recurring invoices, PDF generation.
- **Multi-Warehouse Inventory:** FIFO/Weighted Average, GRN, Batch tracking, Landed cost.
- **Sales & Purchase:** Quote -> SO -> Invoice -> Payment workflow. 3-way match for POs.
- **Super-Admin Panel:** Tenant management, user impersonation, system health.

## Phase 3 — E-Commerce, Shipping & Industry (Weeks 9-12)
- **E-Commerce Sync Engine:** Adapters for Amazon, Flipkart, Shopify, WooCommerce.
- **Shipping Integration:** Shiprocket/Delhivery API, auto-AWB, RTO management.
- **Industry Templates:** Retail POS, Medical/Pharma, Jewelry, Restaurant POS, Manufacturing BOM.
- **Tally Migration:** XML/JSON parser and wizard.
- **Commission Tracking:** Agent master and auto-compute.

## Phase 4 — Compliance, Payments & Assets (Weeks 13-16)
- **GST Filing Engine:** GSTR-1, GSTR-3B, GSTR-2B reconciliation, E-Invoicing (v1.04).
- **Payments & Banking:** Payment gateway links, MT940 bank reconciliation, Penny-drop payouts.
- **Fixed Asset Register:** Lifecycle tracking, dual depreciation (IT Act + Companies Act).
- **Open API:** REST endpoints with webhooks.

## Phase 5 — HRMS + Payroll + Employee Portal (Weeks 17-22)
- **HRMS:** Org structure, recruitment pipeline, onboarding, attendance (GPS/biometric), leave policies, performance (OKRs).
- **Payroll:** Statutory computations (EPF, ESI, PT, LWF, TDS), payslips, Form 16, Full & Final settlement.
- **Employee Portal:** Self-service dashboard, expense claims, tax declarations (Form 12BB), help desk.
- **Project/Job Costing:** Time tracking, cost allocation, milestone billing.
- **Contract/AMC Management:** SLA tracking, auto-renewal alerts, deferred revenue.

## Phase 6 — Tax Filing & Planning (Weeks 23-26)
- **ITR Filing (1-7):** Auto-populate from GL, CBDT JSON generation, e-file.
- **TDS Returns:** 24Q, 26Q, 27Q, 27EQ with challan mapping.
- **26AS/AIS Reconciliation:** 3-way match.
- **Tax Planning:** Old vs New regime comparator, 80C/80D optimizer, Advance Tax tracking.

## Phase 7 — Financial Intelligence, AI & CRM (Weeks 27-30)
- **Financial Intelligence:** DCF valuation, 25+ ratios, budget variance, loan calculators.
- **AI Engine:** Invoice OCR (Google Vision + Gemini), NLP queries, anomaly detection, predictive cash flow, smart reconciliation.
- **CRM:** Pipeline Kanban, Contact 360, WhatsApp/Email automation.
- **Reports & Help Center:** Exportable reports, searchable knowledge base.

## Phase 8 — Cross-Platform & Add-ons (Weeks 31-34)
- **Desktop App:** Tauri 2.0 (offline POS, thermal printing).
- **Mobile App:** Capacitor 6 (barcode scanning, GPS attendance).
- **Multi-Language:** Hindi UI & regional framework.
- **B2B Portal:** Customer self-service.
- **Social Media:** Post scheduling & analytics.
- **RoC/MCA & Customs:** Compliance reminders, customs duty calculation.
