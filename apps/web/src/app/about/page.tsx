
import Link from "next/link";
import { ArrowRight, Code2, Heart, Flag } from "lucide-react";

export default function AboutPage() {
  return (
    <div className="bg-white text-slate-900 font-sans pt-20">
      
      {/* HEADER */}
      <section className="bg-slate-50 py-24 px-6 border-b border-slate-200 text-center">
        <div className="max-w-4xl mx-auto">
          <h1 className="text-5xl md:text-7xl font-bold tracking-tight text-slate-900 mb-6">
            Built for India.<br />Built for the future.
          </h1>
          <p className="text-xl md:text-2xl text-slate-600 leading-relaxed max-w-2xl mx-auto">
            Our mission is to liberate Indian businesses from archaic legacy software and expensive SaaS subscriptions.
          </p>
        </div>
      </section>

      {/* THE STORY */}
      <section className="py-24 px-6 max-w-4xl mx-auto">
        <div className="prose prose-lg prose-slate max-w-none">
          <h2 className="text-3xl font-bold text-slate-900 mb-6">The Legacy Problem</h2>
          <p className="text-slate-600 mb-8 leading-relaxed">
            For decades, Indian businesses have relied on a fragmented stack of legacy desktop software to run their operations. You use one software for accounting, another for HR, and yet another for tax filing. It is expensive, siloed, and frustrating.
          </p>
          <p className="text-slate-600 mb-12 leading-relaxed">
            Tally costs ₹54,000. Zoho Books costs ₹30,000. Most businesses use less than 10% of the features they are paying for, while struggling to keep their data synced across platforms. We believe Indian businesses deserve better.
          </p>

          <h2 className="text-3xl font-bold text-slate-900 mb-6">The Lekhva Philosophy</h2>
          <p className="text-slate-600 mb-8 leading-relaxed">
            Lekhva was built from the ground up as a unified, cloud-native ERP. We didn&apos;t just build an accounting tool—we built a complete operating system that scales from a single retail shop to a multi-company MNC.
          </p>
          
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8 my-16">
            <div className="bg-slate-50 p-8 rounded-2xl border border-slate-200 text-center">
              <Flag className="w-10 h-10 text-blue-600 mx-auto mb-4" />
              <h3 className="font-bold text-slate-900 mb-2">India First</h3>
              <p className="text-sm text-slate-600">Built natively for the complex Indian taxation system (GST/TDS/ITR).</p>
            </div>
            <div className="bg-slate-50 p-8 rounded-2xl border border-slate-200 text-center">
              <Code2 className="w-10 h-10 text-blue-600 mx-auto mb-4" />
              <h3 className="font-bold text-slate-900 mb-2">Modern Stack</h3>
              <p className="text-sm text-slate-600">Built on Next.js, Supabase, and Drizzle. Fast, secure, and infinitely scalable.</p>
            </div>
            <div className="bg-slate-50 p-8 rounded-2xl border border-slate-200 text-center">
              <Heart className="w-10 h-10 text-blue-600 mx-auto mb-4" />
              <h3 className="font-bold text-slate-900 mb-2">Customer Obsessed</h3>
              <p className="text-sm text-slate-600">Transparent pricing, open APIs, and absolutely zero vendor lock-in.</p>
            </div>
          </div>

          <h2 className="text-3xl font-bold text-slate-900 mb-6">Our Promise</h2>
          <p className="text-slate-600 mb-8 leading-relaxed">
            We promise to always keep the core platform accessible. We promise to never hold your data hostage (export your data as JSON or CSV at any time). And we promise to keep building the features you actually need, not just the ones that look good on a marketing page.
          </p>
        </div>
      </section>

      {/* CTA */}
      <section className="py-24 px-6 bg-blue-600 text-center">
        <div className="max-w-3xl mx-auto">
          <h2 className="text-4xl font-bold text-white mb-6">Join the revolution.</h2>
          <p className="text-blue-100 text-xl mb-10">Stop paying for software from the 90s. Migrate to Lekhva today.</p>
          <Link href="/pricing" className="bg-white text-blue-900 px-8 py-4 rounded-lg text-lg font-bold hover:bg-slate-100 transition-colors inline-flex items-center gap-2 shadow-xl shadow-blue-900/20">
            View Pricing <ArrowRight className="w-5 h-5" />
          </Link>
        </div>
      </section>

    </div>
  );
}
