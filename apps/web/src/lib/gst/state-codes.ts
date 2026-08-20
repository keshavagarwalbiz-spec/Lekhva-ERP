/**
 * Lekhva ERP - Indian State Codes for GST
 *
 * State codes as per Indian GST regulations.
 * Used for Place of Supply determination (intra-state vs inter-state).
 *
 * @module gst/state-codes
 */

export interface StateInfo {
  code: string;
  name: string;
  type: "state" | "union_territory";
}

/**
 * Complete mapping of Indian state codes to state names.
 * Codes follow the GST state code numbering system (01-38).
 */
export const INDIAN_STATE_CODES: Record<string, StateInfo> = {
  "01": { code: "01", name: "Jammu & Kashmir", type: "union_territory" },
  "02": { code: "02", name: "Himachal Pradesh", type: "state" },
  "03": { code: "03", name: "Punjab", type: "state" },
  "04": { code: "04", name: "Chandigarh", type: "union_territory" },
  "05": { code: "05", name: "Uttarakhand", type: "state" },
  "06": { code: "06", name: "Haryana", type: "state" },
  "07": { code: "07", name: "Delhi", type: "union_territory" },
  "08": { code: "08", name: "Rajasthan", type: "state" },
  "09": { code: "09", name: "Uttar Pradesh", type: "state" },
  "10": { code: "10", name: "Bihar", type: "state" },
  "11": { code: "11", name: "Sikkim", type: "state" },
  "12": { code: "12", name: "Arunachal Pradesh", type: "state" },
  "13": { code: "13", name: "Nagaland", type: "state" },
  "14": { code: "14", name: "Manipur", type: "state" },
  "15": { code: "15", name: "Mizoram", type: "state" },
  "16": { code: "16", name: "Tripura", type: "state" },
  "17": { code: "17", name: "Meghalaya", type: "state" },
  "18": { code: "18", name: "Assam", type: "state" },
  "19": { code: "19", name: "West Bengal", type: "state" },
  "20": { code: "20", name: "Jharkhand", type: "state" },
  "21": { code: "21", name: "Odisha", type: "state" },
  "22": { code: "22", name: "Chhattisgarh", type: "state" },
  "23": { code: "23", name: "Madhya Pradesh", type: "state" },
  "24": { code: "24", name: "Gujarat", type: "state" },
  "25": { code: "25", name: "Daman & Diu", type: "union_territory" },
  "26": { code: "26", name: "Dadra & Nagar Haveli", type: "union_territory" },
  "27": { code: "27", name: "Maharashtra", type: "state" },
  "28": { code: "28", name: "Andhra Pradesh (Old)", type: "state" },
  "29": { code: "29", name: "Karnataka", type: "state" },
  "30": { code: "30", name: "Goa", type: "state" },
  "31": { code: "31", name: "Lakshadweep", type: "union_territory" },
  "32": { code: "32", name: "Kerala", type: "state" },
  "33": { code: "33", name: "Tamil Nadu", type: "state" },
  "34": { code: "34", name: "Puducherry", type: "union_territory" },
  "35": { code: "35", name: "Andaman & Nicobar Islands", type: "union_territory" },
  "36": { code: "36", name: "Telangana", type: "state" },
  "37": { code: "37", name: "Andhra Pradesh", type: "state" },
  "38": { code: "38", name: "Ladakh", type: "union_territory" },
};

/**
 * Validates whether a given code is a valid Indian state code.
 */
export function isValidStateCode(code: string): boolean {
  return code in INDIAN_STATE_CODES;
}

/**
 * Returns the state name for a given state code.
 */
export function getStateName(code: string): string | undefined {
  return INDIAN_STATE_CODES[code]?.name;
}

/**
 * Determines if a transaction is inter-state based on supplier and customer state codes.
 * Inter-state = IGST applies. Intra-state = CGST + SGST applies.
 */
export function isInterStateTransaction(
  supplierStateCode: string,
  customerStateCode: string
): boolean {
  return supplierStateCode !== customerStateCode;
}
