/**
 * Lekhva ERP - Accounting Schema (Double-Entry Ledger)
 *
 * Drizzle ORM schema for the Phase 3 double-entry accounting system.
 * Includes Chart of Accounts, Journal Entries, and Journal Lines.
 *
 * @module schema/accounting
 */

import {
  pgTable,
  uuid,
  varchar,
  text,
  timestamp,
  decimal,
  boolean,
  pgEnum,
  integer,
} from "drizzle-orm/pg-core";
import { relations } from "drizzle-orm";

// ─── Enums ───────────────────────────────────────────────────────────

export const accountTypeEnum = pgEnum("account_type", [
  "asset",
  "liability",
  "equity",
  "revenue",
  "expense",
]);

export const journalStatusEnum = pgEnum("journal_status", [
  "draft",
  "posted",
  "reversed",
]);

// ─── Chart of Accounts ──────────────────────────────────────────────

/**
 * Chart of Accounts for the double-entry ledger.
 *
 * Default accounts for GST invoicing:
 * - 1200: Accounts Receivable (Asset)
 * - 2110: Output CGST Payable (Liability)
 * - 2120: Output SGST Payable (Liability)
 * - 2130: Output IGST Payable (Liability)
 * - 4000: Sales Revenue (Revenue)
 */
export const accounts = pgTable("accounts", {
  id: uuid("id").primaryKey().defaultRandom(),
  code: varchar("code", { length: 10 }).notNull().unique(),
  name: varchar("name", { length: 255 }).notNull(),
  type: accountTypeEnum("type").notNull(),
  description: text("description"),
  parentId: uuid("parent_id"), // For sub-accounts / hierarchy
  isActive: boolean("is_active").default(true).notNull(),
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().notNull(),
});

// ─── Journal Entries ─────────────────────────────────────────────────

export const journalEntries = pgTable("journal_entries", {
  id: uuid("id").primaryKey().defaultRandom(),
  entryNumber: varchar("entry_number", { length: 50 }).notNull().unique(),
  date: timestamp("date").notNull(),
  status: journalStatusEnum("status").default("draft").notNull(),
  description: text("description"),
  reference: varchar("reference", { length: 255 }), // e.g. "INV-2024-001"
  referenceType: varchar("reference_type", { length: 50 }), // e.g. "invoice"
  referenceId: uuid("reference_id"), // e.g. invoice UUID

  // Verification
  isBalanced: boolean("is_balanced").default(false).notNull(),
  totalDebit: decimal("total_debit", { precision: 15, scale: 2 }).default("0").notNull(),
  totalCredit: decimal("total_credit", { precision: 15, scale: 2 }).default("0").notNull(),

  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().notNull(),
});

// ─── Journal Lines ───────────────────────────────────────────────────

export const journalLines = pgTable("journal_lines", {
  id: uuid("id").primaryKey().defaultRandom(),
  journalEntryId: uuid("journal_entry_id")
    .notNull()
    .references(() => journalEntries.id, { onDelete: "cascade" }),
  accountId: uuid("account_id")
    .notNull()
    .references(() => accounts.id),
  lineNumber: integer("line_number").notNull(),
  description: text("description"),
  debit: decimal("debit", { precision: 15, scale: 2 }).default("0").notNull(),
  credit: decimal("credit", { precision: 15, scale: 2 }).default("0").notNull(),
  createdAt: timestamp("created_at").defaultNow().notNull(),
});

// ─── Relations ───────────────────────────────────────────────────────

export const accountsRelations = relations(accounts, ({ many }) => ({
  journalLines: many(journalLines),
}));

export const journalEntriesRelations = relations(journalEntries, ({ many }) => ({
  lines: many(journalLines),
}));

export const journalLinesRelations = relations(journalLines, ({ one }) => ({
  journalEntry: one(journalEntries, {
    fields: [journalLines.journalEntryId],
    references: [journalEntries.id],
  }),
  account: one(accounts, {
    fields: [journalLines.accountId],
    references: [accounts.id],
  }),
}));

// ─── Seed Data: Default Chart of Accounts ────────────────────────────

/**
 * Default Chart of Accounts for Indian GST-compliant businesses.
 * Use this to seed the database on first run.
 */
export const DEFAULT_CHART_OF_ACCOUNTS = [
  // Assets
  { code: "1000", name: "Cash & Bank", type: "asset" as const },
  { code: "1100", name: "Bank Account", type: "asset" as const },
  { code: "1200", name: "Accounts Receivable", type: "asset" as const },
  { code: "1300", name: "Input CGST Receivable", type: "asset" as const },
  { code: "1310", name: "Input SGST Receivable", type: "asset" as const },
  { code: "1320", name: "Input IGST Receivable", type: "asset" as const },

  // Liabilities
  { code: "2000", name: "Accounts Payable", type: "liability" as const },
  { code: "2110", name: "Output CGST Payable", type: "liability" as const },
  { code: "2120", name: "Output SGST Payable", type: "liability" as const },
  { code: "2130", name: "Output IGST Payable", type: "liability" as const },
  { code: "2200", name: "TDS Payable", type: "liability" as const },

  // Equity
  { code: "3000", name: "Owner's Equity", type: "equity" as const },
  { code: "3100", name: "Retained Earnings", type: "equity" as const },

  // Revenue
  { code: "4000", name: "Sales Revenue", type: "revenue" as const },
  { code: "4100", name: "Service Revenue", type: "revenue" as const },
  { code: "4200", name: "Other Income", type: "revenue" as const },

  // Expenses
  { code: "5000", name: "Cost of Goods Sold", type: "expense" as const },
  { code: "5100", name: "Salaries & Wages", type: "expense" as const },
  { code: "5200", name: "Rent Expense", type: "expense" as const },
  { code: "5300", name: "Office Supplies", type: "expense" as const },
  { code: "5900", name: "Miscellaneous Expense", type: "expense" as const },
] as const;
