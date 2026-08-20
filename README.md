# 🚧 Lekhva — Under Active Development

> **⚠️ This project is under active development and is NOT ready for production use.**

**Lekhva** is a modern enterprise resource planning (ERP) platform built with **Next.js 14** (App Router), **Drizzle ORM**, and **PostgreSQL**. It features Indian GST compliance, automated PDF invoicing, and a double-entry accounting ledger.

---

## 🤖 Built with Claude

This project is being developed with the help of **[Claude](https://claude.ai)** by Anthropic — used for architecture design, code generation, and iterative development.

---

## 🏗️ Current Status

| Module | Status |
|--------|--------|
| GST & HSN/SAC Schema | 🔨 In Progress |
| Place of Supply Engine | 🔨 In Progress |
| Double-Entry Ledger Hook | 📋 Planned |
| PDF Invoice Generation | 📋 Planned |
| Invoicing UI & API Routes | 📋 Planned |
| E2E Testing & Verification | 📋 Planned |

---

## ✨ Planned Features

- **Indian GST Compliance** — Automatic intra-state (CGST+SGST) vs inter-state (IGST) tax calculation
- **Automated PDF Invoicing** — GST Rule 46 compliant tax invoices via `@react-pdf/renderer`
- **Double-Entry Accounting** — Balanced journal entries posted automatically on invoice creation
- **Chart of Accounts** — Pre-configured accounts for Revenue, Receivables, and Output Tax liabilities

---

## 🛠️ Tech Stack

- **Framework:** Next.js 14 (App Router)
- **ORM:** Drizzle ORM
- **Database:** PostgreSQL
- **PDF Engine:** @react-pdf/renderer
- **Language:** TypeScript

---

## 📁 Project Structure

```
lekhva/
├── apps/web/src/
│   ├── app/              # Next.js App Router pages & API routes
│   ├── lib/gst/          # GST tax calculation engine
│   ├── lib/invoices/     # Invoice creation & ledger posting
│   └── lib/pdf/          # PDF invoice template & generation
├── packages/db/src/
│   └── schema/           # Drizzle ORM schemas (invoices, accounting)
└── tests/                # E2E & programmatic test suites
```

---

## 🚀 Getting Started

> **Note:** Setup instructions will be added once the project reaches a stable milestone.

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

<p align="center">
  <em>🚧 Under heavy development — stay tuned!</em>
</p>
