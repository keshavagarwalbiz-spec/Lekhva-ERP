
import { Check, Plus } from "lucide-react";

export default function PricingPage() {
  return (
    <div className="min-h-screen px-6 py-20 md:py-32 max-w-7xl mx-auto">
      <div className="text-center mb-20">
        <h1 className="text-4xl md:text-6xl font-bold text-white mb-6">Simple, transparent pricing</h1>
        <p className="text-xl text-neutral-400 max-w-2xl mx-auto">
          One platform. Zero compromises. Scale from your first invoice to an enterprise-grade ERP.
        </p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-24">
        {/* Free */}
        <div className="bg-neutral-900/40 border border-white/5 p-8 rounded-3xl flex flex-col">
          <h3 className="text-2xl font-semibold text-white mb-2">Free</h3>
          <p className="text-neutral-400 mb-6 text-sm">Perfect for freelancers and new sole proprietorships.</p>
          <div className="text-4xl font-bold text-white mb-6">₹0<span className="text-base text-neutral-500 font-normal">/mo</span></div>
          <div className="text-sm font-medium text-amber-500 mb-6 pb-6 border-b border-white/10">1 User • 1 Company</div>
          <ul className="space-y-4 mb-8 flex-1">
            {["50 Invoices / month", "Basic Reports", "1 Standard Template", "Community Support"].map((feature, i) => (
              <li key={i} className="flex items-start gap-3 text-sm text-neutral-300">
                <Check className="w-4 h-4 text-amber-500 shrink-0 mt-0.5" /> {feature}
              </li>
            ))}
          </ul>
          <button className="w-full py-3 rounded-xl bg-white/5 hover:bg-white/10 text-white font-medium border border-white/10 transition-colors">Start Free</button>
        </div>

        {/* Growth */}
        <div className="bg-neutral-900/40 border border-white/5 p-8 rounded-3xl flex flex-col">
          <h3 className="text-2xl font-semibold text-white mb-2">Growth</h3>
          <p className="text-neutral-400 mb-6 text-sm">For growing small businesses needing more capacity.</p>
          <div className="text-4xl font-bold text-white mb-6">₹999<span className="text-base text-neutral-500 font-normal">/mo</span></div>
          <div className="text-sm font-medium text-amber-500 mb-6 pb-6 border-b border-white/10">5 Users • 2 Companies</div>
          <ul className="space-y-4 mb-8 flex-1">
            {["Unlimited Invoices", "1 Sales Channel", "Basic HR (≤10 emp)", "All 30+ Print Templates", "Standard Support"].map((feature, i) => (
              <li key={i} className="flex items-start gap-3 text-sm text-neutral-300">
                <Check className="w-4 h-4 text-amber-500 shrink-0 mt-0.5" /> {feature}
              </li>
            ))}
          </ul>
          <button className="w-full py-3 rounded-xl bg-white/5 hover:bg-white/10 text-white font-medium border border-white/10 transition-colors">Start 14-Day Trial</button>
        </div>

        {/* Pro */}
        <div className="bg-neutral-900 border border-amber-500/30 p-8 rounded-3xl flex flex-col relative shadow-[0_0_40px_rgba(245,158,11,0.1)] transform lg:-translate-y-4">
          <div className="absolute -top-3 left-1/2 -translate-x-1/2 bg-amber-500 text-black px-3 py-1 rounded-full text-[10px] font-bold uppercase tracking-wide">Most Popular</div>
          <h3 className="text-2xl font-semibold text-white mb-2">Pro</h3>
          <p className="text-neutral-400 mb-6 text-sm">The complete suite for established companies.</p>
          <div className="text-4xl font-bold text-white mb-6">₹2,999<span className="text-base text-neutral-500 font-normal">/mo</span></div>
          <div className="text-sm font-medium text-amber-500 mb-6 pb-6 border-b border-white/10">15 Users • 5 Companies</div>
          <ul className="space-y-4 mb-8 flex-1">
            {["All Sales Channels", "E-Invoicing & E-Way Bill", "Full HRMS Suite", "ITR & TDS Filing", "Visual Template Designer", "Priority Support"].map((feature, i) => (
              <li key={i} className="flex items-start gap-3 text-sm text-neutral-300">
                <Check className="w-4 h-4 text-amber-500 shrink-0 mt-0.5" /> {feature}
              </li>
            ))}
          </ul>
          <button className="w-full py-3 rounded-xl bg-amber-500 hover:bg-amber-400 text-black font-bold transition-colors">Start 14-Day Trial</button>
        </div>

        {/* Enterprise */}
        <div className="bg-neutral-900/40 border border-white/5 p-8 rounded-3xl flex flex-col">
          <h3 className="text-2xl font-semibold text-white mb-2">Enterprise</h3>
          <p className="text-neutral-400 mb-6 text-sm">Custom limits, on-premise deployments, and dedicated support.</p>
          <div className="text-4xl font-bold text-white mb-6">Custom</div>
          <div className="text-sm font-medium text-amber-500 mb-6 pb-6 border-b border-white/10">Unlimited Users & Companies</div>
          <ul className="space-y-4 mb-8 flex-1">
            {["Open API Access", "Dedicated Account Manager", "Custom Integrations", "On-Premise Server Option", "24/7 Phone Support"].map((feature, i) => (
              <li key={i} className="flex items-start gap-3 text-sm text-neutral-300">
                <Check className="w-4 h-4 text-amber-500 shrink-0 mt-0.5" /> {feature}
              </li>
            ))}
          </ul>
          <button className="w-full py-3 rounded-xl bg-white/5 hover:bg-white/10 text-white font-medium border border-white/10 transition-colors">Contact Sales</button>
        </div>
      </div>

      {/* Add-ons */}
      <div className="max-w-4xl mx-auto bg-black/40 backdrop-blur-md border border-white/10 rounded-3xl p-8 md:p-12">
        <h2 className="text-2xl font-bold text-white mb-8">Modular Add-ons</h2>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-x-12 gap-y-6">
          <div className="flex justify-between items-center border-b border-white/5 pb-4">
            <span className="text-neutral-300 flex items-center gap-2"><Plus className="w-4 h-4 text-neutral-500"/> Pharma / Jewelry / Mfg</span>
            <span className="text-white font-medium">+₹499-699/mo</span>
          </div>
          <div className="flex justify-between items-center border-b border-white/5 pb-4">
            <span className="text-neutral-300 flex items-center gap-2"><Plus className="w-4 h-4 text-neutral-500"/> Full HRMS + Payroll (>10 emp)</span>
            <span className="text-white font-medium">+₹999/mo</span>
          </div>
          <div className="flex justify-between items-center border-b border-white/5 pb-4">
            <span className="text-neutral-300 flex items-center gap-2"><Plus className="w-4 h-4 text-neutral-500"/> Employee Portal</span>
            <span className="text-white font-medium">+₹499/mo</span>
          </div>
          <div className="flex justify-between items-center border-b border-white/5 pb-4">
            <span className="text-neutral-300 flex items-center gap-2"><Plus className="w-4 h-4 text-neutral-500"/> CA-Free Tax Suite</span>
            <span className="text-white font-medium">+₹399/mo</span>
          </div>
          <div className="flex justify-between items-center border-b border-white/5 pb-4">
            <span className="text-neutral-300 flex items-center gap-2"><Plus className="w-4 h-4 text-neutral-500"/> Financial Intelligence & AI</span>
            <span className="text-white font-medium">+₹499/mo</span>
          </div>
          <div className="flex justify-between items-center border-b border-white/5 pb-4">
            <span className="text-neutral-300 flex items-center gap-2"><Plus className="w-4 h-4 text-neutral-500"/> Invoice AI OCR + NLP</span>
            <span className="text-white font-medium">+₹599/mo</span>
          </div>
          <div className="flex justify-between items-center border-b border-white/5 pb-4">
            <span className="text-neutral-300 flex items-center gap-2"><Plus className="w-4 h-4 text-neutral-500"/> Project & Job Costing</span>
            <span className="text-white font-medium">+₹399/mo</span>
          </div>
          <div className="flex justify-between items-center border-b border-white/5 pb-4">
            <span className="text-neutral-300 flex items-center gap-2"><Plus className="w-4 h-4 text-neutral-500"/> Open API Access</span>
            <span className="text-white font-medium">+₹499/mo</span>
          </div>
        </div>
      </div>
    </div>
  );
}
