"use client";

import { motion, AnimatePresence } from "framer-motion";
import Link from "next/link";
import { useState, useEffect } from "react";
import { 
  ArrowRight, CheckCircle2, ShieldCheck, Zap, User, Laptop, Store, 
  Calculator, FileCheck2, Server, Camera, Video, TrendingUp, HomeIcon, ScanSearch, LineChart, Code2
} from "lucide-react";

const industries = [
  { id: "freelance", name: "Freelancers", icon: Laptop, desc: "Professional invoicing, automatic late fee reminders, and client management." },
  { id: "creator", name: "Creators", icon: Video, desc: "Track YouTube/Adsense income, manage sponsorships, and track equipment depreciation." },
  { id: "trader", name: "Traders & Crypto", icon: TrendingUp, desc: "Automated capital gains tax tracking, P&L across multiple exchanges, and crypto sync." },
  { id: "household", name: "Households", icon: HomeIcon, desc: "Shared family budgets, subscription tracking, and automatic UPI expense categorization." }
];

export default function Home() {
  const [activeIndustry, setActiveIndustry] = useState(industries[0]);
  
  // Terminal typing effect state
  const [terminalText, setTerminalText] = useState("");
  const fullText = "> initializing lekhva...
> connecting_bank_feeds [ok]
> syncing_upi_transactions [ok]
> running_tax_optimizer [ready]

System Online. Awaiting commands.";

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
            From everyday expenses.<br/>
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-400 to-indigo-400">
              To your side hustle.
            </span>
          </motion.h1>
          
          <motion.p 
            initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.2 }}
            className="text-xl md:text-2xl text-slate-400 max-w-3xl mb-12 leading-relaxed"
          >
            We've got it all covered. Lekhva unifies your personal finances, freelance invoicing, automatic tax tracking, and bank sync into one highly scalable cloud app.
          </motion.p>
          
          <motion.div 
            initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.3 }}
            className="flex flex-col sm:flex-row gap-4 w-full sm:w-auto"
          >
            <Link href="/pricing" className="bg-blue-600 text-white px-8 py-4 rounded-xl text-lg font-bold hover:bg-blue-500 hover:-translate-y-1 transition-all shadow-lg shadow-blue-600/25 flex items-center justify-center gap-2">
              Start Free Trial <ArrowRight className="w-5 h-5" />
            </Link>
            <Link href="/contact" className="bg-white/5 text-white border border-white/10 backdrop-blur-md px-8 py-4 rounded-xl text-lg font-bold hover:bg-white/10 transition-colors flex items-center justify-center">
              Download the App
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
                <h4 className="text-xl font-bold text-white mb-1">Bank-Grade Security</h4>
                <p className="text-slate-400 text-sm">Your personal financial data is secured with 256-bit AES encryption.</p>
              </div>
            </div>
            
            <div className="flex items-start gap-4">
              <div className="w-10 h-10 rounded-full bg-indigo-500/20 flex items-center justify-center shrink-0 border border-indigo-500/30">
                <Calculator className="w-5 h-5 text-indigo-400" />
              </div>
              <div>
                <h4 className="text-xl font-bold text-white mb-1">Auto-Sync Transactions</h4>
                <p className="text-slate-400 text-sm">Connect 100+ banks to automatically categorize your daily spends.</p>
              </div>
            </div>

            <div className="flex items-start gap-4">
              <div className="w-10 h-10 rounded-full bg-emerald-500/20 flex items-center justify-center shrink-0 border border-emerald-500/30">
                <FileCheck2 className="w-5 h-5 text-emerald-400" />
              </div>
              <div>
                <h4 className="text-xl font-bold text-white mb-1">1-Click Tax Filing</h4>
                <p className="text-slate-400 text-sm">Automatically generate your ITR forms based on your income tracking.</p>
              </div>
            </div>
          </div>
        </motion.div>
      </section>

      {/* 3. STATS BAR */}
      <section className="border-b border-slate-200 bg-white py-12 px-6">
        <div className="max-w-7xl mx-auto grid grid-cols-2 md:grid-cols-4 gap-8 divide-x divide-slate-100 text-center">
          <div><h4 className="text-4xl font-bold text-slate-900 mb-2">12</h4><p className="text-sm font-semibold text-slate-500 uppercase">Smart Trackers</p></div>
          <div><h4 className="text-4xl font-bold text-blue-600 mb-2">100+</h4><p className="text-sm font-semibold text-slate-500 uppercase">Banks Supported</p></div>
          <div><h4 className="text-4xl font-bold text-slate-900 mb-2">100%</h4><p className="text-sm font-semibold text-slate-500 uppercase">Secure</p></div>
          <div><h4 className="text-4xl font-bold text-blue-600 mb-2">30+</h4><p className="text-sm font-semibold text-slate-500 uppercase">Invoice Templates</p></div>
        </div>
      </section>

      {/* 4. THE SCALE SECTION: INDIVIDUAL TO BUSINESS */}
      <section className="py-32 px-6 max-w-7xl mx-auto">
        <div className="text-center mb-20">
          <h2 className="text-4xl md:text-5xl font-bold text-slate-900 mb-6 tracking-tight">Built to scale with your life.</h2>
          <p className="text-xl text-slate-600 max-w-2xl mx-auto">From tracking personal expenses to running a full-time gig. Turn features on and off as you need them.</p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          
          <motion.div initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} className="bg-white rounded-3xl p-8 border border-slate-200 shadow-lg hover:shadow-xl transition-shadow relative overflow-hidden group">
            <div className="absolute top-0 right-0 w-24 h-24 bg-emerald-50 rounded-bl-full -z-10 group-hover:scale-150 transition-transform duration-500" />
            <User className="w-10 h-10 text-emerald-600 mb-6" />
            <h3 className="text-2xl font-bold text-slate-900 mb-2">Individuals</h3>
            <p className="text-slate-500 font-medium mb-6">Personal Finance</p>
            <ul className="space-y-4">
              <li className="flex items-start gap-3 text-slate-600"><CheckCircle2 className="w-5 h-5 text-emerald-500 shrink-0 mt-0.5" /> Auto-sync UPI transactions</li>
              <li className="flex items-start gap-3 text-slate-600"><CheckCircle2 className="w-5 h-5 text-emerald-500 shrink-0 mt-0.5" /> Split bills with friends</li>
              <li className="flex items-start gap-3 text-slate-600"><CheckCircle2 className="w-5 h-5 text-emerald-500 shrink-0 mt-0.5" /> Monthly budget tracking</li>
            </ul>
          </motion.div>

          <motion.div initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: 0.1 }} className="bg-blue-600 rounded-3xl p-8 border border-blue-500 shadow-xl shadow-blue-600/20 relative overflow-hidden text-white transform md:-translate-y-4">
            <div className="absolute top-0 right-0 w-32 h-32 bg-blue-500/50 rounded-bl-full -z-10 blur-xl" />
            <Laptop className="w-10 h-10 text-blue-200 mb-6" />
            <h3 className="text-2xl font-bold mb-2">Freelancers</h3>
            <p className="text-blue-200 font-medium mb-6">The Side Hustle</p>
            <ul className="space-y-4">
              <li className="flex items-start gap-3 text-blue-50"><CheckCircle2 className="w-5 h-5 text-blue-300 shrink-0 mt-0.5" /> Professional PDF Invoicing</li>
              <li className="flex items-start gap-3 text-blue-50"><CheckCircle2 className="w-5 h-5 text-blue-300 shrink-0 mt-0.5" /> Payment links integration</li>
              <li className="flex items-start gap-3 text-blue-50"><CheckCircle2 className="w-5 h-5 text-blue-300 shrink-0 mt-0.5" /> Automatic late fee reminders</li>
              <li className="flex items-start gap-3 text-blue-50"><CheckCircle2 className="w-5 h-5 text-blue-300 shrink-0 mt-0.5" /> Deductible expense tracking</li>
            </ul>
          </motion.div>

          <motion.div initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: 0.2 }} className="bg-slate-900 rounded-3xl p-8 border border-slate-800 shadow-xl relative overflow-hidden text-white group">
            <div className="absolute top-0 right-0 w-24 h-24 bg-indigo-500/20 rounded-bl-full -z-10 blur-xl group-hover:scale-150 transition-transform duration-500" />
            <Store className="w-10 h-10 text-indigo-400 mb-6" />
            <h3 className="text-2xl font-bold mb-2">Small Biz</h3>
            <p className="text-slate-400 font-medium mb-6">Going Pro</p>
            <ul className="space-y-4">
              <li className="flex items-start gap-3 text-slate-300"><CheckCircle2 className="w-5 h-5 text-indigo-500 shrink-0 mt-0.5" /> Automatic GST / Tax filing</li>
              <li className="flex items-start gap-3 text-slate-300"><CheckCircle2 className="w-5 h-5 text-indigo-500 shrink-0 mt-0.5" /> Employee payroll & HR</li>
              <li className="flex items-start gap-3 text-slate-300"><CheckCircle2 className="w-5 h-5 text-indigo-500 shrink-0 mt-0.5" /> Multi-bank account sync</li>
              <li className="flex items-start gap-3 text-slate-300"><CheckCircle2 className="w-5 h-5 text-indigo-500 shrink-0 mt-0.5" /> Real-time Profit & Loss</li>
            </ul>
          </motion.div>
          
        </div>
      </section>

      {/* 5. INTERACTIVE TABS */}
      <section className="py-32 px-6 bg-slate-100 border-y border-slate-200 overflow-hidden">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-4xl md:text-5xl font-bold text-slate-900 mb-6">Designed for your lifestyle.</h2>
            <p className="text-xl text-slate-600 max-w-2xl mx-auto">Lekhva adapts its dashboard, tracking rules, and tools based on how you make and spend money.</p>
          </div>

          <div className="flex flex-col lg:flex-row gap-12 items-center">
            {/* Tabs */}
            <div className="w-full lg:w-1/3 flex flex-col gap-2">
              {industries.map((ind) => (
                <button
                  key={ind.id}
                  onClick={() => setActiveIndustry(ind)}
                  className={`w-full text-left p-5 rounded-2xl flex items-center gap-4 transition-all ${
                    activeIndustry.id === ind.id 
                      ? 'bg-white shadow-md border border-slate-200' 
                      : 'hover:bg-slate-200/50 border border-transparent'
                  }`}
                >
                  <div className={`p-3 rounded-xl ${activeIndustry.id === ind.id ? 'bg-blue-50 text-blue-600' : 'bg-slate-200 text-slate-500'}`}>
                    <ind.icon className="w-6 h-6" />
                  </div>
                  <span className={`font-semibold text-lg ${activeIndustry.id === ind.id ? 'text-slate-900' : 'text-slate-600'}`}>
                    {ind.name}
                  </span>
                </button>
              ))}
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
                  <h3 className="text-3xl md:text-4xl font-bold text-slate-900 mb-6">{activeIndustry.name} Tools</h3>
                  <p className="text-xl text-slate-600 leading-relaxed mb-8">{activeIndustry.desc}</p>
                  
                  {/* Mock Data Visualization */}
                  <div className="bg-slate-50 p-6 rounded-xl border border-slate-100 flex gap-4 items-center">
                    <div className="w-3 h-3 rounded-full bg-emerald-500 animate-pulse" />
                    <span className="text-slate-700 font-medium">Dashboard customized for {activeIndustry.name}</span>
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
              <h2 className="text-4xl md:text-5xl font-bold text-slate-900 mb-6 tracking-tight">AI Receipt Scanner</h2>
              <p className="text-lg text-slate-600 mb-8 leading-relaxed">
                Stop manually entering expenses. Take a photo of your restaurant bill or shopping receipt, and our AI extracts the merchant, items, and total amount instantly. 
              </p>
              <ul className="space-y-4 mb-8">
                <li className="flex items-center gap-3 text-slate-700 font-medium"><ScanSearch className="w-5 h-5 text-purple-600"/> Smart OCR Receipt Scanning</li>
                <li className="flex items-center gap-3 text-slate-700 font-medium"><Calculator className="w-5 h-5 text-purple-600"/> AI-assisted Categorization</li>
                <li className="flex items-center gap-3 text-slate-700 font-medium"><LineChart className="w-5 h-5 text-purple-600"/> Spending Insights</li>
              </ul>
           </div>
           
           <div className="bg-white p-8 rounded-3xl border border-slate-200 shadow-xl relative overflow-hidden group">
              <div className="absolute inset-0 bg-gradient-to-tr from-purple-500/5 to-transparent pointer-events-none" />
              <div className="relative z-10 space-y-6">
                
                {/* Mock Upload Box */}
                <div className="w-full h-32 border-2 border-dashed border-slate-300 rounded-xl flex flex-col items-center justify-center bg-slate-50 relative overflow-hidden">
                  <div className="absolute top-0 left-0 h-full w-2 bg-purple-500 shadow-[0_0_20px_#a855f7] group-hover:translate-x-[400px] transition-transform duration-[2s] ease-linear repeat-infinite" />
                  <ScanSearch className="w-8 h-8 text-slate-400 mb-2" />
                  <span className="text-slate-500 font-medium">Scanning "dinner_receipt.jpg"...</span>
                </div>

                {/* Mock Results */}
                <div className="space-y-3">
                  <div className="flex justify-between items-center p-3 bg-emerald-50 text-emerald-700 rounded-lg border border-emerald-100">
                    <span className="font-semibold text-sm">Merchant Detected:</span>
                    <span>Starbucks</span>
                  </div>
                  <div className="flex justify-between items-center p-3 bg-emerald-50 text-emerald-700 rounded-lg border border-emerald-100">
                    <span className="font-semibold text-sm">Category:</span>
                    <span>Food & Dining</span>
                  </div>
                  <div className="flex justify-between items-center p-3 bg-emerald-50 text-emerald-700 rounded-lg border border-emerald-100">
                    <span className="font-semibold text-sm">Total Amount:</span>
                    <span>,1450.00</span>
                  </div>
                </div>

              </div>
           </div>
        </div>
      </section>

      {/* 7. FINAL CTA */}
      <section className="py-32 px-6 text-center bg-[#0B1120] text-white">
        <div className="max-w-4xl mx-auto">
          <h2 className="text-4xl md:text-6xl font-bold mb-6 tracking-tight">The only money app you will ever need.</h2>
          <p className="text-xl text-slate-400 mb-12">
            Start on the Free tier for your personal finances, and seamlessly upgrade as your side hustle grows.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link href="/pricing" className="bg-blue-600 text-white px-10 py-5 rounded-xl text-xl font-bold hover:bg-blue-500 hover:-translate-y-1 transition-all shadow-lg shadow-blue-600/25">
              View Pricing & Plans
            </Link>
            <Link href="/contact" className="bg-white/5 border border-white/10 text-white px-10 py-5 rounded-xl text-xl font-bold hover:bg-white/10 transition-colors">
              Download App
            </Link>
          </div>
        </div>
      </section>

    </div>
  );
}
