/**
 * Lekhva ERP - Invoice & Customer Schema
 *
 * Drizzle ORM schema definitions for the invoicing system.
 * Includes customers, invoices, and invoice line items with
 * full GST field support (GSTIN, HSN/SAC, Place of Supply).
 *
 * @module schema/invoices
 */

import {
  pgTable,
  uuid,
  varchar,
  text,
  timestamp,
  decimal,
  integer,
  boolean,
  pgEnum,
} from "drizzle-orm/pg-core";
import { relations } from "drizzle-orm";

// ─── Enums ───────────────────────────────────────────────────────────

export const invoiceStatusEnum = pgEnum("invoice_status", [
  "draft",
  "issued",
  "paid",
  "cancelled",
  "overdue",
]);

// ─── Customers ───────────────────────────────────────────────────────

export const customers = pgTable("customers", {
  id: uuid("id").primaryKey().defaultRandom(),
  name: varchar("name", { length: 255 }).notNull(),
  email: varchar("email", { length: 255 }),
  phone: varchar("phone", { length: 20 }),
  gstin: varchar("gstin", { length: 15 }), // 15-char GSTIN
  pan: varchar("pan", { length: 10 }),
  stateCode: varchar("state_code", { length: 2 }).notNull(), // GST state code
  billingAddress: text("billing_address"),
  shippingAddress: text("shipping_address"),
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().notNull(),
});

// ─── Invoices ────────────────────────────────────────────────────────

export const invoices = pgTable("invoices", {
  id: uuid("id").primaryKey().defaultRandom(),
  invoiceNumber: varchar("invoice_number", { length: 50 }).notNull().unique(),
  customerId: uuid("customer_id")
    .notNull()
    .references(() => customers.id),
  status: invoiceStatusEnum("status").default("draft").notNull(),

  // Dates
  invoiceDate: timestamp("invoice_date").notNull(),
  dueDate: timestamp("due_date").notNull(),

  // GST Details
  supplierGstin: varchar("supplier_gstin", { length: 15 }).notNull(),
  supplierStateCode: varchar("supplier_state_code", { length: 2 }).notNull(),
  customerGstin: varchar("customer_gstin", { length: 15 }),
  customerStateCode: varchar("customer_state_code", { length: 2 }).notNull(),
  placeOfSupply: varchar("place_of_supply", { length: 2 }).notNull(),
  isInterState: boolean("is_inter_state").notNull(),

  // Amounts (stored as decimal strings for precision)
  taxableSubtotal: decimal("taxable_subtotal", { precision: 15, scale: 2 }).notNull(),
  totalCgst: decimal("total_cgst", { precision: 15, scale: 2 }).default("0").notNull(),
  totalSgst: decimal("total_sgst", { precision: 15, scale: 2 }).default("0").notNull(),
  totalIgst: decimal("total_igst", { precision: 15, scale: 2 }).default("0").notNull(),
  totalTax: decimal("total_tax", { precision: 15, scale: 2 }).notNull(),
  roundOff: decimal("round_off", { precision: 15, scale: 2 }).default("0"),
  grandTotal: decimal("grand_total", { precision: 15, scale: 2 }).notNull(),
  amountInWords: text("amount_in_words"),

  // Metadata
  notes: text("notes"),
  journalEntryId: uuid("journal_entry_id"), // Link to double-entry ledger
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().notNull(),
});

// ─── Invoice Line Items ──────────────────────────────────────────────

export const invoiceItems = pgTable("invoice_items", {
  id: uuid("id").primaryKey().defaultRandom(),
  invoiceId: uuid("invoice_id")
    .notNull()
    .references(() => invoices.id, { onDelete: "cascade" }),
  itemId: uuid("item_id"), // Optional reference to product/service catalog
  description: varchar("description", { length: 500 }).notNull(),
  hsnSacCode: varchar("hsn_sac_code", { length: 8 }).notNull(),
  quantity: integer("quantity").notNull(),
  unitPrice: decimal("unit_price", { precision: 15, scale: 2 }).notNull(),
  discountAmount: decimal("discount_amount", { precision: 15, scale: 2 }).default("0"),
  taxableAmount: decimal("taxable_amount", { precision: 15, scale: 2 }).notNull(),

  // Tax breakdown per line item
  gstRate: decimal("gst_rate", { precision: 5, scale: 2 }).notNull(),
  cgstRate: decimal("cgst_rate", { precision: 5, scale: 2 }).default("0"),
  cgstAmount: decimal("cgst_amount", { precision: 15, scale: 2 }).default("0"),
  sgstRate: decimal("sgst_rate", { precision: 5, scale: 2 }).default("0"),
  sgstAmount: decimal("sgst_amount", { precision: 15, scale: 2 }).default("0"),
  igstRate: decimal("igst_rate", { precision: 5, scale: 2 }).default("0"),
  igstAmount: decimal("igst_amount", { precision: 15, scale: 2 }).default("0"),
  totalAmount: decimal("total_amount", { precision: 15, scale: 2 }).notNull(),

  createdAt: timestamp("created_at").defaultNow().notNull(),
});

// ─── Relations ───────────────────────────────────────────────────────

export const customersRelations = relations(customers, ({ many }) => ({
  invoices: many(invoices),
}));

export const invoicesRelations = relations(invoices, ({ one, many }) => ({
  customer: one(customers, {
    fields: [invoices.customerId],
    references: [customers.id],
  }),
  items: many(invoiceItems),
}));

export const invoiceItemsRelations = relations(invoiceItems, ({ one }) => ({
  invoice: one(invoices, {
    fields: [invoiceItems.invoiceId],
    references: [invoices.id],
  }),
}));
