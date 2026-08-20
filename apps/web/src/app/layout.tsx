import "./globals.css";
import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Lekhva ERP",
  description: "Lekhva makes you compliant. Not another ERP on a subscription, a partner in your growth.",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className="antialiased bg-[#0b0a09] text-white">
        {children}
      </body>
    </html>
  );
}
