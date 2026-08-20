/**
 * Lekhva ERP - GST Module
 *
 * Public API for the GST tax calculation engine.
 *
 * @module gst
 */

export { calculateGST } from "./calculate";
export type {
  CalculateGSTParams,
  GSTLineItem,
  GSTCalculationResult,
  TaxLineItemResult,
} from "./calculate";

export {
  INDIAN_STATE_CODES,
  isValidStateCode,
  getStateName,
  isInterStateTransaction,
} from "./state-codes";
export type { StateInfo } from "./state-codes";

export { numberToWords } from "./number-to-words";
