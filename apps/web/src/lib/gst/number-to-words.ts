/**
 * Lekhva ERP - Number to Words (Indian Numbering System)
 *
 * Converts numeric amounts to words following the Indian numbering system
 * (Lakhs, Crores) for use on GST invoices.
 *
 * @module gst/number-to-words
 */

const ONES = [
  "", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine",
  "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen",
  "Seventeen", "Eighteen", "Nineteen",
];

const TENS = [
  "", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety",
];

/**
 * Converts a number less than 1000 to words.
 */
function convertHundreds(num: number): string {
  if (num === 0) return "";

  let result = "";

  if (num >= 100) {
    result += ONES[Math.floor(num / 100)] + " Hundred";
    num %= 100;
    if (num > 0) result += " and ";
  }

  if (num >= 20) {
    result += TENS[Math.floor(num / 10)];
    num %= 10;
    if (num > 0) result += " " + ONES[num];
  } else if (num > 0) {
    result += ONES[num];
  }

  return result;
}

/**
 * Converts a numeric amount to words in the Indian numbering system.
 *
 * Uses Lakhs (1,00,000) and Crores (1,00,00,000) instead of
 * Millions and Billions.
 *
 * @example
 * ```ts
 * numberToWords(1500)    // "One Thousand Five Hundred Rupees Only"
 * numberToWords(250000)  // "Two Lakh Fifty Thousand Rupees Only"
 * numberToWords(1234.50) // "One Thousand Two Hundred and Thirty Four Rupees and Fifty Paise Only"
 * ```
 */
export function numberToWords(amount: number): string {
  if (amount === 0) return "Zero Rupees Only";

  const isNegative = amount < 0;
  amount = Math.abs(amount);

  // Split into rupees and paise
  const rupees = Math.floor(amount);
  const paise = Math.round((amount - rupees) * 100);

  let result = "";

  if (rupees > 0) {
    const crores = Math.floor(rupees / 10000000);
    const lakhs = Math.floor((rupees % 10000000) / 100000);
    const thousands = Math.floor((rupees % 100000) / 1000);
    const hundreds = rupees % 1000;

    const parts: string[] = [];

    if (crores > 0) {
      parts.push(convertHundreds(crores) + " Crore");
    }
    if (lakhs > 0) {
      parts.push(convertHundreds(lakhs) + " Lakh");
    }
    if (thousands > 0) {
      parts.push(convertHundreds(thousands) + " Thousand");
    }
    if (hundreds > 0) {
      parts.push(convertHundreds(hundreds));
    }

    result = parts.join(" ") + " Rupees";
  }

  if (paise > 0) {
    if (result) result += " and ";
    result += convertHundreds(paise) + " Paise";
  }

  result += " Only";

  if (isNegative) {
    result = "Minus " + result;
  }

  return result;
}
