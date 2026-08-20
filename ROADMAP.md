# Lekhva ERP — Roadmap

> This document tracks the development roadmap for Lekhva ERP.

## 🏁 Phase 1 — Foundation (Current)
- [x] Project setup (monorepo, TypeScript, configs)
- [x] GST calculation engine (CGST/SGST/IGST)
- [x] Indian state codes & Place of Supply logic
- [x] Number to words (Indian numbering system)
- [x] Database schemas (Customers, Invoices, Invoice Items)
- [x] Accounting schemas (Chart of Accounts, Journal Entries)
- [ ] Database migrations & seed scripts

## 🔧 Phase 2 — Core Services
- [ ] Invoice creation service with DB transactions
- [ ] Double-entry ledger posting hook (auto journal entries)
- [ ] GSTIN validation (format + checksum)
- [ ] HSN/SAC code lookup & validation
- [ ] Invoice number auto-generation (financial year based)

## 📄 Phase 3 — PDF & UI
- [ ] PDF invoice template (@react-pdf/renderer)
- [ ] GST Rule 46 compliance (all mandatory fields)
- [ ] Rupee font support in PDFs
- [ ] Next.js Invoice list page (`/invoices`)
- [ ] Create invoice form (`/invoices/new`)
- [ ] Invoice detail & PDF download (`/invoices/[id]`)
- [ ] Customer management UI

## 📊 Phase 4 — Reports & Analytics
- [ ] GST return data export (GSTR-1, GSTR-3B)
- [ ] Profit & Loss statement
- [ ] Balance Sheet
- [ ] Tax liability dashboard
- [ ] Accounts receivable aging report

## 🚀 Phase 5 — Advanced
- [ ] Multi-tenant support
- [ ] E-invoicing (IRN generation via NIC portal)
- [ ] E-way bill integration
- [ ] Payment gateway integration (Razorpay/UPI)
- [ ] Mobile responsive PWA

---

*This roadmap is updated as development progresses. Built with Claude by Anthropic.*
