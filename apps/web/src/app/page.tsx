
"use client";

import { motion, useScroll, useTransform } from "framer-motion";
import { ArrowRight, Code2, Database, ShieldCheck, Zap } from "lucide-react";
import { useRef } from "react";

const StarIcon = () => (
  <svg viewBox="0 0 24 24" aria-hidden="true" className="w-6 h-6 fill-amber-500 opacity-80">
    <path d="M12 0Q13.1 10.9 24 12Q13.1 13.1 12 24Q10.9 13.1 0 12Q10.9 10.9 12 0Z"></path>
  </svg>
);

export default function Home() {
  const containerRef = useRef(null);
  const { scrollYProgress } = useScroll({
    target: containerRef,
    offset: ["start start", "end end"]
  });

  return (
    <main ref={containerRef} className="min-h-screen relative overflow-x-hidden selection:bg-amber-500/30">
      {/* Grid Background */}
      <div className="fixed inset-0 pointer-events-none opacity-[0.03] z-0" 
           style={{ backgroundImage: "linear-gradient(#fff 1px, transparent 1px), linear-gradient(90deg, #fff 1px, transparent 1px)", backgroundSize: "4rem 4rem" }}>
      </div>

      {/* Hero Section */}
      <section className="relative min-h-screen flex flex-col justify-center items-center px-4 pt-20 z-10">
        <motion.div 
          initial={{ opacity: 0, y: 50 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 1, ease: "easeOut" }}
          className="text-center max-w-4xl mx-auto"
        >
          <div className="flex justify-center mb-6">
            <StarIcon />
          </div>
          <h1 className="text-5xl md:text-7xl font-serif font-medium tracking-tight mb-6 text-neutral-100">
            Lekhva makes you <span className="text-amber-500">compliant.</span>
          </h1>
          <p className="text-xl md:text-2xl text-neutral-400 mb-10 font-light max-w-2xl mx-auto">
            Not another ERP on a subscription, a partner in your growth.
          </p>
          
          <motion.a 
            whileHover={{ scale: 1.05 }}
            whileTap={{ scale: 0.95 }}
            href="https://github.com/keshavagarwalbiz-spec/Lekhva-ERP" 
            className="inline-flex items-center gap-2 bg-white text-black px-8 py-4 rounded-full font-medium hover:bg-neutral-200 transition-colors"
          >
            Star on GitHub <ArrowRight className="w-4 h-4" />
          </motion.a>
        </motion.div>
      </section>

      {/* Chapter 1: The Problem */}
      <section className="relative min-h-screen flex flex-col justify-center px-4 md:px-20 z-10">
        <motion.div 
          initial={{ opacity: 0, x: -50 }}
          whileInView={{ opacity: 1, x: 0 }}
          viewport={{ once: true, margin: "-20%" }}
          transition={{ duration: 0.8 }}
          className="max-w-3xl"
        >
          <p className="text-amber-500 font-mono text-sm tracking-widest uppercase mb-4">Ch. 1 — The Problem</p>
          <h2 className="text-4xl md:text-6xl font-serif mb-6 leading-tight">
            Indian SMBs pay ₹50,000 a year for software they barely use.
          </h2>
          <p className="text-xl text-neutral-400 leading-relaxed">
            Tally costs ₹54,000. Zoho Books costs ₹30,000. ClearTax costs ₹24,000. Most businesses use less than 10% of the features they are paying for. We think that is wrong.
          </p>
        </motion.div>
      </section>

      {/* Chapter 2: The Engine */}
      <section className="relative min-h-screen flex flex-col justify-center px-4 md:px-20 z-10 bg-neutral-950/50">
        <motion.div 
          initial={{ opacity: 0, x: 50 }}
          whileInView={{ opacity: 1, x: 0 }}
          viewport={{ once: true, margin: "-20%" }}
          transition={{ duration: 0.8 }}
          className="max-w-3xl ml-auto text-right"
        >
          <p className="text-amber-500 font-mono text-sm tracking-widest uppercase mb-4">Ch. 2 — The Engine</p>
          <h2 className="text-4xl md:text-6xl font-serif mb-6 leading-tight">
            We calculate it.
          </h2>
          <p className="text-xl text-neutral-400 leading-relaxed mb-8">
            38 state codes. Automatic Place of Supply detection. Intra-state gets CGST + SGST. Inter-state gets IGST. Zero manual tax calculation, zero errors.
          </p>
          
          <div className="flex justify-end gap-4">
            <div className="bg-neutral-900 p-6 rounded-2xl border border-neutral-800 text-left w-64">
              <Zap className="text-amber-500 mb-4" />
              <h3 className="text-white font-medium mb-2">Automated Rules</h3>
              <p className="text-neutral-500 text-sm">Instant tax determination based on state codes.</p>
            </div>
            <div className="bg-neutral-900 p-6 rounded-2xl border border-neutral-800 text-left w-64">
              <ShieldCheck className="text-amber-500 mb-4" />
              <h3 className="text-white font-medium mb-2">100% Compliant</h3>
              <p className="text-neutral-500 text-sm">Always up to date with Indian GST law.</p>
            </div>
          </div>
        </motion.div>
      </section>

      {/* Chapter 3: The Ledger */}
      <section className="relative min-h-screen flex flex-col justify-center px-4 md:px-20 z-10">
        <motion.div 
          initial={{ opacity: 0, y: 50 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-20%" }}
          transition={{ duration: 0.8 }}
          className="max-w-4xl mx-auto text-center"
        >
          <p className="text-amber-500 font-mono text-sm tracking-widest uppercase mb-4">Ch. 3 — The Ledger</p>
          <h2 className="text-4xl md:text-6xl font-serif mb-6 leading-tight">
            We balance it.
          </h2>
          <p className="text-xl text-neutral-400 leading-relaxed mb-12">
            Every invoice auto-posts a balanced journal entry. Debit Accounts Receivable. Credit Sales Revenue. Credit Output Tax. Always balanced. Always accurate.
          </p>

          <div className="bg-neutral-900 rounded-3xl p-8 border border-neutral-800 text-left mx-auto shadow-2xl">
             <div className="flex justify-between text-neutral-500 font-mono text-sm border-b border-neutral-800 pb-4 mb-4">
                <span>ACCOUNT</span>
                <div className="flex gap-12">
                  <span>DEBIT</span>
                  <span>CREDIT</span>
                </div>
             </div>
             <div className="space-y-4 font-mono">
                <div className="flex justify-between items-center">
                  <span className="text-neutral-300">Accounts Receivable</span>
                  <div className="flex gap-12">
                    <span className="text-white">₹11,800</span>
                    <span className="text-neutral-600">--</span>
                  </div>
                </div>
                <div className="flex justify-between items-center">
                  <span className="text-neutral-400 ml-4">Sales Revenue</span>
                  <div className="flex gap-12">
                    <span className="text-neutral-600">--</span>
                    <span className="text-white">₹10,000</span>
                  </div>
                </div>
                <div className="flex justify-between items-center">
                  <span className="text-neutral-400 ml-4">Output IGST (18%)</span>
                  <div className="flex gap-12">
                    <span className="text-neutral-600">--</span>
                    <span className="text-white">₹1,800</span>
                  </div>
                </div>
             </div>
          </div>
        </motion.div>
      </section>

      {/* Chapter 4: The Terms */}
      <section className="relative min-h-[70vh] flex flex-col justify-center items-center px-4 z-10 bg-black">
        <motion.div 
          initial={{ opacity: 0, scale: 0.95 }}
          whileInView={{ opacity: 1, scale: 1 }}
          viewport={{ once: true, margin: "-20%" }}
          transition={{ duration: 0.8 }}
          className="text-center max-w-2xl"
        >
          <p className="text-amber-500 font-mono text-sm tracking-widest uppercase mb-4">Ch. 4 — The Terms</p>
          <h2 className="text-4xl md:text-6xl font-serif mb-6">
            Free. Open source. Forever.
          </h2>
          <p className="text-xl text-neutral-400 mb-8">
            MIT licensed. Self-host it, fork it, own your data. No vendor lock-in, no monthly SaaS fees. You keep everything.
          </p>
          <div className="inline-block border border-neutral-800 bg-neutral-900 rounded-full px-6 py-2 text-sm text-neutral-300">
            <span className="font-semibold text-white">Full disclosure:</span> Built with Claude AI by Anthropic. Every line reviewed by a human.
          </div>
        </motion.div>
      </section>

      {/* Footer */}
      <footer className="border-t border-neutral-900 py-12 px-4 md:px-20 flex flex-col md:flex-row justify-between items-center z-10 relative">
        <div className="flex items-center gap-4 mb-4 md:mb-0">
          <StarIcon />
          <span className="font-serif text-2xl tracking-wide">LEKHVA</span>
        </div>
        <div className="text-neutral-500 text-sm flex gap-6">
          <span>MIT LICENSE</span>
          <span>OPEN SOURCE</span>
          <span>INDIA</span>
        </div>
        <a href="mailto:keshavagarwalbiz@gmail.com" className="text-amber-500 hover:text-amber-400 transition-colors mt-4 md:mt-0">
          keshavagarwalbiz@gmail.com
        </a>
      </footer>
    </main>
  );
}
