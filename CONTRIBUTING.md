# Contributing to Lekhva

Thank you for your interest in contributing to **Lekhva ERP**! 🎉

> **Note:** This project is in early active development. We welcome contributions of all kinds — code, documentation, bug reports, and feature suggestions.

---

## 🚀 Getting Started

### Prerequisites

- **Node.js** >= 18.x
- **pnpm** >= 8.x (recommended) or npm
- **PostgreSQL** >= 15.x
- **TypeScript** >= 5.x

### Setup

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/Lekhva-ERP.git
   cd Lekhva-ERP
   ```
3. Install dependencies:
   ```bash
   pnpm install
   ```
4. Copy the environment file:
   ```bash
   cp .env.example .env
   ```
5. Set up your local PostgreSQL database and update `.env`
6. Run database migrations:
   ```bash
   pnpm db:migrate
   ```
7. Start the development server:
   ```bash
   pnpm dev
   ```

---

## 📋 How to Contribute

### Reporting Bugs

- Open an issue with the **Bug Report** template
- Include steps to reproduce, expected behavior, and screenshots if applicable

### Suggesting Features

- Open an issue with the **Feature Request** template
- Describe the use case and why it would benefit Indian SMBs

### Submitting Code

1. Create a new branch from `main`:
   ```bash
   git checkout -b feature/your-feature-name
   ```
2. Make your changes
3. Write or update tests as needed
4. Ensure all tests pass:
   ```bash
   pnpm test
   ```
5. Commit with a descriptive message:
   ```bash
   git commit -m "feat: add HSN code validation"
   ```
6. Push and open a Pull Request

---

## 🏗️ Project Structure

```
lekhva/
├── apps/web/                 # Next.js 14 frontend & API
│   └── src/
│       ├── app/              # App Router pages & routes
│       ├── lib/gst/          # GST calculation engine
│       ├── lib/invoices/     # Invoice service & ledger hooks
│       └── lib/pdf/          # PDF invoice generator
├── packages/db/              # Drizzle ORM schemas & migrations
│   └── src/schema/           # Database schema definitions
└── tests/                    # E2E & integration tests
```

---

## 📝 Commit Convention

We follow [Conventional Commits](https://www.conventionalcommits.org/):

| Prefix | Purpose |
|--------|---------|
| `feat:` | New feature |
| `fix:` | Bug fix |
| `docs:` | Documentation changes |
| `refactor:` | Code refactoring |
| `test:` | Adding or updating tests |
| `chore:` | Maintenance tasks |

---

## 🤝 Code of Conduct

- Be respectful and inclusive
- Provide constructive feedback
- Help others learn and grow

---

## 📄 License

By contributing, you agree that your contributions will be licensed under the [MIT License](LICENSE).

---

**Built with ❤️ and Claude by Anthropic**
