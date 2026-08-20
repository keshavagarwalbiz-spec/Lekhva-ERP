/**
 * Lekhva ERP - GST Tax Calculation Engine
 *
 * Calculates CGST, SGST, and IGST based on Place of Supply rules.
 * Supports intra-state (CGST+SGST) and inter-state (IGST) transactions.
 *
 * @module gst/calculate
 */

import { isInterStateTransaction, isValidStateCode } from "./state-codes";

// ─── Types ───────────────────────────────────────────────────────────

export interface GSTLineItem {
  itemId?: string;
  description: string;
  hsnSacCode: string;
  quantity: number;
  unitPrice: number;
  gstRate: number; // e.g. 18 for 18%
  discountAmount?: number;
}

export interface CalculateGSTParams {
  supplierStateCode: string;
  customerStateCode: string;
  items: GSTLineItem[];
}

export interface TaxLineItemResult {
  description: string;
  hsnSacCode: string;
  quantity: number;
  unitPrice: number;
  taxableAmount: number;
  gstRate: number;
  isInterState: boolean;
  cgstRate: number;
  cgstAmount: number;
  sgstRate: number;
  sgstAmount: number;
  igstRate: number;
  igstAmount: number;
  totalTax: number;
  totalAmount: number;
}

export interface GSTCalculationResult {
  isInterState: boolean;
  taxableSubtotal: number;
  totalCgst: number;
  totalSgst: number;
  totalIgst: number;
  totalTax: number;
  roundOff: number;
  grandTotal: number;
  lineItems: TaxLineItemResult[];
}

// ─── Helpers ─────────────────────────────────────────────────────────

/**
 * Rounds a number to 2 decimal places using banker's rounding.
 */
function roundTo2(value: number): number {
  return Math.round((value + Number.EPSILON) * 100) / 100;
}

/**
 * Calculates the round-off amount to make the grand total a whole number.
 * As per Indian GST invoicing practice, invoices are rounded to nearest rupee.
 */
function calculateRoundOff(amount: number): number {
  const rounded = Math.round(amount);
  return roundTo2(rounded - amount);
}

// ─── Main Calculator ─────────────────────────────────────────────────

/**
 * Calculates GST for a list of invoice items based on Place of Supply.
 *
 * - **Intra-state** (same state): Splits GST into CGST (50%) + SGST (50%)
 * - **Inter-state** (different state): Applies full rate as IGST
 *
 * @example
 * ```ts
 * const result = calculateGST({
 *   supplierStateCode: "27", // Maharashtra
 *   customerStateCode: "29", // Karnataka (inter-state → IGST)
 *   items: [{
 *     description: "Web Development Service",
 *     hsnSacCode: "998314",
 *     quantity: 1,
 *     unitPrice: 50000,
 *     gstRate: 18,
 *   }],
 * });
 * // result.isInterState → true
 * // result.totalIgst → 9000
 * // result.grandTotal → 59000
 * ```
 */
export function calculateGST(params: CalculateGSTParams): GSTCalculationResult {
  const { supplierStateCode, customerStateCode, items } = params;

  // Validate state codes
  if (!isValidStateCode(supplierStateCode)) {
    throw new Error(`Invalid supplier state code: ${supplierStateCode}`);
  }
  if (!isValidStateCode(customerStateCode)) {
    throw new Error(`Invalid customer state code: ${customerStateCode}`);
  }
  if (items.length === 0) {
    throw new Error("At least one line item is required");
  }

  const isInterState = isInterStateTransaction(supplierStateCode, customerStateCode);

  let taxableSubtotal = 0;
  let totalCgst = 0;
  let totalSgst = 0;
  let totalIgst = 0;

  const lineItems: TaxLineItemResult[] = items.map((item) => {
    // Calculate taxable amount after discount
    const grossAmount = roundTo2(item.quantity * item.unitPrice);
    const discount = item.discountAmount ?? 0;
    const taxableAmount = roundTo2(grossAmount - discount);

    if (taxableAmount < 0) {
      throw new Error(
        `Negative taxable amount for item "${item.description}". Check quantity, price, and discount.`
      );
    }

    // Calculate tax components
    let cgstRate = 0;
    let cgstAmount = 0;
    let sgstRate = 0;
    let sgstAmount = 0;
    let igstRate = 0;
    let igstAmount = 0;

    if (isInterState) {
      // Inter-state: Full rate as IGST
      igstRate = item.gstRate;
      igstAmount = roundTo2((taxableAmount * igstRate) / 100);
    } else {
      // Intra-state: Split 50/50 into CGST + SGST
      cgstRate = roundTo2(item.gstRate / 2);
      sgstRate = roundTo2(item.gstRate / 2);
      cgstAmount = roundTo2((taxableAmount * cgstRate) / 100);
      sgstAmount = roundTo2((taxableAmount * sgstRate) / 100);
    }

    const totalTax = roundTo2(cgstAmount + sgstAmount + igstAmount);
    const totalAmount = roundTo2(taxableAmount + totalTax);

    // Accumulate totals
    taxableSubtotal += taxableAmount;
    totalCgst += cgstAmount;
    totalSgst += sgstAmount;
    totalIgst += igstAmount;

    return {
      description: item.description,
      hsnSacCode: item.hsnSacCode,
      quantity: item.quantity,
      unitPrice: item.unitPrice,
      taxableAmount,
      gstRate: item.gstRate,
      isInterState,
      cgstRate,
      cgstAmount,
      sgstRate,
      sgstAmount,
      igstRate,
      igstAmount,
      totalTax,
      totalAmount,
    };
  });

  // Round totals
  taxableSubtotal = roundTo2(taxableSubtotal);
  totalCgst = roundTo2(totalCgst);
  totalSgst = roundTo2(totalSgst);
  totalIgst = roundTo2(totalIgst);

  const totalTax = roundTo2(totalCgst + totalSgst + totalIgst);
  const subtotalWithTax = roundTo2(taxableSubtotal + totalTax);
  const roundOff = calculateRoundOff(subtotalWithTax);
  const grandTotal = Math.round(subtotalWithTax);

  return {
    isInterState,
    taxableSubtotal,
    totalCgst,
    totalSgst,
    totalIgst,
    totalTax,
    roundOff,
    grandTotal,
    lineItems,
  };
}
