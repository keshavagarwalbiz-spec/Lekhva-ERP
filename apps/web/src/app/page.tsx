
"use client";

import { motion, AnimatePresence } from "framer-motion";
import Link from "next/link";
import { useState, useEffect } from "react";
import { 
  ArrowRight, CheckCircle2, ShieldCheck, Zap, Store, Building, Building2, 
  Calculator, FileCheck2, Server, Pill, Gem, Factory, Utensils, ScanSearch, LineChart, Code2
} from "lucide-react";

const industries = [
  { id: "pharma", name: "Medical / Pharma", icon: Pill, desc: "Schedule H/H1 warnings, FEFO batch expiry tracking, and DPCO compliance built-in." },
  { id: "jewelry", name: "Jewelry / Bullion", icon: Gem, desc: "HUID per piece, Karat tracking, live making charges, wastage calculation, and AML mandate." },
  { id: "manufacturing", name: "Manufacturing", icon: Factory, desc: "Multi-level BOM, inventory mixing, job work (Rule 55), and automated ITC-04 filing." },
  { id: "restaurant", name: "Restaurant / POS", icon: Utensils, desc: "Table management, KOT/KDS routing, split billing, Zomato/Swiggy sync, and recipe costing." }
];

export default function Home() {
  const [activeIndustry, setActiveIndustry] = useState(industries[0]);
  
  // Terminal typing effect state
  const [terminalText, setTerminalText] = useState("");
  const fullText = "> initializing lekhva_erp...\n> loading multi_company_ledger [ok]\n> syncing gstin_api [ok]\n> starting ai_ocr_engine [ready]\n\nSystem Online. Awaiting commands.";

  useEffect(() => {
    let i = 0;
    const interval = setInterval(() => {
      setTerminalText(fullText.substring(0, i));
      i++;
      if (i > fullText.length) clearInterval(interval);
    }, 40);
    return () => clearInterval(interval);
  }, []);

  return (
    <div className="bg-slate-50 text-slate-900 font-sans overflow-hidden">
      
      {/* 1. HERO SECTION */}
      <section className="relative pt-32 pb-48 px-6 bg-[#0B1120] overflow-hidden">
        <div className="absolute inset-0 bg-[linear-gradient(to_right,#ffffff05_1px,transparent_1px),linear-gradient(to_bottom,#ffffff05_1px,transparent_1px)] bg-[size:32px_32px]" />
        <div className="absolute top-[-20%] left-[-10%] w-[50%] h-[50%] rounded-full bg-blue-600/20 blur-[120px]" />
        <div className="absolute bottom-[-10%] right-[-10%] w-[40%] h-[40%] rounded-full bg-indigo-600/20 blur-[120px]" />

        <div className="max-w-7xl mx-auto relative z-10 flex flex-col items-center text-center">
          <motion.div 
            initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }}
            className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-blue-500/10 border border-blue-500/20 text-blue-300 text-sm font-semibold mb-8 backdrop-blur-md"
          >
            <Zap className="w-4 h-4 text-emerald-400" /> Lekhva v5 is now live
          </motion.div>
          
          <motion.h1 
            initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.1 }}
            className="text-5xl md:text-7xl lg:text-[5.5rem] font-bold tracking-tight text-white max-w-6xl mb-6 leading-[1.1]"
          >
            From a small retail shop.<br/>
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-400 to-indigo-400">
              To a big MNC.
            </span>
          </motion.h1>
          
          <motion.p 
            initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.2 }}
            className="text-xl md:text-2xl text-slate-400 max-w-3xl mb-12 leading-relaxed"
          >
            We&apos;ve got it all covered. Lekhva unifies Tally-grade accounting, modern HRMS, automated GST filing, and E-commerce sync into one highly scalable cloud platform.
          </motion.p>
          
          <motion.div 
            initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.3 }}
            className="flex flex-col sm:flex-row gap-4 w-full sm:w-auto"
          >
            <Link href="/pricing" className="bg-blue-600 text-white px-8 py-4 rounded-xl text-lg font-bold hover:bg-blue-500 hover:-translate-y-1 transition-all shadow-lg shadow-blue-600/25 flex items-center justify-center gap-2">
              Start Free Trial <ArrowRight className="w-5 h-5" />
            </Link>
            <Link href="/contact" className="bg-white/5 text-white border border-white/10 backdrop-blur-md px-8 py-4 rounded-xl text-lg font-bold hover:bg-white/10 transition-colors flex items-center justify-center">
              Book a Demo
            </Link>
          </motion.div>
        </div>
      </section>

      {/* 2. TEXT/CODE PULL-UP (REPLACES THE IMAGE) */}
      <section className="relative z-20 px-6 max-w-7xl mx-auto -mt-32 mb-12">
        <motion.div 
          initial={{ opacity: 0, y: 40 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.5, duration: 0.8 }}
          className="w-full bg-[#050505] rounded-2xl md:rounded-[2rem] border border-slate-700/50 p-6 md:p-12 shadow-[0_0_60px_rgba(0,0,0,0.5)] flex flex-col md:flex-row gap-12 items-center"
        >
          {/* Left Side: Code Terminal Effect */}
          <div className="w-full md:w-1/2 font-mono text-sm md:text-base text-emerald-400 bg-black/50 p-6 rounded-xl border border-white/5 h-48 flex items-start justify-start text-left whitespace-pre-wrap">
            {terminalText}
            <span className="w-2 h-4 bg-emerald-400 inline-block animate-pulse ml-1" />
          </div>

          {/* Right Side: Text Highlights */}
          <div className="w-full md:w-1/2 space-y-6">
            <div className="flex items-start gap-4">
              <div className="w-10 h-10 rounded-full bg-blue-500/20 flex items-center justify-center shrink-0 border border-blue-500/30">
                <ShieldCheck className="w-5 h-5 text-blue-400" />
              </div>
              <div>
                <h4 className="text-xl font-bold text-white mb-1">SOC2 & DPDP Compliant</h4>
                <p className="text-slate-400 text-sm">Your data is secured with bank-grade 256-bit AES encryption.</p>
              </div>
            </div>
            
            <div className="flex items-start gap-4">
              <div className="w-10 h-10 rounded-full bg-indigo-500/20 flex items-center justify-center shrink-0 border border-indigo-500/30">
                <Calculator className="w-5 h-5 text-indigo-400" />
              </div>
              <div>
                <h4 className="text-xl font-bold text-white mb-1">Tally XML Import</h4>
                <p className="text-slate-400 text-sm">Import 3 years of Tally history in 1-click with our smart parser.</p>
              </div>
            </div>

            <div className="flex items-start gap-4">
              <div className="w-10 h-10 rounded-full bg-emerald-500/20 flex items-center justify-center shrink-0 border border-emerald-500/30">
                <Code2 className="w-5 h-5 text-emerald-400" />
              </div>
              <div>
                <h4 className="text-xl font-bold text-white mb-1">Developer API</h4>
                <p className="text-slate-400 text-sm">Connect your own apps via REST API and Webhooks.</p>
              </div>
            </div>
          </div>
        </motion.div>
      </section>

      {/* 3. STATS BAR */}
      <section className="border-b border-slate-200 bg-white py-12 px-6">
        <div className="max-w-7xl mx-auto grid grid-cols-2 md:grid-cols-4 gap-8 divide-x divide-slate-100 text-center">
          <div><h4 className="text-4xl font-bold text-slate-900 mb-2">28</h4><p className="text-sm font-semibold text-slate-500 uppercase">Core Modules</p></div>
          <div><h4 className="text-4xl font-bold text-blue-600 mb-2">38</h4><p className="text-sm font-semibold text-slate-500 uppercase">State Codes Configured</p></div>
          <div><h4 className="text-4xl font-bold text-slate-900 mb-2">100%</h4><p className="text-sm font-semibold text-slate-500 uppercase">GSTN Compliant</p></div>
          <div><h4 className="text-4xl font-bold text-blue-600 mb-2">30+</h4><p className="text-sm font-semibold text-slate-500 uppercase">Print Templates</p></div>
        </div>
      </section>

      {/* 4. THE SCALE SECTION: SHOP TO MNC */}
      <section className="py-32 px-6 max-w-7xl mx-auto">
        <div className="text-center mb-20">
          <h2 className="text-4xl md:text-5xl font-bold text-slate-900 mb-6 tracking-tight">Built to scale with you.</h2>
          <p className="text-xl text-slate-600 max-w-2xl mx-auto">Never migrate software again. Turn features on and off as your business grows.</p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          
          <motion.div initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} className="bg-white rounded-3xl p-8 border border-slate-200 shadow-lg hover:shadow-xl transition-shadow relative overflow-hidden group">
            <div className="absolute top-0 right-0 w-24 h-24 bg-emerald-50 rounded-bl-full -z-10 group-hover:scale-150 transition-transform duration-500" />
            <Store className="w-10 h-10 text-emerald-600 mb-6" />
            <h3 className="text-2xl font-bold text-slate-900 mb-2">Small Retail Shop</h3>
            <p className="text-slate-500 font-medium mb-6">Day 1 Operations</p>
            <ul className="space-y-4">
              <li className="flex items-start gap-3 text-slate-600"><CheckCircle2 className="w-5 h-5 text-emerald-500 shrink-0 mt-0.5" /> 58mm/80mm thermal receipt printing</li>
              <li className="flex items-start gap-3 text-slate-600"><CheckCircle2 className="w-5 h-5 text-emerald-500 shrink-0 mt-0.5" /> Barcode scanning & basic inventory</li>
              <li className="flex items-start gap-3 text-slate-600"><CheckCircle2 className="w-5 h-5 text-emerald-500 shrink-0 mt-0.5" /> Fast POS interface with UPI QR</li>
            </ul>
          </motion.div>

          <motion.div initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: 0.1 }} className="bg-blue-600 rounded-3xl p-8 border border-blue-500 shadow-xl shadow-blue-600/20 relative overflow-hidden text-white transform md:-translate-y-4">
            <div className="absolute top-0 right-0 w-32 h-32 bg-blue-500/50 rounded-bl-full -z-10 blur-xl" />
            <Building className="w-10 h-10 text-blue-200 mb-6" />
            <h3 className="text-2xl font-bold mb-2">Growing SME</h3>
            <p className="text-blue-200 font-medium mb-6">Expanding the Team</p>
            <ul className="space-y-4">
              <li className="flex items-start gap-3 text-blue-50"><CheckCircle2 className="w-5 h-5 text-blue-300 shrink-0 mt-0.5" /> Multi-warehouse Landed Costs</li>
              <li className="flex items-start gap-3 text-blue-50"><CheckCircle2 className="w-5 h-5 text-blue-300 shrink-0 mt-0.5" /> Full HRMS, Payroll, and GPS Attendance</li>
              <li className="flex items-start gap-3 text-blue-50"><CheckCircle2 className="w-5 h-5 text-blue-300 shrink-0 mt-0.5" /> Automated GSTR-1/3B filing</li>
              <li className="flex items-start gap-3 text-blue-50"><CheckCircle2 className="w-5 h-5 text-blue-300 shrink-0 mt-0.5" /> Amazon & Shopify Sync</li>
            </ul>
          </motion.div>

          <motion.div initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: 0.2 }} className="bg-slate-900 rounded-3xl p-8 border border-slate-800 shadow-xl relative overflow-hidden text-white group">
            <div className="absolute top-0 right-0 w-24 h-24 bg-indigo-500/20 rounded-bl-full -z-10 blur-xl group-hover:scale-150 transition-transform duration-500" />
            <Building2 className="w-10 h-10 text-indigo-400 mb-6" />
            <h3 className="text-2xl font-bold mb-2">Big MNC</h3>
            <p className="text-slate-400 font-medium mb-6">Enterprise Scale</p>
            <ul className="space-y-4">
              <li className="flex items-start gap-3 text-slate-300"><CheckCircle2 className="w-5 h-5 text-indigo-500 shrink-0 mt-0.5" /> Multi-company consolidation (Group P&L)</li>
              <li className="flex items-start gap-3 text-slate-300"><CheckCircle2 className="w-5 h-5 text-indigo-500 shrink-0 mt-0.5" /> Custom Approval Workflows</li>
              <li className="flex items-start gap-3 text-slate-300"><CheckCircle2 className="w-5 h-5 text-indigo-500 shrink-0 mt-0.5" /> Granular Role-Based Access (RBAC)</li>
              <li className="flex items-start gap-3 text-slate-300"><CheckCircle2 className="w-5 h-5 text-indigo-500 shrink-0 mt-0.5" /> Open API & Webhooks</li>
            </ul>
          </motion.div>
          
        </div>
      </section>

      {/* 5. INTERACTIVE TABS: INDUSTRY TEMPLATES */}
      <section className="py-32 px-6 bg-slate-100 border-y border-slate-200 overflow-hidden">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-4xl md:text-5xl font-bold text-slate-900 mb-6">Designed for your exact industry.</h2>
            <p className="text-xl text-slate-600 max-w-2xl mx-auto">Lekhva adapts its fields, compliance rules, and invoice templates based on your specific sector.</p>
          </div>

          <div className="flex flex-col lg:flex-row gap-12 items-center">
            {/* Tabs */}
            <div className="flex flex-col gap-4 w-full lg:w-1/3">
              {industries.map((ind) => {
                const isActive = activeIndustry.id === ind.id;
                const Icon = ind.icon;
                return (
                  <button 
                    key={ind.id}
                    onClick={() => setActiveIndustry(ind)}
                    className={`flex items-center gap-4 p-6 rounded-2xl text-left transition-all duration-300 ${
                      isActive ? "bg-white shadow-lg border border-slate-200 scale-105" : "bg-transparent border border-transparent hover:bg-slate-200/50"
                    }`}
                  >
                    <div className={`w-12 h-12 rounded-xl flex items-center justify-center shrink-0 ${isActive ? "bg-blue-600 text-white" : "bg-slate-200 text-slate-600"}`}>
                      <Icon className="w-6 h-6" />
                    </div>
                    <div>
                      <h4 className={`text-lg font-bold ${isActive ? "text-slate-900" : "text-slate-600"}`}>{ind.name}</h4>
                    </div>
                  </button>
                )
              })}
            </div>

            {/* Content Display */}
            <div className="w-full lg:w-2/3">
              <AnimatePresence mode="wait">
                <motion.div
                  key={activeIndustry.id}
                  initial={{ opacity: 0, x: 20 }}
                  animate={{ opacity: 1, x: 0 }}
                  exit={{ opacity: 0, x: -20 }}
                  transition={{ duration: 0.3 }}
                  className="bg-white rounded-3xl p-10 md:p-16 border border-slate-200 shadow-xl"
                >
                  <activeIndustry.icon className="w-16 h-16 text-blue-600 mb-8" />
                  <h3 className="text-3xl md:text-4xl font-bold text-slate-900 mb-6">{activeIndustry.name} Compliance</h3>
                  <p className="text-xl text-slate-600 leading-relaxed mb-8">{activeIndustry.desc}</p>
                  
                  {/* Mock Industry Data Visualization */}
                  <div className="bg-slate-50 p-6 rounded-xl border border-slate-100 flex gap-4 items-center">
                    <div className="w-3 h-3 rounded-full bg-emerald-500 animate-pulse" />
                    <span className="text-slate-700 font-medium">Auto-configured for {activeIndustry.name} sector</span>
                  </div>
                </motion.div>
              </AnimatePresence>
            </div>
          </div>
        </div>
      </section>

      {/* 6. M-CLASS AI OCR DEMO */}
      <section className="py-32 px-6 max-w-7xl mx-auto">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-16 items-center">
           <div>
              <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-purple-50 border border-purple-100 text-purple-700 text-sm font-semibold mb-8">
                Powered by Google Gemini
              </div>
              <h2 className="text-4xl md:text-5xl font-bold text-slate-900 mb-6 tracking-tight">M-Class AI Engine</h2>
              <p className="text-lg text-slate-600 mb-8 leading-relaxed">
                Stop manually entering purchase bills. Drop an invoice photo into Lekhva and our AI extracts the vendor, line items, amounts, and GST details instantly. 
              </p>
              <ul className="space-y-4 mb-8">
                <li className="flex items-center gap-3 text-slate-700 font-medium"><ScanSearch className="w-5 h-5 text-purple-600"/> Smart OCR Invoice Scanning</li>
                <li className="flex items-center gap-3 text-slate-700 font-medium"><Calculator className="w-5 h-5 text-purple-600"/> AI-assisted Bank Reconciliation</li>
                <li className="flex items-center gap-3 text-slate-700 font-medium"><LineChart className="w-5 h-5 text-purple-600"/> Predictive Cash Flow Modeling</li>
              </ul>
           </div>
           
           <div className="bg-white p-8 rounded-3xl border border-slate-200 shadow-xl relative overflow-hidden group">
              <div className="absolute inset-0 bg-gradient-to-tr from-purple-500/5 to-transparent pointer-events-none" />
              <div className="relative z-10 space-y-6">
                
                {/* Mock Upload Box */}
                <div className="w-full h-32 border-2 border-dashed border-slate-300 rounded-xl flex flex-col items-center justify-center bg-slate-50 relative overflow-hidden">
                  <div className="absolute top-0 left-0 h-full w-2 bg-purple-500 shadow-[0_0_20px_#a855f7] group-hover:translate-x-[400px] transition-transform duration-[2s] ease-linear repeat-infinite" />
                  <ScanSearch className="w-8 h-8 text-slate-400 mb-2" />
                  <span className="text-slate-500 font-medium">Scanning "vendor_bill.jpg"...</span>
                </div>

                {/* Mock Results */}
                <div className="space-y-3">
                  <div className="flex justify-between items-center p-3 bg-emerald-50 text-emerald-700 rounded-lg border border-emerald-100">
                    <span className="font-semibold text-sm">Vendor Detected:</span>
                    <span>Acme Supplies Ltd.</span>
                  </div>
                  <div className="flex justify-between items-center p-3 bg-emerald-50 text-emerald-700 rounded-lg border border-emerald-100">
                    <span className="font-semibold text-sm">GSTIN Extracted:</span>
                    <span>27AADCB2230M1Z2</span>
                  </div>
                  <div className="flex justify-between items-center p-3 bg-emerald-50 text-emerald-700 rounded-lg border border-emerald-100">
                    <span className="font-semibold text-sm">Taxable Amount:</span>
                    <span>₹45,000.00</span>
                  </div>
                </div>

              </div>
           </div>
        </div>
      </section>

      {/* 7. FINAL CTA */}
      <section className="py-32 px-6 text-center bg-[#0B1120] text-white">
        <div className="max-w-4xl mx-auto">
          <h2 className="text-4xl md:text-6xl font-bold mb-6 tracking-tight">The last software migration you will ever do.</h2>
          <p className="text-xl text-slate-400 mb-12">
            Start on the Free tier for your retail shop, and seamlessly upgrade to Enterprise as you build your empire.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link href="/pricing" className="bg-blue-600 text-white px-10 py-5 rounded-xl text-xl font-bold hover:bg-blue-500 hover:-translate-y-1 transition-all shadow-lg shadow-blue-600/25">
              View Pricing & Plans
            </Link>
            <Link href="/contact" className="bg-white/5 border border-white/10 text-white px-10 py-5 rounded-xl text-xl font-bold hover:bg-white/10 transition-colors">
              Talk to Sales
            </Link>
          </div>
        </div>
      </section>

    </div>
  );
}
