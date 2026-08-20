/**
 * Lekhva ERP - Schema Barrel Exports
 *
 * Central export point for all Drizzle ORM schemas.
 *
 * @module schema
 */

// Invoice & Customer schemas
export {
  customers,
  invoices,
  invoiceItems,
  invoiceStatusEnum,
  customersRelations,
  invoicesRelations,
  invoiceItemsRelations,
} from "./invoices";

// Accounting & Ledger schemas
export {
  accounts,
  journalEntries,
  journalLines,
  accountTypeEnum,
  journalStatusEnum,
  accountsRelations,
  journalEntriesRelations,
  journalLinesRelations,
  DEFAULT_CHART_OF_ACCOUNTS,
} from "./accounting";
